<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProfileRequest extends FormRequest
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

        return match ($this->route()->getActionMethod()) {
            'changePassword'  => $this->changePassword(),
            'updateProfile'   =>  $this->getUpdateProfileRules(),
            'deleteAccount'   =>  $this->getDeleteAccountRules(),
        };
    }

    public function getUpdateProfileRules()
    {
        $user_id = auth('api')->user()->id;
        return  [
            'first_name'          => 'nullable|string|max:255',
            'last_name'           => 'nullable|string|max:255',
            'email'               => ['nullable', 'email', Rule::unique('drivers', 'email')->ignore($user_id)],
            'phone'               => ['nullable', "numeric", "min:9", Rule::unique('drivers', 'phone')->ignore($user_id)],
            'birthday'            => 'nullable|date',
        ];
    }

    public function changePassword()
    {
        return [
            'old_password'    => 'required|string|current_password:api',
            'password'        => 'required|string|confirmed|min:6|max:30',
        ];
    }

    public function getDeleteAccountRules()
    {
        $id = auth('api')->user()->id;
        return [
            'delete_reason'  => 'nullable|string|max:255',
            'password'       => 'required|current_password:api',
            'phone'          => 'required|exists:drivers,phone,id,' . $id,
        ];
    }
}
