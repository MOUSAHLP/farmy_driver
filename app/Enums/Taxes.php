<?php

namespace App\Enums;

class Taxes
{
    const Reconstruction_tax  = 1;
    const Luxury_tax          = 2;

    public static function getAllValues()
    {
        $all_values = [];
        foreach (self::getValues() as $id) {
            $all_values[] = [
                "id" => $id,
                "name" => self::getName($id),
                "tax_value" => self::getTaxPercentageValue($id),
            ];
        }
        return $all_values;
    }
    public static function getName($id)
    {
        switch ($id) {
            case self::Reconstruction_tax:
                return __('messages.taxes.Reconstruction_tax');
            case self::Luxury_tax:
                return __('messages.taxes.Luxury_tax');
        }
    }
    public static function getTaxPercentageValue($id)
    {
        switch ($id) {
            case self::Reconstruction_tax:
                return 10;
            case self::Luxury_tax:
                return 10;
        }
    }

    public static function calculateTaxes($sum)
    {
        $taxes = [];
        foreach (self::getAllValues() as $tax) {
            $tax["tax_value"] = ($sum * $tax["tax_value"]) / 100;
            $taxes[] = $tax;
        }
        return $taxes;
    }

    public static function calculateTotalTax($sum)
    {
        $totalTax = 0;
        foreach (self::getAllValues() as $tax) {
            $totalTax += ($sum * $tax["tax_value"]) / 100;
        }
        return $totalTax;
    }

    public static function getValues()
    {
        return [
            self::Reconstruction_tax,
            self::Luxury_tax,
        ];
    }
}
