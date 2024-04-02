<?php

namespace App\Services;

use App\Models\Driver;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Helpers\AuthHelper;
use App\Traits\ModelHelper;

class ProfileService
{
    use ModelHelper;

    public function find($driverId)
    {
        return $this->findByIdOrFail(Driver::class, 'driver', $driverId);
    }

    public function changePassword($validatedData)
    {

        $driver = Driver::find(AuthHelper::userAuth()->id);
        DB::beginTransaction();

        $driver->update(['password' => Hash::make($validatedData['password'])]);

        DB::commit();

        return true;
    }


    public function update($validatedData, $driverId)
    {
        $driver = $this->find($driverId);

        DB::beginTransaction();
        if (array_key_exists('password', $validatedData)) {
            $validatedData['password'] = Hash::make($validatedData['password']);
        }

        $driver->update($validatedData);

        DB::commit();

        return $driver;
    }

    public function delete($driverId)
    {
        $driver = $this->find($driverId);

        DB::beginTransaction();

        $driver->delete();

        DB::commit();

        return true;
    }
}
