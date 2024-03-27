<?php

use App\Http\Controllers\DriverController;
use App\Http\Controllers\SettingController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;


route::get('/setting', [SettingController::class, 'getAppSettings']);
route::get('/driver-dues/{driver_id}', [DriverController::class, 'getDriverDues']);
route::get('/generate-pdf-all-orders/{driver_id}', [DriverController::class, 'generatePdfAllOrdersForDriver']);
route::post('/accept-order', [DriverController::class, 'acceptOrderByDriver']);
route::put('/update-driver-info/{driver_id}', [DriverController::class, 'updateDriverInfo']);
route::get('/orders', [DriverController::class, 'getLastFiveOrdersPending']);
