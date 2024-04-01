<?php

namespace App\Services;

use App\Enums\OrderStatus;
use App\Enums\StatisticsEnums;
use App\Http\Resources\OrderResource;
use App\Models\Order;
use App\Models\Driver;
use App\Helpers\AuthHelper;
use App\Http\Resources\OrderDetailResource;
use Barryvdh\DomPDF\Facade\Pdf;
use function Spatie\LaravelPdf\Support\pdf;
use Spatie\Browsershot\Browsershot;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;

class DriverService
{
    public function getDriverDues()
    {
        $driver_id = AuthHelper::userAuth()->id;

        $dues = Order::where([['driver_id', $driver_id]])->sum('delivery_fee');

        $orders = Order::where([['driver_id', $driver_id], ['status', OrderStatus::Deliverd]])
            ->orderBy('created_at', 'Desc')
            ->take(5)
            ->select('order_number', 'created_at', 'total')->get();

        // add date
        $data =  $orders->map(function ($order) {
            $order->time = Carbon::parse($order->created_at)->format('Y/m/d');
            return $order;
        });

        return  ['driver_dues' => $dues, 'orders' => $data];
    }

    public function acceptOrderByDriver($order)
    {
        if ($order->driver_id == null && $order->status == OrderStatus::Pending) {
            $driver_id = AuthHelper::userAuth()->id;

            $order->driver_id = $driver_id;
            $order->status =  OrderStatus::Confirmed;
            $order->save();

            return  true;
        }

        return  false;
    }

    public function generatePdfAllOrdersForDriver($driver_id)
    {
        $orders = Order::where('driver_id', $driver_id)->orderBy('created_at', "desc")->select('order_number', 'created_at', 'total')->get()->toArray();

        $pdf = Pdf::loadView('inv', ['data' => $orders]);
        return $pdf->download('invoice.pdf');

        // $view = view('welcome', [
        //   ])->render();

        //   $name = 'name_of_my.pdf';

        //   Browsershot::html($view)
        //   ->addChromiumArguments([
        //   'font-render-hinting' => 'none',
        //   'allow-running-insecure-content',
        //   'autoplay-policy' => 'user-gesture-required',
        //   'disable-component-update',
        //   'disable-domain-reliability',
        //   'disable-features' => 'AudioServiceOutOfProcess,IsolateOrigins,site-per-process',
        //   'disable-print-preview',
        //   'disable-setuid-sandbox',
        //   'disable-site-isolation-trials',
        //   'disable-speech-api',
        //   'disable-web-security',
        //   'disable-setuid-sandbox',
        //   'disable-dev-shm-usage',
        //   'disk-cache-size' => 33554432,
        //   'enable-features' => 'SharedArrayBuffer',
        //   'hide-scrollbars',
        //   'ignore-gpu-blocklist',
        //   'in-process-gpu',
        //   'mute-audio',
        //   'no-default-browser-check',
        //   'no-pings',
        //   'no-sandbox',
        //   'no-zygote',
        //   'use-gl' => 'swiftshader',
        //   'window-size' => '1920,1080',
        //   'single-process'
        //   ])
        //   ->timeout(120000)
        //   ->waitUntilNetworkIdle()
        //   ->scale('0.8')
        //   ->format('a4')
        //   ->landscape()
        //   ->save(public_path('downloads').'/'.$name);
    //    return Browsershot::html('<h1>Hello world!!</h1>')->save('example.pdf');
        // return pdf()
        // ->view('welcome')
        // ->name('invoice-2023-04-10.pdf')
        // ->download();
    }

    public function updateDriverInfo($driver_id, $data)
    {

        $res = [];
        $driver = Driver::find($driver_id);
        if ($driver) {
            $driver->first_name = $data['first_name'];
            $driver->last_name =  $data['last_name'];
            $driver->save();
            $res['status'] = true;
            $res['message'] = "success";
            return  $res;
        } else {
            $res['status'] = false;
            $res['message'] = "driver not found";
            return $res;
        }
    }

