<?php

namespace App\Enums;

class AcceptanceEnums
{
    const new          = 0;
    const experienced  = 100;
    const expert       = 300;
    const professional = 400;
    const supervisor   = 500;

    public static function getArabicName($name)
    {
        switch ($name) {
            case "new":
                return "جديد";
            case "experienced":
                return "متمرس";
            case "expert":
                return "خبير";
            case "professional":
                return "محترف";
            case "supervisor":
                return "مشرف";
        }
    }

    public static function getName($value)
    {
        $constants = array_flip((new \ReflectionClass(self::class))->getConstants());

        return $constants[$value] ?? null;
    }

    public static function getRate($value, $isArabic = false)
    {
        $constants = array_flip((new \ReflectionClass(self::class))->getConstants());

        switch (true) {

            case $value >= self::experienced && $value <= self::expert:
                $newValue = ($constants[self::experienced]);

            case $value >= self::expert && $value <= self::professional:
                $newValue = $constants[self::expert];

            case $value >= self::professional && $value <= self::supervisor:
                $newValue = $constants[self::professional];

            case $value >= self::professional:
                $newValue = $constants[self::supervisor];

            default:
                $newValue = $constants[self::new];
        }

        if ($isArabic) {
            return self::getArabicName($newValue);
        }

        return $newValue;
    }

    public static function getValue($name)
    {
        return defined('self::' . $name) ? constant('self::' . $name) : null;
    }

    public static function getValues()
    {
        return [
            self::new,
            self::experienced,
            self::expert,
            self::professional,
            self::supervisor,
        ];
    }

    public static function getValuesArabic()
    {
        return [
            self::getArabicName(self::new),
            self::getArabicName(self::experienced),
            self::getArabicName(self::expert),
            self::getArabicName(self::professional),
            self::getArabicName(self::supervisor),
        ];
    }
}
