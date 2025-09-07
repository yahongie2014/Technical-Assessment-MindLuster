<?php

use App\Http\Controllers\TaskController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;


Route::post('/auth/login', function (Request $r) {
    $r->validate(['email' => 'required|email', 'password' => 'required']);
    $user = User::where('email', $r->email)->first();
    abort_if(!$user || !Hash::check($r->password, $user->password), 401, 'Invalid credentials');
    $token = $user->createToken('api')->plainTextToken;
    return response()->json(['token' => $token, 'user' => $user]);
});

Route::middleware('auth:sanctum')->post('/auth/logout', function (Request $r) {
    $r->user()->currentAccessToken()->delete();
    return response()->json(['message' => 'Logged out']);
});

Route::middleware('auth:sanctum')->group(function () {
    Route::resource('tasks', TaskController::class);
});
