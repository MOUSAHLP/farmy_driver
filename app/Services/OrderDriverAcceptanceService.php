<?php

namespace App\Services;

use App\Models\OrderDriverAcceptance;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Traits\ModelHelper;

class OrderDriverAcceptanceService
{
    use ModelHelper;

    public function find($id)
    {
        return $this->findByIdOrFail(OrderDriverAcceptance::class, 'driver', $id);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $orderDriverAcceptance = OrderDriverAcceptance::create($validatedData);

        DB::commit();

        return $orderDriverAcceptance;
    }

    public function createAccept($validatedData)
    {
        $validatedData["status"] = true;
        DB::beginTransaction();

        $orderDriverAcceptance = $this->create($validatedData);

        DB::commit();

        return $orderDriverAcceptance;
    }

    public function createReject($validatedData)
    {
        $validatedData["status"] = false;
        DB::beginTransaction();

        $orderDriverAcceptance = $this->create($validatedData);

        DB::commit();

        return $orderDriverAcceptance;
    }
    public function update($validatedData, $id)
    {
        $orderDriverAcceptance = $this->find($id);

        DB::beginTransaction();

        $orderDriverAcceptance->update($validatedData);

        DB::commit();

        return $orderDriverAcceptance;
    }

    public function delete($id)
    {
        $orderDriverAcceptance = $this->find($id);

        DB::beginTransaction();

        $orderDriverAcceptance->delete();

        DB::commit();

        return true;
    }

    public function getDriverRate($driverId, $isAcceptance = true)
    {

        DB::beginTransaction();

        $query = OrderDriverAcceptance::where("driver_id", $driverId);

        $allOrderDriver = $query->count();

        $orderDriverRate = $query->where("status", $isAcceptance)->count();

        DB::commit();

        if ($allOrderDriver == 0)
            return 0;

        return ($orderDriverRate / $allOrderDriver) * 100;
    }
}
