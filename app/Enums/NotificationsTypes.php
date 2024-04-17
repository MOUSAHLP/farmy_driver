<?php

namespace App\Enums;

class NotificationsTypes
{
    const Orders            = 1;
    const Offers            = 2;
    const PushNotifications = 3;
    public static function getName($value)
    {
        $constants = array_flip((new \ReflectionClass(self::class))->getConstants());

        return $constants[$value] ?? null;
    }
    public static function getValue($name)
    {
        return defined('self::' . $name) ? constant('self::' . $name) : null;
    }
    public static function getValues()
    {
        return [
            self::Orders,
            self::Offers,
            self::PushNotifications,
        ];
    }
}
