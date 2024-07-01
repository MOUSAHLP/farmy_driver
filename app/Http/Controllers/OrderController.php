<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\User;
use App\Services\OrderService;
use App\Traits\CoreRequests;
use Illuminate\Http\Request;
use App\Traits\NotificationHelper;
use App\Enums\NotificationsTypes;
use App\Models\Notification;
use App\Enums\OrderStatus;
use App\Helpers\AuthHelper;

class OrderController extends Controller
{
    use CoreRequests;
    public function __construct(private OrderService $orderService)
    {
    }

    public function acceptOrderByDriver($order_id)
    {

        $order = Order::find($order_id);
        if (!$order) {
            return $this->errorResponse(
                "orders.NotFound",
                404
            );
        }

        $res = $this->orderService->acceptOrderByDriver($order);

        if ($res) {
            return $this->successResponse(
                null,
                'orders.Accepted'
            );
        } else {
            return $this->errorResponse(
                "orders.Already_Accepted",
                404
            );
        }
    }
    public function checkCodeExists(Request $request, $id)
    {

        $code = $request->input('code');

        $order = Order::where('code', $code)->first();


        if ($order) {


            return response()->json([$order, "code is true"]);
        } else {

            return response()->json([$order, "code is false"]);
        }
    }
    public function rejectOrderByDriver($order_id)
    {
        $order = Order::find($order_id);
        if (!$order) {
            return $this->errorResponse(
                "orders.NotFound",
                404
            );
        }

        $res = $this->orderService->rejectOrderByDriver($order);

        if ($res) {
            return $this->successResponse(
                null,
                'orders.Rejected'
            );
        } else {
            return $this->errorResponse(
                "orders.Already_Rejected",
                404
            );
        }
    }

    public function deliverOrderByDriver(Request $request, $order_id)
    {

        $code = $request->input('code');

        $order = Order::find($order_id);
        if (!$order) {
            return $this->errorResponse(
                "orders.NotFound",
                404
            );
        }
        if (empty($code)) {

            $order = Order::find($order_id);
            $client = User::find($order->user_id);
            $data = [
                "title" => __("messages.orders.code.title") . " " . $order->code,
                "body" =>   __("messages.orders.code.body"),
                "order_id" =>   $order->id,
                'status' => $order->status,
            ];
            NotificationHelper::sendPushNotification([$client->fcm_token], $data, NotificationsTypes::PushNotifications);
            Notification::create([
                'type'            =>  NotificationsTypes::PushNotifications,
                'notifiable_type' => 'App\Models\User',
                'notifiable_id'   => $order->user_id,
                'data'            => $data,

            ]);
            $order->update([
                "status" => OrderStatus::Deliverd
            ]);
            return $this->successResponse(
                $data,
                'orders.OnDelivery'
            );
        }
        $order = Order::where('code', $code)->first();

        if ($order) {

            $driver_id = AuthHelper::userAuth()->id;

            if ($order->driver_id == $driver_id) {
                $order = Order::find($order_id);
                $client = User::find($order->user_id);

                $data["order_total"] = $order->total;
                return $this->successResponse(
                    $data,
                    'orders.Delivered'
                );
            } else {
                return $this->errorResponse(
                    "orders.OtherDriver",
                    400
                );
            }
        } else {
            return $this->errorResponse(
                "orders.code.error",
                400
            );
        }
    }

    public function makeOrderPaid($order_id)
    {
        $order = Order::find($order_id);
        if (!$order)  return $this->errorResponse("orders.NotFound", 404);

        $res = $this->orderService->makeOrderPaid($order);

        if ($res) {
            return $this->successResponse(
                null,
                'orders.Paid'
            );
        } else {
            return $this->errorResponse(
                "orders.Already_Paid",
                400
            );
        }
    }

    public function acceptAssignedOrderByDriver($order_id)
    {

        $order = Order::find($order_id);
        if (!$order) {
            return $this->errorResponse(
                "orders.NotFound",
                404
            );
        }

        $res = $this->orderService->acceptAssignedOrderByDriver($order);

        if ($res) {
            return $this->successResponse(
                null,
                'orders.Accepted'
            );
        } else {
            return $this->errorResponse(
                "orders.Already_Accepted",
                404
            );
        }
    }
}
