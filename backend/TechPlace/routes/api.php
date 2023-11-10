<?php

use App\Http\Controllers\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/products',[ProductController::class,'getAll']);
Route::get('/products/{id}',[ProductController::class,'getProduct']);
Route::put('/products/{id}',[ProductController::class,'update']);
Route::post('/products',[ProductController::class,'create']);
Route::delete('/products/{id}',[ProductController::class,'delete']);

Route::post('/products/{id}/profile',[ProductController::class,'uploadProfile']);