<?php

namespace App\Enums;

use App\Helpers\AuthHelper;

class CoreRoutes
{

    // Settings
    const settings = '/settings';
    const policy = '/policy';
    const conditions = '/conditions';
    const faq_questions = '/faq_questions';
    const who_we_are = '/who_we_are';
    const about_the_app = '/about_the_app';
    const use_terms = '/use_terms';

    // // Points
    // public static function UserStatistics()
    // {
    //     $userId = AuthHelper::userAuth()->id;
    //     return '/points/user-statistics/' . $userId;
    // }
}
