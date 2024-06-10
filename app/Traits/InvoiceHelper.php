<?php

namespace App\Traits;

use App\Traits\ModelHelper;
use App\Models\Product;

class InvoiceHelper
{
    use ModelHelper;

    public function __construct()
    {
    }

    public static function calculateInvoice($order)
    {
        $total = 0;
        $totalTax = 0;
        foreach ($order->orderDetails as $product) {

            if ($product['status']) {
                $currentProduct = Product::find($product['product_id']);

                $productTotal = $currentProduct->price * $product['quantity'];

                if ($currentProduct['discount_status']) {
                    $productTotal = $productTotal - (int)(($productTotal / 100) * $currentProduct['discount']);
                }

                $total = $total + $productTotal;

                $taxPercentage = $currentProduct->tax ?? 0;
                $productTax = ($taxPercentage / 100) * $productTotal;
                $totalTax = $totalTax + $productTax;
            }
        }



        $total_sum = (int)($total + $totalTax + $order->delivery_fee - $order->coupon_discount);
        $total_order = floor($total_sum / 100) * 100;
        $extra_discount = $total_sum - $total_order;
        if ($total_sum < 0) $total_sum = 0;

        $data = [
            'sub_total'       => $total,
            'tax'            => $totalTax,
            'extra_discount' => $extra_discount,
            'total'          => $total_order,
        ];
        return $data;
    }
}
