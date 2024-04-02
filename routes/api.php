<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DriverController;
use App\Http\Controllers\OrderDetailController;
use App\Http\Controllers\SettingController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'lang'], function () {
    // auth
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);

    Route::get('/generate-pdf-all-orders/{driver_id}', [DriverController::class, 'generatePdfAllOrdersForDriver']);
    Route::group(['middleware' => 'auth:api'], function () {

        Route::get('/driver-dues', [DriverController::class, 'getDriverDues']);
        Route::get('/accept-order/{order_id}', [DriverController::class, 'acceptOrderByDriver']);
        Route::put('/update-driver-info/{driver_id}', [DriverController::class, 'updateDriverInfo']);

        Route::get('/orders', [DriverController::class, 'getLastFiveOrdersPending']);
        Route::get('/driver-orders', [OrderDetailController::class, 'getDriverOrders']);
        Route::get('/driver-orders/{order_id}',  [OrderDetailController::class, 'getDriverOrderDetail']);
        Route::put('/driver-orders/{order_id}', [OrderDetailController::class, 'updateDriverOrderDetail']);

        Route::get('/all-orders', [DriverController::class, 'getAllOrders']);

        // Orders History
        Route::get('/get-driver-orders-history', [DriverController::class, 'getOrdersHistory']);
        Route::get('/get-orders-statistics', [DriverController::class, 'getOrdersStatistics']);
    });

    Route::get('/setting', [SettingController::class, 'getAppSettings']);
});
