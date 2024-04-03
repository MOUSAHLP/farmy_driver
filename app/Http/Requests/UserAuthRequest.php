<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserAuthRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return match ($this->getFunctionName()) {
            'login'           => $this->login(),
            'register'           => $this->register(),
            'generateOTP'     => $this->generateOTP(),
            'verifyOTP'       => $this->generateOTP(),
            'verifyNewPhone'  => $this->verifyNewPhoneOTP(),
            default           => $this->generateOTP(),
        };
    }

    public function login()
    {
        return [
            // 'email' => 'required|string|email',
            'phone'    => 'required|numeric|min_digits:9|max_digits:9',
            'password' => 'required|string|min:6|max:30'
        ];
    }

    public function register()
    {
        return [
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:drivers',
            'password' => 'required|string|min:6',
            'phone' => 'required|numeric|min_digits:9|max_digits:9',
        ];
    }

    public function generateOTP()
    {
        return [
            'phone'    => 'required|numeric|exists:drivers,phone',
            'code'     => 'sometimes|numeric',
        ];
    }
    public function verifyNewPhoneOTP()
    {
        return [
            'phone'    => 'required|numeric|unique:drivers,phone',
            'code'     => 'sometimes|numeric',
        ];
    }



    public function getFunctionName(): string
    {
        $action = $this->route()->getAction();
        $controllerAction = $action['controller'];
        list($controller, $method) = explode('@', $controllerAction);
        return $method;
    }
}
