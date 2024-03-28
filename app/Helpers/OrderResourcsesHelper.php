<?php

namespace App\Helpers;

use App\Enums\MediaCollectionsNames;
use Carbon\Carbon;

class OrderResourcsesHelper
{
    public static function getTime($order)
    {
        $time = $order->created_at;
        if ($order->start_time != null) {
            $time = $order->start_time;
        }
        $hour = Carbon::parse($time)->hour;
        return $hour >= 12 ? "PM " . Carbon::parse($time)->subHours(12)->format('H:i')
            : "AM " . Carbon::parse($time)->format('H:i');
    }

    public static function getDelivery_method($deliveryMethod)
    {
        return $deliveryMethod->name . " (" . $deliveryMethod->time . ")";
    }
    public static function getAddress($userAddress)
    {
        return $userAddress->area . "," . $userAddress->street;
    }

    public static function getAddressDetailed($userAddress)
    {
        return $userAddress->area . "," . __("messages.street") . " (" . $userAddress->street . ") , " . __("messages.building") .  " (" . $userAddress->building . ") , " . __("messages.building_number") .  " (" . $userAddress->building_number . ")," . __("messages.floor") .  " (" . $userAddress->floor . ")";
    }

    public static function getDeliveryAttribute($deliveryAttributes)
    {
        return $deliveryAttributes->map(function ($deliveryAttribute) {
            return $deliveryAttribute->name;
        });
    }

    public static function getOrderDetail($orderDetails)
    {
        return $orderDetails
            ->filter(function ($orderDetail) {
                return $orderDetail->status;
            })
            ->values()
            ->map(function ($orderDetail) {
                return
                    [
                        'id'         => $orderDetail->id,
                        'name'       => $orderDetail->product->name,
                        'image'      => $orderDetail->product->getFirstMediaUrl(MediaCollectionsNames::ProductImage),
                        'quantity'   => $orderDetail->quantity,
                        'price'      => $orderDetail->price,
                        'attributes' => $orderDetail->product->attributes->map(function ($attribute) {
                            return [
                                'name' => $attribute->name,
                                'value' =>  $attribute->pivot->value,
                            ];
                        }),
                    ];
            });
    }
}
