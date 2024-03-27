<?php

namespace App\Enums;

class ChangeEnums
{
    const fiveHundred   = 1;
    const oneThousend   = 2;
    const twoThousend   = 3;
    const threeThousend = 4;
    const fourThousend  = 5;

    public static function getAllValues()
    {
        $all_values = [];
        foreach (self::getValues() as $case) {
            $all_values[] = [
                "id"=>$case,
                "value"=> self::getInPounds(self::getName($case)),
            ];
        }
        return $all_values;
    }
    public static function getName($value)
    {
        $constants = array_flip((new \ReflectionClass(self::class))->getConstants());

        return $constants[$value] ?? null;
    }
    public static function toArray($array): array
    {
        if ($array == null) return [];
        $names_array = [];
        foreach (self::getValues() as $case) {
            for ($j = 0; $j < count($array); $j++) {
                if ($array[$j] == $case) {
                    $names_array[] = self::getInPounds(self::getName($case));
                }
            }
        }
        return $names_array;
    }
    public static function getInPounds($name)
    {
        switch ($name) {
            case "fiveHundred":
                return 500;
            case "oneThousend":
                return 1000;
            case "twoThousend":
                return 2000;
            case "threeThousend":
                return 3000;
            case "fourThousend":
                return 4000;
        }
    }
    public static function getValue($name)
    {
        return defined('self::' . $name) ? constant('self::' . $name) : null;
    }
    public static function getValues()
    {
        return [
            self::fiveHundred,
            self::oneThousend,
            self::twoThousend,
            self::threeThousend,
            self::fourThousend,
        ];
    }
}
