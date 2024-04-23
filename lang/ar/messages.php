<?php

return [

    // General msgs
    'dataAddedSuccessfully'          => 'تمت إضافة البيانات بنجاح',
    'dataUpdatedSuccessfully'        => 'تم تعديل البيانات بنجاح',
    'dataFetchedSuccessfully'        => 'تم جلب البيانات بنجاح',
    'mediaFetchedSuccessfully'       => 'تم جلب الميديا بنجاح',
    'dataDeletedSuccessfully'        => 'تم حذف البيانات بنجاح',

    'somethingwentwrong'             => 'حدث خطأ ما',

    'NotFound'                 => 'غير موجود',

    //General errors

    'alreadyExist'                  => 'موجود مسبقا',
    'invalidData'                  => 'بيانات خاطئة',
    'dataNotFound'                  => 'بيانات غير موجودة',

    'routeNotFound'                  => 'الرابط غير موجود',

    'VerificationCompletedSuccessfully' => 'تم التحقق بنجاح',

    'incorrect_date'                 => 'التاريخ غير صحيح',

    'true'                  => 'نعم',

    'false'                 => 'لا',

    "area" => "المنطقة",
    "street" => "الشارع",
    "building" => "اسم البناء",
    "building_number" => "رقم البناء",
    "floor" => "الطابق",

    "pending" => "قيد الانتظار",

    //Auth msgs
    'passwordChangedSuccessfully'    => 'تم تغيير كلمة المرور بنجاح',
    'userSuccessfullyRegistered'     => 'تم تسجيل المستخدم بنجاح',
    'userSuccessfullySignedIn'       => 'تم تسجيل الدخول بنجاح',
    'userSuccessfullySignedOut'      => 'تم تسجيل الخروج بنجاح',
    'newPasswordError'               => 'كلمة المرور الجديدة لا يمكن ان تكون مماثلة للقديمة . يرجى إعادة المحاولة',
    'currentPasswordIncorrect'       => 'كلمة المرور الحالية لا تتطابق مع التي تم ادخالها. يرجى إعادة المحاولة',
    'passwordConfirmationNotMatch'   => 'تأكيد كلمة المرور غير متطابقة. يرجى إعادة المحاولة',
    'credentialsError'               => 'خطأ في الرقم الوطني او كلمة المرور',

    'Unauthorized'                   => 'لا تملك صلاحيات للقيام بهذا الإجراء',
    'Unauthenticated'                => 'الرجاء تسجيل الدخول اولاً',

    //orders
    "orders" => [
        "NotFound" => "الطلب غير موجودة",
        "OtherDriver" => "هذا الطلب يخص سائق اخر",

        // Accept
        "Accepted" => "تم قبول الطلب",
        "Already_Accepted" => "الطلب تم قبوله مسبقا",

        // Reject
        "Rejected" => "تم رفض الطلب",
        "Already_Rejected" => "الطلب تم رفضه مسبقا",

        // Confirmed
        "Confirmed" => [
            "title" => "تم قبول طلبك",
            "body" => "تم قبول طلبك من قبل سائق"
        ],

        // On Delivery
        "OrderOnWay" => [
            "title" => "طلبك قيد التوصيل",
            "body" => "طلبك الان قيد التوصيل"
        ],

        // Delivered
        "Delivered" => "تم توصيل الطلب",

        // make paid
        "Paid" => "تم جعل الطلب مدفوع",
        "PaidError" => "حدث خطأ جعل الطلب مدفوع",

        "OrderArrived" => [
            "title" => "تم وصول طلبك",
            "body" => "تم وصول السائق الى المنطقة"
        ],

    ],
    // reward notifications
    'reward_notifications'  => [
        "user_created"  => "لانشائك حساب بتطبيقنا",
        "user_birthday_added"  => "لاضافة تاريخ ميلادك على حسابك",
        "order_rated"  => "لتقييمك طلب",
        "order_created"  => "لاتمامك طلب",

    ],
];
