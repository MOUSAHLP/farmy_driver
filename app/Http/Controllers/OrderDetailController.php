<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderDetailRequest;
use App\Services\OrderDetailService;

class OrderDetailController extends Controller
{
    public function __construct(private OrderDetailService $driverService)
    {
    }

    public function getDriverOrders()
    {
        $data = $this->driverService->getDriverOrders();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    public function getDriverOrderDetail($order_id)
    {
        $data = $this->driverService->getDriverOrderDetail($order_id);

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    public function updateDriverOrderDetail($order_id , OrderDetailRequest $request)
    {
        $this->driverService->updateDriverOrderDetail($order_id,$request);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }
}
