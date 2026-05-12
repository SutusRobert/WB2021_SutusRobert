<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
Route::get('/ingatlan', [\App\Http\Controllers\IngatlanController::class, 'index']);
Route::post('/ingatlan', [\App\Http\Controllers\IngatlanController::class, 'store']);
Route::delete('/ingatlan/{id}', [\App\Http\Controllers\IngatlanController::class, 'destroy']);