<?php

namespace App\Services;



class SettingService
{


    public function getAppSettings()
    {

        $setting['app_version'] = config('constant.app_version');
        $setting['update_time'] = config('constant.update_time');
        return  $setting;
    }
}