    public function getAllOrders()
    {
        $driver_id = AuthHelper::userAuth()->id;
        $orders = Order::where("driver_id", $driver_id)
            ->where('status', OrderStatus::Deliverd)
            ->orderBy('created_at', 'Desc')->get();

        return OrderResource::collection($orders);
    }
    public function getLastFiveOrdersPending()
    {
        $orders = Order::where('status', OrderStatus::Pending)
            ->orderBy('created_at', 'Desc')
            ->take(5)->with('userAddress')->get();

        $data =  $orders->map(function ($order) {
            $hour = Carbon::parse($order->created_at)->hour;
            $time = $hour >= 12 ? "PM " . Carbon::parse($order->created_at)->subHours(12)->format('H:i')
                : "AM " . Carbon::parse($order->created_at)->format('H:i');

            return [
                'id' => $order->id,
                'order_number' => $order->order_number,
                'location' => $order->userAddress ? $order->userAddress->address : null,
                'status' => $order->status,
                'date' =>  Carbon::parse($order->created_at)->format('d/m/y'),
                'time' => $time,
            ];
        });

        return $data;
    }
    public function getDriverOrders()
    {
        $driver_id = AuthHelper::userAuth()->id;

        $orders = Order::where([['driver_id', $driver_id], ['status', [OrderStatus::Confirmed, OrderStatus::OnDelivery]]])
            ->orderBy('created_at', 'Desc')
            ->get();

        return OrderResource::collection($orders);
    }
    public function getDriverOrderDetail($order_id)
    {
        $driver_id = AuthHelper::userAuth()->id;

        $orders = Order::where("id", $order_id)
            ->orderBy('created_at', 'Desc')
            ->get();

        return OrderDetailResource::collection($orders);
    }

    public function calculateWeekHistory($date)
    {
        $weekData = [];

        $driver_id = AuthHelper::userAuth()->id;
        $now =  Carbon::parse($date);

        for ($i = 0; $i < 7; $i++) {
            $weekData[$now->minDayName] = Order::where('driver_id', $driver_id)
                ->where('status', OrderStatus::Deliverd)
                ->whereDate('date', $now->format("Y-m-d"))
                ->count();

            $now = $now->subDay();
        }
        return ["week_data" => $weekData];
    }

    public function calculateMonthlyHistory($date)
    {
        $monthData = [];

        $driver_id = AuthHelper::userAuth()->id;
        $firstDay =  Carbon::parse($date)->startOfMonth();
        $lastDay =  Carbon::parse($date)->lastOfMonth();

        for ($i = $lastDay->daysInMonth; $i > 0; $i--) {

            $monthData[$i] = Order::where('driver_id', $driver_id)
                ->where('status', OrderStatus::Deliverd)
                ->whereDate('date', ">=", $firstDay->format("Y-m-d"))
                ->whereDate('date', "<=", $lastDay->format("Y-m-d"))
                ->whereDate('date', $lastDay->format("Y-m-d"))
                ->count();

            $lastDay = $lastDay->subDay();
        }
        return ["month_data" => $monthData];
    }

    public function getOrdersHistory()
    {
        $driver_id = AuthHelper::userAuth()->id;
        $date = request("date") != null ? request("date") : Carbon::now();

        $query = Order::where('driver_id', $driver_id)
            ->orderBy('created_at', 'Desc');

        $ordersCount = $query->count();

        $driverOrders =  $query->where('status', OrderStatus::Deliverd)
            ->get();

        $monthData = null;
        if (request("type") == StatisticsEnums::MONTHLY) {
            $monthData = $this->calculateMonthlyHistory($date);
        }

        $weekData = null;
        if ($monthData == null || request("type") == StatisticsEnums::WEEKLY) {
            $weekData = $this->calculateWeekHistory($date);
        }

        return array_merge(isset($weekData) ? $weekData : [], isset($monthData) ? $monthData : [], [
            'orders_count' => $ordersCount,
            "driver_orders" => OrderResource::collection($driverOrders)
        ]);
    }
}
