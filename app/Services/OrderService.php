<?php

namespace App\Services;

use App\Enums\OrderStatus;
use App\Helpers\AuthHelper;
use App\Models\Product;

class OrderService
{

    public function __construct(private OrderDriverAcceptanceService $orderDriverAcceptanceService)
    {
    }

    public function acceptOrderByDriver($order)
    {
        if ($order->driver_id == null && $order->status == OrderStatus::Pending) {
            $driver_id = AuthHelper::userAuth()->id;

            $order->driver_id = $driver_id;
            $order->status =  OrderStatus::Confirmed;
            $order->save();

            $this->orderDriverAcceptanceService->createAccept([
                'order_id' => $order->id,
                'driver_id' => $driver_id,
            ]);

            return  true;
        }

        return  false;
    }

    public function rejectOrderByDriver($order)
    {
        $driver_id = AuthHelper::userAuth()->id;

        if ($order->driver_id == $driver_id) {

            $order->driver_id = null;

            $order->status =  OrderStatus::Pending;
            $order->save();

            $this->orderDriverAcceptanceService->createReject([
                'order_id' => $order->id,
                'driver_id' => $driver_id,
            ]);

            return  true;
        }

        return  false;
    }

    public function deliverOrderByDriver($order)
    {
        $driver_id = AuthHelper::userAuth()->id;

        if ($order->driver_id == $driver_id) {

            $order->payment_status = 1;
            $order->status =  OrderStatus::Deliverd;
            $order->save();

            return  true;
        }

        return  false;
    }
    public function makeOrderPaid($order)
    {
        $driver_id = AuthHelper::userAuth()->id;

        if ($order->payment_status == 1) {

            $order->payment_status = 1;
            $order->save();
            $this->decreaseProductsQuantity($order);
            return  true;
        }

        return  false;
    }
    public function decreaseProductsQuantity($order)
    {
        foreach ($order->orderDetails as $orderDetail) {
            if ($orderDetail->status) {
                $product = Product::find($orderDetail->product_id);
                $product->decrement('quantity', $orderDetail->quantity);
                if ($product->quantity < 0) {
                    $product->quantity = 0;
                    $product->save();
                }
            }
        }
    }
    public function acceptAssignedOrderByDriver($order)
    {
        $driver_id = AuthHelper::userAuth()->id;
        if ($order->status == OrderStatus::Pending && $order->driver_id == $driver_id) {

            $order->status =  OrderStatus::Confirmed;
            $order->save();

            $this->orderDriverAcceptanceService->createAccept([
                'order_id' => $order->id,
                'driver_id' => $driver_id,
            ]);

            return  true;
        }

        return  false;
    }
}
