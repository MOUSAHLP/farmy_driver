<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderDetailRequest;
use App\Services\OrderDetailService;

class OrderDetailController extends Controller
{
    public function __construct(private OrderDetailService $orderDetailService)
    {
    }

    public function getDriverOrders()
    {
        $data = $this->orderDetailService->getDriverOrders();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    public function getDriverOrderDetail($order_id)
    {
        $data = $this->orderDetailService->getDriverOrderDetail($order_id);

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    public function updateDriverOrderDetail($order_id, OrderDetailRequest $request)
    {
        $this->orderDetailService->updateDriverOrderDetail($order_id, $request);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }
}
