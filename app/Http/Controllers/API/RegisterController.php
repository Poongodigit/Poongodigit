<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\MainController as MainController;
use App\Models\API_Models\API_Model;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use DB;

class RegisterController extends MainController
{
    /**
    * Register api
    *
    * @return \Illuminate\Http\Response
    */

    /* Function for user resgistration email should be unique and passport token will be retrived in success response */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
            'profile_pic' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('Laravel Personal Access Client')->accessToken;
        $success['name'] =  $user->name;

        return $this->sendResponse($success, 'User register successfully.');
    }

    /**
    * Login api
    *
    * @return \Illuminate\Http\Response
    */

    /* Function for user login authenticated user will be logged in using email and password */
    public function login(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
            $user = Auth::user(); 
            $remember_token = $user->createToken('Laravel Personal Access Client')->accessToken; 
            $success['token'] =  $remember_token;
            $success['name'] =  $user->name;

            /* Update the token when user logged in */
            DB::table('users')
                ->where('email', $request->email)  // find your user by their email
                ->limit(1)  // optional - to ensure only one record is updated.
                ->update(array('remember_token' => $remember_token));  // update the record in the DB.
            return $this->sendResponse($success, 'User login successfully.');
        } 
        else{
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        } 
    }
    
}