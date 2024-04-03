<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ContactUsController;
use App\Http\Controllers\DriverController;
use App\Http\Controllers\OrderDetailController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SettingController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'lang'], function () {
    // auth
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);

    Route::group(['middleware' => 'auth:api'], function () {

        //auth
        Route::post('/logout', [AuthController::class, 'logout']);

        // profile
        Route::get('/get_profile_details', [ProfileController::class, 'getProfileDetails']);
        Route::post('/update_profile', [ProfileController::class, 'updateProfile']);
        Route::post('/change_password', [ProfileController::class, 'changePassword']);
        Route::post('/delete_account', [ProfileController::class, 'deleteAccount']);


        Route::get('/driver-dues', [DriverController::class, 'getDriverDues']);
        Route::get('/accept-order/{order_id}', [DriverController::class, 'acceptOrderByDriver']);
        Route::get('/generate-pdf-all-orders', [DriverController::class, 'generatePdfAllOrdersForDriver']);

        Route::post('/asign-order-to-driver', [DriverController::class, 'asignOrderToDriver']); // core request
        Route::delete('/delete-driver/{driver_id}', [DriverController::class, 'DeleteDriver']); // core request

        Route::get('/get_home', [DriverController::class, 'getHomePage']);
        Route::get('/orders', [DriverController::class, 'getLastFiveOrdersPending']);
        Route::get('/driver-orders', [OrderDetailController::class, 'getDriverOrders']);
        Route::get('/driver-orders/{order_id}',  [OrderDetailController::class, 'getDriverOrderDetail']);
        Route::put('/driver-orders/{order_id}', [OrderDetailController::class, 'updateDriverOrderDetail']);

        Route::get('/all-orders', [DriverController::class, 'getAllOrders']);

        // Orders History
        Route::get('/get-driver-orders-history', [DriverController::class, 'getOrdersHistory']);
        Route::get('/get-orders-statistics', [DriverController::class, 'getOrdersStatistics']);
    });

    // (Setting, Privacy, Conditions, FAQ, Who We Are, About The App)
    Route::get('/setting', [SettingController::class, 'getAppSettings']);
    Route::get('/policy', [SettingController::class, 'privacyAndPolicy']);
    Route::get('/conditions', [SettingController::class, 'conditionsAndRules']);
    Route::get('/faq_questions', [SettingController::class, 'faqQuestions']);
    Route::get('/who_we_are', [SettingController::class, 'whoWeAre']);
    Route::get('/use_terms', [SettingController::class, 'useTerms']);
    Route::get('/about_the_app', [SettingController::class, 'aboutTheApp']);

    //// contact us
    Route::post('contact_us', [ContactUsController::class, 'contact_us']);
});
