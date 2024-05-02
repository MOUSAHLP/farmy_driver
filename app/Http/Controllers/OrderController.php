<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Services\OrderService;
use App\Traits\CoreRequests;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    use CoreRequests;
    public function __construct(private OrderService $orderService)
    {
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

        $res = $this->orderService->acceptOrderByDriver($order);

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
    public function checkCodeExists(Request $request,$id)
    {

        $code = $request->input('code');
       
        $order = Order::where('code', $code)->first();

      
        if ($order) {
        

              return response()->json( [$order,"code is true"]);
        } else {
         
         return response()->json([$order,"code is false"]);
        }

    }
    public function rejectOrderByDriver($order_id)
    {
        $order = Order::find($order_id);
        if (!$order) {
            return $this->errorResponse(
                "orders.NotFound",
                404
            );
        }

        $res = $this->orderService->rejectOrderByDriver($order);

        if ($res) {
            return $this->successResponse(
                null,
                'orders.Rejected'
            );
        } else {
            return $this->errorResponse(
                "orders.Already_Rejected",
                404
            );
        }
    }

    deliverOrderByDriver
    public function makeOrderPaid($order_id)
    {
        $order = Order::find($order_id);
        if (!$order)  return $this->errorResponse("orders.NotFound", 404);

        $res = $this->orderService->makeOrderPaid($order);

        if ($res) {
            return $this->successResponse(
                null,
                'orders.Paid'
            );
        } else {
            return $this->errorResponse(
                "orders.Already_Paid",
                400
            );
        }
    }

    public function acceptAssignedOrderByDriver($order_id)
    {

        $order = Order::find($order_id);
        if (!$order) {
            return $this->errorResponse(
                "orders.NotFound",
                404
            );
        }

        $res = $this->orderService->acceptAssignedOrderByDriver($order);

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
}
