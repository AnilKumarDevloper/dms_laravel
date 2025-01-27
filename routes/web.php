<?php

use App\Http\Controllers\backend\PermissionController;
use App\Http\Controllers\backend\RollController;
use App\Http\Controllers\ProfileController;


use App\Models\User;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('/dashboard', function () {
//     $user = User::first();
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function (){
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');


// Route::get('roll', [RollController::class, 'index'])->name('roll.index');
// Route::get('create-roll', [RollController::class, 'create'])->name('roll.create');
// Route::post('store-roll', [RollController::class, 'store'])->name('roll.store');
// Route::get('assign-roll', [RollController::class, 'assignRollView'])->name('roll.assign_roll_view');
// Route::post('assign-roll-store', [RollController::class, 'assignRollStore'])->name('roll.assign_roll_store');

// Route::get('assign-permission', [PermissionController::class, 'assignPermissionView'])->name('permission.assign_permission_view');
// Route::get('assign-permission-store', [PermissionController::class, 'assignPermissionStore'])
// ->name('permission.assign_permission_store');


// Route::get('permission', [PermissionController::class, 'index'])->name('permission.index');
// Route::get('create-permission', [PermissionController::class, 'create'])->name('permission.create');
// Route::post('store-permission', [PermissionController::class, 'store'])->name('permission.store');
});

require __DIR__.'/frontend.php';
require __DIR__.'/backend.php';
require __DIR__.'/auth.php';
