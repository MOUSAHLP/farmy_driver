<?php

use App\Http\Controllers\DriverController;
use App\Http\Controllers\SettingController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;










route::get('/setting', [SettingController::class, 'getAppSettings']);
route::get('/driver-dues/{driver_id}', [DriverController::class, 'getDriverDues']);
