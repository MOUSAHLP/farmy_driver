<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Services\OrderService;
use App\Traits\CoreRequests;

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

    public function deliverOrderByDriver($order_id)
    {
        $order = Order::find($order_id);
        if (!$order) {
            return $this->errorResponse(
                "orders.NotFound",
                404
            );
        }

        $res = $this->orderService->deliverOrderByDriver($order);

        if ($res) {
            return $this->successResponse(
                null,
                'orders.Delivered'
            );
        } else {
            return $this->errorResponse(
                "orders.OtherDriver",
                400
            );
        }
    }
}
