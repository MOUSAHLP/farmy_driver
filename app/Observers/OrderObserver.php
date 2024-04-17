<?php

namespace App\Observers;

use App\Enums\NotificationsTypes;
use App\Enums\OrderStatus;
use App\Models\Order;
use App\Traits\NotificationHelper;

class OrderObserver
{
    public function updated(Order $order): void
    {
        if ($order->getOriginal()["status"] != $order->status && $order->status != OrderStatus::Pending ) {
            
            if($order->status == OrderStatus::Confirmed){
                $data = [
                    "title" => __('messages.Confirmed.title'),
                    "body" => __('messages.Confirmed.body'),
                ];
            } 
            else  if($order->status == OrderStatus::OnDelivery){
                $data = [
                    "title" => __('messages.OrderOnWay.title'),
                    "body" => __('messages.OrderOnWay.body'),
                ];
            } 
           else if($order->status == OrderStatus::Deliverd){
                $data = [
                    "title" => __('messages.OrderArrived.title'),
                    "body" => __('messages.OrderArrived.body'),
                ];
           }

           $data["order_id"] = $order->id;
           $data["order_status"] = $order->status;
           $data["driver_phone"] = $order->driver->phone;

            $fcm_token = Order::where("user_id", $order->user_id)->get()->first()->user->fcm_token;

            NotificationHelper::sendPushNotification([$fcm_token], $data, NotificationsTypes::Orders);
        }
    }
}
