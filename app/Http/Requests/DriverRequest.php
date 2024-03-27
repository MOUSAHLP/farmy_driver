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
      'updateDriverInfo'   =>  $this->getupdateDriverInfoRules(),
    };
  }

  public function getupdateDriverInfoRules()
  {
    return [
      'id'                  => 'required|integer|exists:drivers,id',
      'first_name'          => 'required|string|max:255',
      'last_name'           => 'required|string|max:255',
      'phone'               => 'required|numeric',
    ];
  }

  protected function failedValidation(Validator $validator)
  {
      throw new HttpResponseException(response()->json([
          'status' => 'Error',
          'message' =>$validator->errors()->first(),
          'data' => null,
          'statusCode' => 422

      ], 422));
  }
}
