<?php

namespace App\Http\Controllers;

use App\Enums\StatisticsEnums;
use App\Models\Driver;
use App\Models\Order;
use App\Http\Requests\DriverRequest;
use App\Services\DriverService;
use Carbon\Carbon;
use Illuminate\Http\Request;

class DriverController extends Controller
{
    public function __construct(private DriverService $driverService)
    {
    }

    public function getDriverDues()
    {
        $driverDues = $this->driverService->getDriverDues();

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


    public function generatePdfAllOrdersForDriver()
    {
        $pdf = $this->driverService->generatePdfAllOrdersForDriver();
        return $pdf;
    }
    public function getAllOrders()
    {
        $data = $this->driverService->getAllOrders();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    public function getHomePage()
    {
        $data = $this->driverService->getHomePage();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    public function getLastFiveOrdersPending()
    {
        $data = $this->driverService->getLastFiveOrdersPending();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    public function getOrdersHistory()
    {
        $data = $this->driverService->getOrdersHistory();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }

    public function getOrdersStatistics()
    {
        $date = request("date") != null ? request("date") : Carbon::now();
        $type = request("type") != null ? request("type") : StatisticsEnums::WEEKLY;

        if ($type == StatisticsEnums::WEEKLY) {
            $data = $this->driverService->calculateWeekHistory($date);
        } else if ($type == StatisticsEnums::MONTHLY) {
            $data = $this->driverService->calculateMonthlyHistory($date);
        } else {
            return $this->errorResponse(
                'invalidData',
                400
            );
        }

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
}
