<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DriverController;
use App\Http\Controllers\SettingController;
use Illuminate\Support\Facades\Route;

// auth
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::group(['middleware' => 'auth:api'], function () {
    Route::get('/driver-dues/{driver_id}', [DriverController::class, 'getDriverDues']);
    Route::get('/generate-pdf-all-orders/{driver_id}' , [DriverController::class, 'generatePdfAllOrdersForDriver']);
    Route::get('/accept-order/{order_id}', [DriverController::class, 'acceptOrderByDriver']);
    Route::put('/update-driver-info/{driver_id}' , [DriverController::class , 'updateDriverInfo']);

    Route::get('/orders' , [DriverController::class , 'getLastFiveOrdersNotDeliverd']);
    Route::get('/driver-orders' , [DriverController::class , 'getDriverOrders']);
    Route::get('/driver-orders/{order_id}' , [DriverController::class , 'getDriverOrderDetail']);
});
Route::get('/setting', [SettingController::class, 'getAppSettings']);

