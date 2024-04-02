<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileRequest;
use App\Services\ProfileService;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function __construct(private ProfileService $profileService)
    {
    }

    public function getProfileDetails()
    {
        $driver = Auth::guard('api')->user();
        return $this->successResponse(
            $driver,
            'dataFetchedSuccessfully'
        );
    }
    public function changePassword(ProfileRequest $request)
    {
        $validatedData = $request->validated();
        $this->profileService->changePassword($validatedData);
        return $this->successResponse(null, 'passwordChangedSuccessfully');
    }

    public function updateProfile(ProfileRequest $request)
    {
        $driverId = auth('api')->user()->id;
        $validatedData = $request->validated();
        $driver = $this->profileService->update($validatedData, $driverId);

        return $this->successResponse(
            $driver,
            'dataUpdatedSuccessfully'
        );
    }

    public function deleteAccount(ProfileRequest $request)
    {
        $user_id = auth('api')->user()->id;

        // $this->profileService->update(['delete_reason' => $request->delete_reason], $user_id);
        $this->profileService->delete($user_id);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
