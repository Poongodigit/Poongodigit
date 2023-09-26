<?php

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

/* api routes for create and Read and Store payload */

// Route::group(['middleware' => ['cors', 'json.response']], function (){
    Route::post('register', 'App\Http\Controllers\API\RegisterController@register');
    Route::post('login', 'App\Http\Controllers\API\RegisterController@login');

    Route::middleware('auth:api')->group( function () {
    Route::get('posts/{userid}', 'App\Http\Controllers\API\PostsController@index');
    });

    Route::post('saveData', 'App\Http\Controllers\API\PostsController@savePostData');
// });


