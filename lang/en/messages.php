<?php

return [

    // General msgs
    'dataAddedSuccessfully'          => 'Data added successfully',
    'dataUpdatedSuccessfully'        => 'Data updated successfully',
    'dataFetchedSuccessfully'        => 'Data fetched successfully',
    'mediaFetchedSuccessfully'       => 'Media fetched successfully',
    'dataDeletedSuccessfully'        => 'Data deleted successfully',

    'somethingwentwrong'             => 'Something Went Wrong',

    'NotFound'                 => 'Not Found',

    //General errors
    'alreadyExist'                  => 'Already Exist',
    'invalidData'                  => 'Invalid Data',
    'dataNotFound'                  => 'Data Not Found',



    'routeNotFound'                  => 'Route not found',
    'VerificationCompletedSuccessfully' => 'Verification completed successfully',
    'ThephoneNumberOrEmailAlreadyExists' => 'Phone number or the email already exists',

    'incorrect_date'                 => 'Incorrect date',

    'true'                  => 'true',
    'false'                 => 'false',

    "area" => "area",
    "street" => "street",
    "building" => "building",
    "building_number" => "building number",
    "floor" => "floor",

    //Auth msgs
    'passwordChangedSuccessfully'    => 'Password changed successfully !',
    'userSuccessfullyRegistered'     => 'User successfully registered',
    'userSuccessfullySignedIn'       => 'User successfully signed in',
    'userSuccessfullySignedOut'      => 'User successfully signed out',
    'newPasswordError'               => 'New Password cannot be same as your current password. Please choose a different password.',
    'currentPasswordIncorrect'       => 'Your current password does not matches with the password you provided. Please try again.',
    'passwordConfirmationNotMatch'   => 'The Password confirmation does not match.',
    'credentialsError'               => 'Wrong ID or password',

    'Unauthorized'                   => 'You do not have permissions to perform this action',
    'Unauthenticated'                => 'PLease login first',

    "pending" => "pending",

    //orders
    "orders" => [
        "NotFound" => "Order Not Found",
        "OtherDriver" => "This Order Belongs To Another Driver",
        "Already_Paid" => "The Order Has Already Been Made Paid",

        // Accept
        "Accepted" => "Order is Accepted",
        "Already_Accepted" => "The Order Has Already Been Accepted",

        // Reject
        "Rejected" => "Order is Rejected",
        "Already_Rejected" => "The Order Has Already Been Rejected",

        // Confirmed
        "Confirmed" => [
            "title" => "Your Order Has Confirmed",
            "body" => "Your Order Has Confirmed By A Driver"
        ],

        // make paid
        "Paid" => "The Order Was Made Paid",

        // On Delivery
        "OrderOnWay" => [
            "title" => "Order On The Way",
            "body" => "Your Order Now is On The Way"
        ],

        // Delivered
        "Delivered" => "Order is Delivered",

        "OrderArrived" => [
            "title" => "Your Order Has Arrived",
            "body" => "The Driver Has Arrived To Your Area"
        ],
        'code' => 'Your Driver is on road this your Order Code',
        'codeError'=>'Invalid Code',

    ],
    // reward notifications
    'reward_notifications'  => [
        "user_created"  => "for signing up in our app",
        "user_birthday_added"  => "for adding your birthday in your account",
        "order_rated"  => "for rating an order",
        "order_created"  => "for creating an order",

    ],
];
