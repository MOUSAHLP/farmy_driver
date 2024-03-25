<?php

namespace App\Http\Controllers;

use App\Services\SettingService;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    //

    public function __construct(private SettingService $settingService)
    {


    }


    public function getAppSettings(){

        $settings = $this->settingService->getAppSettings();
        return $this->successResponse(
            $settings,
            'dataFetchedSuccessfully'
        );
    }
}
