<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .conatiner {
            height: auto;
            border: 1px solid #333;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;

        }

        .title {
            /* width: 50%; */
            height: 230px;
            position: static;
            top: 15px;
            bottom: 0;
            right: 0;
            left: 0;
        }

        .title2 {
            height: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table1 {
            padding: 3px;
            background-color: #F4F5F4;
            width: 100%;
            height: auto;
            text-align: end;
            margin: 5px;
        }

        .table2 {
            padding: 3px;
            width: 100%;
            height: auto;
            text-align: end;
            margin: 5px;
            display: flex;
            justify-content: center;
            flex-direction: column;
        }

        .p_table1 {
            margin-right: 15px;
            padding: 5px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
            font-size: 20px;
            left: 774px;
            bottom: 965px;
            /* direction: rtl; */
            letter-spacing: -0.07px;
        }

        .main_table {
            background-color: #4F894A;

        }

        table {
            border-collapse: collapse;
        }

        #titleThead {
            background: #4f894a;
            padding: 11px;
            font-size: 17px;
            font-family: FrutigerLTArabic-65Bold_6c !important;
            color: white;
            text-align: center;
        }

        /* main */

        #t1_1 {
            left: 370px;
            bottom: 1044px;
            direction: rtl;
            letter-spacing: -0.13px;
        }

        #t2_1 {
            left: 640px;
            bottom: 162px;
            direction: rtl;
            letter-spacing: -0.07px;
        }

        #t3_1 {
            left: 363px;
            bottom: 75px;
            direction: rtl;
            letter-spacing: 0.03px;
        }

        #t4_1 {
            left: 286px;
            bottom: 49px;
            direction: rtl;
            letter-spacing: 0.13px;
        }

        #t5_1 {
            left: 554px;
            bottom: 49px;
            direction: rtl;
            letter-spacing: 0.16px;
        }

        #t6_1 {
            left: 390px;
            bottom: 23px;
            letter-spacing: 0.02px;
        }

        #t7_1 {
            left: 276px;
            bottom: 965px;
            direction: rtl;
            letter-spacing: -0.04px;
        }

        #t8_1 {
            left: 774px;
            bottom: 965px;
            direction: rtl;
            letter-spacing: -0.07px;
        }

        #t9_1 {
            left: 233px;
            bottom: 930px;
            direction: rtl;
            letter-spacing: -0.07px;
        }

        #ta_1 {
            left: 223px;
            bottom: 895px;
            direction: rtl;
            letter-spacing: -0.06px;
        }

        #tb_1 {
            left: 747px;
            bottom: 930px;
            direction: rtl;
            letter-spacing: -0.06px;
        }

        #tc_1 {
            left: 699px;
            bottom: 895px;
            direction: rtl;
            letter-spacing: -0.06px;
        }

        #td_1 {
            left: 265px;
            bottom: 1128px;
            direction: rtl;
            letter-spacing: -0.95px;
        }

        #te_1 {
            left: 526px;
            bottom: 1127px;
            letter-spacing: -0.22px;
        }

        #tf_1 {
            left: 844px;
            bottom: 822px;
        }

        #tg_1 {
            left: 710px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.08px;
        }

        #th_1 {
            left: 249px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.09px;
        }

        #ti_1 {
            left: 549px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.08px;
        }

        #tj_1 {
            left: 425px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.09px;
        }

        #tk_1 {
            left: 51px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tl_1 {
            left: 301px;
            bottom: 356px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tm_1 {
            left: 302px;
            bottom: 321px;
            direction: rtl;
            letter-spacing: -0.09px;
            word-spacing: -0.01px;
        }

        #tn_1 {
            left: 310px;
            bottom: 283px;
            direction: rtl;
            letter-spacing: -0.09px;
            word-spacing: -0.01px;
        }

        #to_1 {
            left: 342px;
            bottom: 247px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tp_1 {
            left: 326px;
            bottom: 247px;
        }

        #tq_1 {
            left: 342px;
            bottom: 211px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tr_1 {
            left: 326px;
            bottom: 211px;
        }

        #ts_1 {
            left: 342px;
            bottom: 175px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tt_1 {
            left: 326px;
            bottom: 175px;
        }

        #tu_1 {
            left: 304px;
            bottom: 138px;
            direction: rtl;
            letter-spacing: -0.09px;
            word-spacing: -0.01px;
        }

        .s0 {
            font-size: 27px;
            font-family: FrutigerLTArabic-75Black_6h;
            color: #fff;
        }

        .s1 {
            font-size: 18px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s2 {
            font-size: 17px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s3 {
            font-size: 15px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s4 {
            font-size: 16px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s5 {
            font-size: 20px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s6 {
            font-size: 45px;
            font-family: BahijTheSansArabic-Bold_67;
            color: #4f894a;
        }

        .s7 {
            font-size: 50px;
            font-family: FranklinGothic-Demi_62;
            color: #4f894a;
        }

        .s8 {
            font-size: 20px;
            font-family: FrutigerLTArabic-65Bold_61;
            color: #fff;
        }

        .s9 {
            font-size: 17px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #fff;
        }

        .sa {
            font-size: 17px;
            font-family: FrutigerLTArabic-65Bold_61;
            color: #1b1f22;
        }

        .t.v0 {
            transform: scaleX(0.832);
        }

        @font-face {
            font-family: BahijTheSansArabic-Bold_67;
            src: url("fonts/BahijTheSansArabic-Bold_67.woff") format("woff");
        }

        @font-face {
            font-family: FranklinGothic-Demi_62;
            src: url("fonts/FranklinGothic-Demi_62.woff") format("woff");
        }

        @font-face {
            font-family: FrutigerLTArabic-65Bold_61;
            src: url("fonts/FrutigerLTArabic-65Bold_61.woff") format("woff");
        }

        @font-face {
            font-family: FrutigerLTArabic-65Bold_6c;
            src: url("fonts/FrutigerLTArabic-65Bold_6c.woff") format("woff");
        }

        @font-face {
            font-family: FrutigerLTArabic-75Black_6h;
            src: url("fonts/FrutigerLTArabic-75Black_6h.woff") format("woff");
        }




        #t {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        #t th,
        #t thead tr td {
            font-weight: bold;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 18px;
            /* text-align: left; */
            padding: 16px;


        }

        #t tbody tr:nth-child(odd) {
            background-color: #F4F5F4;
            color: white;
            color: black;


        }

        #t tbody tr td {
            padding: 10px;
            text-align: center;
        }

        .table3 {
            padding: 3px;
            width: 100%;
            height: auto;
            text-align: end;

            display: flex;
            justify-content: start;
            flex-direction: column;
        }

        .table2 th,
        .table2 tr td {
            border-left: solid #F4F5F4 1px;
            border-bottom: solid #F4F5F4 1px;
        }


        .table3 th,
        .table3 thead tr td {
            border-left: solid #B7B9B8 1px;
            border-bottom: solid #B7B9B8 1px;
            text-align: center;
            padding: 8px;
        }
    </style>
    {{-- <link rel="stylesheet" href="{{asset("css/main.css")}}" /> --}}
</head>

<body>
    <div class="conatiner">
        <div class="title2">
            <div class="table2">
                <!-- MainTable -->
                <table id="t">
                    <thead class="main_table" style="background-color: #4F894A;">
                        <tr>
                            <td id="" style="color: white; text-align: center;background-color: #4F894A;">
                                الإجمالي</td>
                            <td id="" style="color: white; text-align: center;background-color: #4F894A;">
                                التاريخ</td>
                            <td id="" style="color: white; text-align: center;background-color: #4F894A;">
                                رقم الطلب
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($orders as $order)
                            <tr>
                                <td>{{$order->total}}</td>
                                <td>{{$order->created_at}}</td>
                                <td>{{$order->order_number}}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <!-- MainTable -->
            </div>
        </div>
    </div>
</body>

</html>
