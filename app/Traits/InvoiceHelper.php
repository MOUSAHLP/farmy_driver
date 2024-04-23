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
        if ($total_sum < 0) $total_sum = 0;
        $data = [
            'sub_total'       => $total,
            'tax'            => $totalTax,
            'total'          => $total_sum,
        ];

        return $data;
    }
}
