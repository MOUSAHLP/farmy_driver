<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Traits\ApiResponser;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class DriverRequest extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return match ($this->route()->getActionMethod()) {
            'asignOrderToDriver'   =>  $this->getasignOrderToDriverRules(),
        };
    }

    public function getasignOrderToDriverRules()
    {
        return [
            'driver_id'                  => 'required|integer|exists:drivers,id',
            'order_id'                  => 'required|integer|exists:orders,id',
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
