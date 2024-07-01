<?php

namespace App\Observers;

use App\Enums\NotificationsTypes;
use App\Enums\OrderStatus;
use App\Models\Notification;
use App\Models\Order;
use App\Traits\NotificationHelper;
use Carbon\Carbon;
use App\Traits\RewardRequests;

class OrderObserver
{
    use RewardRequests;

    public function updating(Order $order): void
    {
        if ($order->getOriginal()["status"] != $order->status && $order->status != OrderStatus::Pending) {
            $data = [];
            // if the new status is Confirmed
            if ($order->status == OrderStatus::Confirmed && !$order->isDirty('confirmed_at')) {
                $data = [
                    "title" => __('messages.orders.Confirmed.title'),
                    "body" => __('messages.orders.Confirmed.body'),
                ];
                $order->confirmed_at = Carbon::now();
                $order->save();
            }
            // if the new status is OnDelivery
            else if ($order->status == OrderStatus::OnDelivery) {
                $data = [
                    "title" => __('messages.orders.OrderOnWay.title'),
                    "body" => __('messages.orders.OrderOnWay.body'),
                ];
            }
            // if the new status is Deliverd
            else if ($order->status == OrderStatus::Deliverd && !$order->isDirty('delivered_at')) {

                NotificationHelper::add_points_for_creating_order($order);

                $data = [
                    "title" => __('messages.orders.OrderArrived.title'),
                    "body" => __('messages.orders.OrderArrived.body'),
                ];
                $order->delivered_at = Carbon::now();
                $order->save();
            }

            if (
                $order->status != OrderStatus::Pending &&
                $order->status != OrderStatus::Cancelled &&
                $order->status != OrderStatus::Returned &&
                isset($data["title"])
            ) {
                $data["order_id"] = $order->id;
                $data["order_status"] = $order->status;
                $data["driver_phone"] = $order->driver->phone;

                $fcm_token = Order::where("user_id", $order->user_id)->get()->first()->user->fcm_token;

                NotificationHelper::sendPushNotification([$fcm_token], $data, NotificationsTypes::Orders);
                Notification::create([
                    'type'            =>  NotificationsTypes::PushNotifications,
                    'notifiable_type' => 'App\Models\User',
                    'notifiable_id'   => $order->user_id,
                    'data'            => $data,
                ]);
            }
        }
    }
}
