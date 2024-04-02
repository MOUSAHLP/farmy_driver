<?php

namespace App\Http\Controllers;

use App\Http\Requests\ContactUsRequest;
use App\Models\ContactUs;

class ContactUsController extends Controller
{
    public function contact_us(ContactUsRequest $request)
    {
        ContactUs::create([
            'email' => $request->email,
            'notes' => $request->notes,
        ]);

        return $this->successResponse(
            null,
            'dataAddedSuccessfully'
        );
    }
}
