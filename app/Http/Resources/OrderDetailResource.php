<?php

namespace App\Http\Resources;

use App\Enums\ChangeEnums;
use App\Enums\OrderStatus;
use App\Helpers\OrderResourcsesHelper;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Helpers\AuthHelper;
use App\Models\User;
use App\Enums\MediaCollectionsNames;
use Carbon\Carbon;

class OrderDetailResource extends JsonResource
{
    public function toArray($request)
    {
        $actionMethod = $request->route()->getActionMethod();
        return match ($actionMethod) {
            'getDriverOrderDetail' => $this->getOrdersDetailResource(),
        };
    }

    public function getOrdersDetailResource()
    {
        return [
            'id' => $this->id,
            'order_number' => $this->order_number,
            'user_phone' => $this->user->phone,
            'status' => OrderStatus::getName($this->status),
            'delivery_method' => OrderResourcsesHelper::getDelivery_method($this->deliveryMethod),
            'order_time' => OrderResourcsesHelper::getTime($this),
            'order_date' =>  Carbon::parse($this->created_at)->format('Y/m/d'),
            'user_address' => OrderResourcsesHelper::getAddressDetailed($this->userAddress),
            'payment_method' => $this->paymentMethod->name,
            'payment_status' => $this->payment_status,
            'coupon_discount' => $this->coupon_discount,
            'delivery_fee' => $this->delivery_fee,
            'sub_total' => $this->sub_total,
            'total' => $this->total,
            'notes' => $this->notes,
            'changes' => ChangeEnums::toArray($this->changes),
            'deliveryAttributes' => OrderResourcsesHelper::getDeliveryAttribute($this->deliveryAttributes),
            'order_details' => OrderResourcsesHelper::getOrderDetail($this->orderDetails),
        ];
    }
}
