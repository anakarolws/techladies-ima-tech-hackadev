<?php

use App\Http\Controllers\Api\ProductAPIController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;

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

Route::get('/products',[ProductAPIController::class,'getAll']);
Route::get('/products/{id}',[ProductAPIController::class,'getProduct']);
Route::put('/products/{id}',[ProductAPIController::class,'update']);
Route::post('/products',[ProductAPIController::class,'create']);
Route::delete('/products/{id}',[ProductAPIController::class,'delete']);

Route::post('/products/{id}/profile',[ProductAPIController::class,'uploadProfile']);

Route::get('/storage/{id}', function (int $id) {
    $product = Product::findOrFail($id);

    $storeUrl = "public/$product->profile";

    $imagem = Storage::get($storeUrl);
    $mime = Storage::mimeType($storeUrl);

    return response($imagem, 200)
            ->header('Content-Type', $mime);
});