<?php

namespace App\Enums;

class StatisticsEnums
{
    const WEEKLY    = "weekly";
    const MONTHLY    = "monthly";

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
            self::WEEKLY,
            self::MONTHLY,
        ];
    }
}
