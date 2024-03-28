<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use App\Services\SettingService;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    public function getAppSettings(){

        $settings = Setting::get()->first();
        $settings->update_time = config('constant.update_time');
        return $this->successResponse(
            $settings,
            'dataFetchedSuccessfully'
        );
    }
}
