<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserAuthRequest;
use App\Models\Driver;
use App\Services\UserAuthService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function __construct(private UserAuthService $userAuthService)
    {
    }

    public function login(UserAuthRequest $request)
    {
        $validatedData = $request->validated();

        $token = Auth::guard('api')->attempt($validatedData);
        if (!$token) {
            return response()->json([
                'status' => 'error',
                'message' => 'Unauthorized',
            ], 401);
        }

        $user = Auth::guard('api')->user();
        return response()->json([
            'status' => 'success',
            'user' => $user,
            'token' => $token
        ]);
    }

    public function register(UserAuthRequest $request)
    {
        $user = Driver::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => Hash::make($request->password),
        ]);

        $token = Auth::login($user);
        return response()->json([
            'status' => 'success',
            'message' => 'User created successfully',
            'user' => $user,
            'authorisation' => [
                'token' => $token,
                'type' => 'bearer',
            ]
        ]);
    }

    public function logout()
    {
        $this->userAuthService->logout();

        return $this->successResponse(
            null,
            'userSuccessfullySignedOut'
        );
    }
}
