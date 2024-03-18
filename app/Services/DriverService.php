<?php

namespace App\Services;

use App\Enums\OrderStatus;
use App\Models\Order;
use App\Models\Driver ;
use Spatie\LaravelPdf\Facades\Pdf;


class DriverService
{


    public function getDriverDues($driver_id)
    {

        $dues = Order::where('driver_id', $driver_id)->sum('delivery_fee');

        $orders = Order::where('driver_id', $driver_id)->orderBy('created_at' , 'Desc')->take(5)->select('order_number' , 'created_at' , 'total')->get();
        return  ['driver_dues' => $dues , 'orders'=> $orders];
    }

    public function acceptOrderByDriver($order_id, $driver_id)
    {

        $res = [];
        $order = Order::find($order_id);
        if ($order) {
            $order->driver_id = $driver_id;
            $order->status =  OrderStatus::Confirmed;
            $order->save();
            $res['status'] = true;
            $res['message'] = "success";
            return  $res;
        } else {
            $res['status'] = false;
            $res['message'] = "order not found";
            return $res;
        }
    }

    public function generatePdfAllOrdersForDriver($driver_id)
    {

        $orders = Order::where('driver_id' ,$driver_id )->orderBy('created_at' , "desc")->select('id', 'order_number')->get();

        
        return Pdf::view('invoice', ['data' => $orders])

        ->format('a4')

        ->save('your-invoice.pdf');
    }

    public function updateDriverInfo($driver_id , $data){

        $res = [];
        $driver = Driver::find($driver_id);
        if ($driver) {


            $driver->first_name = $data['first_name'];
            $driver->last_name =  $data['last_name'];
            $driver->save();
            $res['status'] = true;
            $res['message'] = "success";
            return  $res;
        } else {
            $res['status'] = false;
            $res['message'] = "driver not found";
            return $res;
        }


    }
}
