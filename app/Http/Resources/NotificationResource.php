<?php

namespace App\Http\Resources;

use App\Enums\NotificationsTypes;
use Illuminate\Http\Resources\Json\JsonResource;

class NotificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id'              => $this->id,
            'type'            => NotificationsTypes::getName($this->type),
            'notifiable_id'   => $this->notifiable_id,
            'data'            => $this->data,
            'created_at'      => $this->created_at
          ];
    }
}
