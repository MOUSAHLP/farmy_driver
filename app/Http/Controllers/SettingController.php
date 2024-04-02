<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use App\Services\SettingService;
use Illuminate\Http\Request;

class SettingController extends Controller
{
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
        return $this->successResponse(
            [
                'html' => view('privacy')->render(),
            ],
            'dataFetchedSuccessfully'
        );
    }
    public function ConditionsAndRules()
    {
        return $this->successResponse(
            [
                'html' => view('conditions')->render(),
            ],
            'dataFetchedSuccessfully'
        );
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
}
