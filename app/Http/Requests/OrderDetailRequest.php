<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Traits\ApiResponser;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class OrderDetailRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return match ($this->route()->getActionMethod()) {
            'updateDriverOrderDetail'   =>  $this->getupdateDriverOrderDetailRules(),
        };
    }

    public function getupdateDriverOrderDetailRules()
    {
        return [
            'approved_products_ids'   => 'required|array',
            'approved_products_ids.*' => 'integer',
            'canceled_products_ids'   => 'required|array',
            'canceled_products_ids.*' => 'integer',
        ];
    }

    public function attributes()
    {
        return [
            'approved_products_ids' => __("attributes.approved_products_ids"),
            'approved_products_ids.*' => __("attributes.approved_products_ids"),
            'canceled_products_ids' => __("attributes.canceled_products_ids"),
            'canceled_products_ids.*' => __("attributes.canceled_products_ids"),
        ];
    }
    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([
            'status' => 'Error',
            'message' => $validator->errors()->first(),
            'data' => null,
            'statusCode' => 422

        ], 422));
    }
}
