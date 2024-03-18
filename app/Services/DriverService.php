<?php

namespace App\Services;

use App\Enums\OrderStatus;
use App\Models\Order;
use App\Models\Driver ;
 
 
use Spatie\Browsershot\Browsershot;
use PDF;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
 
 
 


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

        $time = now();
        $orders = Order::where('driver_id' ,$driver_id )->orderBy('created_at' , "desc")->select('order_number' ,'created_at' , 'total')->get()->toArray();
      
        $pdf = PDF::loadView('inv' , ['data'=>$orders]);
        // $repository = 'storage/app/public/ordesPdf'; //comment this line for 000webhost
        // if (!File::exists($repository)) {
        //     File::makeDirectory($repository, 0777, true);
        // }
        // $fileName = 'orders.pdf';

        

       Storage::put('public/pdf/'.$time.'.pdf', $pdf->output());

       return $pdf->download('invoice.pdf');
        

        // $filePath = $repository . Carbon::now()->format('Y_m_d_u') . '_' . $fileName;

        // $pdf->
        // // return $pdf->download( $filePath);

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
