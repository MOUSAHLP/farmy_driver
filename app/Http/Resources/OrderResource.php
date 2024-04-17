<?php

namespace App\Http\Resources;

use App\Enums\ChangeEnums;
use App\Enums\OrderStatus;
use App\Helpers\OrderResourcsesHelper;
use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;

class OrderResource extends JsonResource
{

    public function toArray($request)
    {
        $actionMethod = $request->route()->getActionMethod();
        return match ($actionMethod) {
            'getHomePage' => $this->getHomeResource(),
            'getLastFiveOrdersPending' => $this->getHomeResource(),
            'getDriverOrders' => $this->getgetDriverOrdersResource(),
            'getOrdersHistory' => $this->getOrdersHistoryResource(),
            'getAllOrders' => $this->getAllOrdersResource(),
            'generatePdfAllOrdersForDriver' => $this->getAllOrdersResource(),

            default => $this->defaultResource(),
        };
    }

    public function defaultResource()
    {
        return [
            'id' => $this->id,
            'order_number' => $this->order_number,
            'user' => $this->user->only(['id', 'username', 'phone', 'email']),
            'driver' => ($this->driver ? $this->driver->only(['id', 'username', 'phone', 'email']) : null),
            'status' => OrderStatus::getName($this->status),
            'delivery_method' => $this->deliveryMethod->only(['id', 'name']),
            'payment_method' => $this->paymentMethod->only(['id', 'name']),
            'user_address' => $this->userAddress,
            'city' => ($this->city_id ? $this->city : null),
            'start_time' => $this->start_time,
            'end_time' => $this->end_time,
            'latitude' => $this->latitude,
            'longitude' => $this->longitude,
            'payment_status' => $this->payment_status,
            'coupon_discount' => $this->coupon_discount,
            'delivery_fee' => $this->delivery_fee,
            'sub_total' => $this->sub_total,
            'total' => $this->total,
            'date' => $this->date,
            'notes' => $this->notes,
            'changes' => ChangeEnums::toArray($this->changes),
            'order_details' => $this->orderDetails->map(function ($orderDetail) {
                return [
                    'id' => $orderDetail->id,
                    'order_id' => $orderDetail->order_id,
                    // 'product' => $this->productResource($orderDetail->product),
                    'quantity' => $orderDetail->quantity,
                    'price' => $orderDetail->price,
                    'status' => OrderStatus::getName($orderDetail->status),
                    'created_at' => $orderDetail->created_at,
                    'updated_at' => $orderDetail->updated_at,
                    'expected_time' => 30,
                ];
            }),
            'rate' => $this->rate,
            'invoice' => $this->invoice
        ];
    }


    public function getHomeResource()
    {

        $hour = Carbon::parse($this->created_at)->hour;
        $time = $hour >= 12 ? "PM " . Carbon::parse($this->created_at)->subHours(12)->format('H:i')
            : "AM " . Carbon::parse($this->created_at)->format('H:i');

        return [
            'id' => $this->id,
            'order_number' => $this->order_number,
            'location' => $this->userAddress ? $this->userAddress->address : null,
            'status' => __("messages.pending"),
            'date' =>  Carbon::parse($this->created_at)->format('d/m/y'),
            'time' => $time,
        ];
    }


    public function getAllOrdersResource()
    {
        return [
            'id' => $this->id,
            'order_number' => $this->order_number,
            'status' => OrderStatus::getName($this->status),
            'order_date' =>  Carbon::parse($this->created_at)->format('Y/m/d'),
            'total' => $this->total,
        ];
    }

    public function getOrdersHistoryResource()
    {
        return [
            'id' => $this->id,
            'order_number' => $this->order_number,
            'status' => OrderStatus::getName($this->status),
            'order_date' =>  Carbon::parse($this->created_at)->format('Y/m/d'),
            'total' => $this->total,
        ];
    }

    public function getgetDriverOrdersResource()
    {
        return [
            'id' => $this->id,
            'order_number' => $this->order_number,
            'user_phone' => $this->user->phone,
            'status' => OrderStatus::getName($this->status),
            'delivery_method' => OrderResourcsesHelper::getDelivery_method($this->deliveryMethod),
            'order_time' => OrderResourcsesHelper::getTime($this),
            'order_date' =>  Carbon::parse($this->created_at)->format('Y/m/d'),
            'user_address' => OrderResourcsesHelper::getAddress($this->userAddress),
        ];
    }
}
