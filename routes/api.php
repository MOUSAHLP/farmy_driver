<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DriverController;
use App\Http\Controllers\SettingController;
use Illuminate\Support\Facades\Route;


route::post('/login', [AuthController::class, 'login']);
route::get('/setting', [SettingController::class, 'getAppSettings']);
route::get('/driver-dues/{driver_id}', [DriverController::class, 'getDriverDues']);
route::get('/generate-pdf-all-orders/{driver_id}' , [DriverController::class, 'generatePdfAllOrdersForDriver']);
route::get('/accept-order/{order_id}/{driver_id}' , [DriverController::class , 'acceptOrderByDriver']);
route::put('/update-driver-info/{driver_id}' , [DriverController::class , 'updateDriverInfo']);
route::get('/orders' , [DriverController::class , 'getLastFiveOrdersNotDeliverd']);
route::get('/orders/{driver_id}' , [DriverController::class , 'getDriverOrders']);
