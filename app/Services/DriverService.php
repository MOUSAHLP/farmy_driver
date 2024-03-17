<?php

namespace App\Services;

use App\Models\Order;

class DriverService
{


    public function getDriverDues($driver_id)
    {

        $dues = Order::where('driver_id', $driver_id)->sum('delivery_fee');

        return  ['driver_dues'=>$dues];
    }
}
