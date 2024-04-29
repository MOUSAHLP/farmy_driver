<?php

namespace App\Http\Controllers;

use App\Enums\CoreRoutes;
use App\Enums\OrderStatus;
use App\Enums\StatisticsEnums;
use App\Helpers\AuthHelper;
use App\Models\Driver;
use App\Models\Order;
use App\Http\Requests\DriverRequest;
use App\Http\Requests\OrderDetailRequest;
use App\Http\Resources\NotificationResource;
use App\Services\DriverService;
use App\Services\OrderDetailService;
use App\Traits\CoreRequests;
use Carbon\Carbon;
use Illuminate\Http\Request;

class DriverController extends Controller
{
    use CoreRequests;
    public function __construct(private DriverService $driverService, private OrderDetailService $orderDetailService)
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
    public function make_active_inactive(DriverRequest $request)
    {
        $data = $this->driverService->make_active_inactive($request->online_status);

        return $this->successResponse(
            $data,
            'dataUpdatedSuccessfully'
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
    public function getOrderTrackingUrl($order_id, OrderDetailRequest $request)
    {
        $order = Order::find($order_id);
        if ($order == null) {
            return $this->errorResponse(
                'orders.NotFound',
                400
            );
        }
        // change order detail status
        $this->orderDetailService->updateDriverOrderDetail($order, $request);

        // change oder status
        $order->update([
            "status" => OrderStatus::OnDelivery
        ]);

        $driverId = AuthHelper::userAuth()->id;

        $response = $this->coreGetRequest(CoreRoutes::socketUrl());
        $response->data = $response->data . '?order_id=' . $order_id . "&driver_id=" . $driverId;

        return  $response;
    }
    public function getNotifications()
    {
        $notifications = Driver::find(AuthHelper::userAuth()->id)->notifications();
        if (request()->has('type')) {
            $notifications->where('type', request()->type);
        }
        return $this->successResponse(
            NotificationResource::collection($notifications->get()),
            'dataFetchedSuccessfully'
        );
    }
}
