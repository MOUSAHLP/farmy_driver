<?php

namespace App\Enums;

class DriverTypes
{
    const Salary      = 1;
    const Commission  = 2;

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
            self::Salary,
            self::Commission,
        ];
    }
}

