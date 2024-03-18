<?php

use App\Http\Controllers\DriverController;
use App\Http\Controllers\SettingController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;










route::get('/setting', [SettingController::class, 'getAppSettings']);
route::get('/driver-dues/{driver_id}', [DriverController::class, 'getDriverDues']);
route::get('/genrate-pdf-all-orders/{driver_id}' , [DriverController::class, 'generatePdfAllOrdersForDriver']);
route::get('/accept-order/{order_id}/{driver_id}' , [DriverController::class , 'acceptOrderByDriver']);
route::put('/update-driver-info/{driver_id}' , [DriverController::class , 'updateDriverInfo']);
