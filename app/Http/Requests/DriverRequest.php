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
            "make_active_inactive" => $this->get_make_active_inactive_rules(),
        };
    }
    public function get_make_active_inactive_rules()
    {
        return [
            'online_status' => 'required|boolean',
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
