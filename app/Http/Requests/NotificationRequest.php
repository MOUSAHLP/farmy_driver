<?php

namespace App\Http\Requests;

use App\Enums\NotificationsTypes;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class NotificationRequest extends FormRequest
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
      'store'   =>  $this->getCreateRules(),
      'update'   =>  $this->getUpdateRules(),
      'sendPushNotification'   =>  $this->getsendPushNotificationRules(),
      default   =>  $this->getCreateRules(),
    };
  }

  public function getCreateRules()
  {
    return [
      'type'            => '',
      'notifiable_type' => '',
      'notifiable_id'   => '',
      'data'            => '',
      'user_ids'        => '',
    ];
  }

  public function getUpdateRules()
  {
    return [
      'type' => '',
      'notifiable_type' => '',
      'notifiable_id' => '',
      'data' => ''
    ];
  }

  public function getsendPushNotificationRules()
  {
    return [
      'type' => ['nullable', 'integer', Rule::in(NotificationsTypes::getValues())],
      'user_ids' => 'array|min:1',
      'user_ids.*' => 'nullable|numeric|exists:users,id',
      'data.title' => 'string|min:3',
      'data.body' => 'string|min:3',
    ];
  }
}
