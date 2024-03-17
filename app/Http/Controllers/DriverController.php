<?php

namespace App\Http\Controllers;

use App\Services\DriverService;
use Illuminate\Http\Request;

class DriverController extends Controller
{
    //

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
}
