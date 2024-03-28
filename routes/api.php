<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DriverController;
use App\Http\Controllers\SettingController;
use Illuminate\Support\Facades\Route;


Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::group([
    "middleware" => 'auth:api'
], function () {
    Route::get('/setting', [SettingController::class, 'getAppSettings']);
    Route::get('/driver-dues', [DriverController::class, 'getDriverDues']);
    Route::get('/generate-pdf-all-orders/{driver_id}', [DriverController::class, 'generatePdfAllOrdersForDriver']);
    Route::get('/accept-order/{order_id}', [DriverController::class, 'acceptOrderByDriver']);
    Route::put('/update-driver-info/{driver_id}', [DriverController::class, 'updateDriverInfo']);
    Route::get('/orders', [DriverController::class, 'getLastFiveOrdersPending']);
    Route::get('/orders/{driver_id}', [DriverController::class, 'getDriverOrders']);
});
