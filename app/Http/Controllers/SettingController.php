<?php

namespace App\Http\Controllers;

use App\Enums\CoreRoutes;
use App\Models\Setting;
use App\Traits\CoreRequests;

class SettingController extends Controller
{
    use CoreRequests;
    public function getAppSettings()
    {

        $settings = Setting::get(["id", "version", "phone"])->first();
        $settings->baseUrl = env("APP_URL");
        $settings->update_time = config('constant.update_time');
        $settings->tracking_time = config('constant.tracking_time');
        return $this->successResponse(
            $settings,
            'dataFetchedSuccessfully'
        );
    }

    public function PrivacyAndPolicy()
    {
        $response = $this->coreGetRequest(CoreRoutes::policy);
        return  $response;
    }
    public function ConditionsAndRules()
    {
        $response = $this->coreGetRequest(CoreRoutes::conditions);
        return  $response;
    }
    public function faqQuestions()
    {
        $response = $this->coreGetRequest(CoreRoutes::faq_questions);
        return  $response;
    }
    public function whoWeAre()
    {
        $response = $this->coreGetRequest(CoreRoutes::who_we_are);
        return  $response;
    }
    public function useTerms()
    {
        $response = $this->coreGetRequest(CoreRoutes::use_terms);
        return  $response;
    }
    public function aboutTheApp()
    {
        $response = $this->coreGetRequest(CoreRoutes::about_the_app);
        return  $response;
    }
}
