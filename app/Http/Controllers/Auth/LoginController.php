<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use \App\Models\User;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    /**
     * User login check Email or Mobile Number and Password md5
     *
     * @return void
     */
    protected function attemptLogin(Request $request)
    {
        if (is_numeric($request->get('email'))) {
            $check = ['mobile_number' => $request->get('email'), 'password' => md5($request->get('password'))];
        } elseif (filter_var($request->get('email'), FILTER_VALIDATE_EMAIL)) {
            $check =  ['email' => $request->get('email'), 'password' => md5($request->get('password'))];
        }
        $user = User::where($check)->first();

        if ($user) {
            $this->guard()->login($user, $request->has('remember'));

            return true;
        }

        return false;
    }

    /**
     * Logout to Login Page Redirect
     *
     * @return void
     */
    public function logout(Request $request)
    {
        Auth::logout();
        return redirect('/login');
    }
}
