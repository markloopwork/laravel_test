<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
//All Login and Register Logout Route
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->middleware('auth')->name('home');
Route::get('/user-edit/{id}', [App\Http\Controllers\HomeController::class, 'user_edit'])->middleware('auth')->name('UserEdit');
Route::post('/user-update', [App\Http\Controllers\HomeController::class, 'user_update'])->middleware('auth')->name('userUpdate');
