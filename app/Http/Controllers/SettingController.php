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

        $settings = Setting::get(["id", "baseUrl", "version", "phone"])->first();
        $settings->update_time = config('constant.update_time');
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
        return $this->successResponse(
            [
                'html' => view('faq_question')->render(),
            ],
            'dataFetchedSuccefully'
        );
    }
    public function whoWeAre()
    {
        return $this->successResponse(
            [
                'html' => view('who_we_are')->render(),
            ],
            'dataFetchedSuccefully'
        );
    }
    public function useTerms()
    {
        return $this->successResponse(
            [
                'html' => view('use_terms')->render(),
            ],
            'dataFetchedSuccefully'
        );
    }
    public function aboutTheApp()
    {
        return $this->successResponse(
            [
                'html' => view('about_the_app')->render(),
            ],
            'dataFetchedSuccefully'
        );
    }
}
