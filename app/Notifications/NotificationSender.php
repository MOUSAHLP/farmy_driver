<?php

namespace App\Notifications;

use App\Enums\NotificationsTypes;
use App\Traits\NotificationHelper;

class NotificationSender
{

    public static function sendPushNotification($users , $title , $body,$type=NotificationsTypes::PushNotifications)
    {


        // App::setlocale('ar');

        $data = [
            'title' => $title,
            'body' => $body,
        ];


        $fcmTokens = $users->pluck('fcm_token');

        NotificationHelper::sendPushNotification($fcmTokens->toArray(), $data ,$type);

        return $data = [
            'title'   => $title,
            'body'    => $body,
            'type'    => $type,
        ];
    }
}
