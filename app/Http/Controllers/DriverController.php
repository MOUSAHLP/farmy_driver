<?php

namespace App\Http\Controllers;

use App\Models\Driver;
use App\Models\Order;
use App\Http\Requests\DriverRequest;
use App\Services\DriverService;
use Illuminate\Http\Request;

class DriverController extends Controller
{
    public function __construct(private DriverService $driverService)
    {
    }

    public function getDriverDues($driver_id)
    {
        $driverDues = $this->driverService->getDriverDues($driver_id);
        return $this->successResponse(
            $driverDues,
            'dataFetchedSuccessfully'
        );
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

        $res = $this->driverService->acceptOrderByDriver($order);

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


    public function generatePdfAllOrdersForDriver($driver_id)
    {

        $pdf = $this->driverService->generatePdfAllOrdersForDriver($driver_id);

        return $pdf;
        // return $this->successResponse(
        //     $pdf,
        //     'dataFetchedSuccessfully'
        // );
    }

    public function updateDriverInfo($driver_id, DriverRequest $request)
    {
        // $validatedData = $request->validate([
        //     'first_name' => 'required|string|max:255',
        //     'last_name' => 'required|string|max:255',
        // ]);
        $res = $this->driverService->updateDriverInfo($driver_id, $request->all());

        if ($res['status']) {
            return $this->successResponse(
                null,
                $res['message']
            );
        } else {
            return $this->errorResponse(
                $res['message'],
                404
            );
        }
    }

    public function getLastFiveOrdersPending()
    {
        $data = $this->driverService->getLastFiveOrdersPending();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }

    public function getDriverOrders($driver_id)
    {
        $data = $this->driverService->getDriverOrders($driver_id);

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
}
