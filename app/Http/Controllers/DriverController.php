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


    public function acceptOrderByDriver($order_id , $driver_id){

        $res = $this->driverService->acceptOrderByDriver($order_id , $driver_id);

        if($res['status']){

            return $this->successResponse(
                null,
                $res['message']
             );


        }else{

            return $this->errorResponse(
            $res['message'] , 404 );
        }
      
    }


    public function generatePdfAllOrdersForDriver($driver_id){

        $pdf = $this->driverService->generatePdfAllOrdersForDriver($driver_id);
        return $this->successResponse(
            $pdf,
            'dataFetchedSuccessfully'
        );
    }

    public function updateDriverInfo($driver_id , Request $request){


      
        $validatedData = $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
        ]);

        $res = $this->driverService->updateDriverInfo($driver_id ,$request->all());

        if($res['status']){

            return $this->successResponse(
                null,
                $res['message']
             );
             
        }else{

            return $this->errorResponse(
            $res['message'] , 404 );
        }

    }

}

     
