<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Validator;

class LoginController extends BaseController
{
    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        auth()->setDefaultDriver('api');
    }
    public function login(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
        ]);
        if ($validate->fails()) {
            return $this->sendError('Validation Error.', $validate->errors());
        }
        if (is_numeric($request->get('email'))) {
            $check = ['mobile_number' => $request->get('email'), 'password' => md5($request->get('password'))];
        } elseif (filter_var($request->get('email'), FILTER_VALIDATE_EMAIL)) {
            $check =  ['email' => $request->get('email'), 'password' => md5($request->get('password'))];
        }

        $user = User::where($check)->where('role_id','=','2')->first();

        if ($user) {
            $success['user'] = $user;
            return $this->sendResponse($success, 'User login successfully.');
        } else {
            return $this->sendError('Unauthorised.', ['error' => 'Unauthorised']);
        }
    }
}
