<?php

namespace App\Traits;

use App\Enums\Taxes;
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
        foreach ($order->orderDetails as $product) {

            if ($product['status']) {
                $currentProduct = Product::find($product['product_id']);

                $productTotal = $currentProduct->price * $product['quantity'];

                if ($currentProduct['discount_status']) {
                    $productTotal = $productTotal - (int)(($productTotal / 100) * $currentProduct['discount']);
                }

                $total = $total + $productTotal;

                // $taxPercentage = $currentProduct->tax ?? 0;
                // $productTax = ($taxPercentage / 100) * $productTotal;
                // $totalTax = $totalTax + $productTax;
            }
        }

        // calculate the taxes
        $taxes = collect(Taxes::calculateTaxes($total + $order->delivery_fee))->map(function ($tax) {
            return [
                'id' => $tax['id'],
                'tax_value' => $tax['tax_value']
            ];
        })->all();
        $totalTax = Taxes::calculateTotalTax($total + $order->delivery_fee);

        $total_sum = (int)($total + $totalTax + $order->delivery_fee - $order->coupon_discount);
        $total_order = floor($total_sum / 100) * 100;
        $extra_discount = $total_sum - $total_order;
        if ($total_sum < 0) $total_sum = 0;

        $data = [
            'sub_total'      => $total,
            'taxes'          => $taxes,
            'tax'            => $totalTax,
            'extra_discount' => $extra_discount,
            'total'          => $total_order,
        ];
        return $data;
    }
}
