<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user_list = DB::table('users')->where('role_id', '2')->get();
        return view('home', compact('user_list'));
    }


    /**
     * User edit.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function user_edit($id)
    {
        if (Auth::user()->role_id == 1) {
            $user_details = User::where('id', '=', $id)->where('role_id', '2')->first();
            if (empty($user_details)) {
                return redirect('home');
            }
            return view('user_edit', compact('user_details'));
        } else {
            return redirect('home');
        }
    }

    /**
     * User Update.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function user_update(Request $request)
    {
        $validate = $request->validate([
            'email' => "required|string|max:255|unique:users,email," . $request->id . ",id",
            'mobile_number' => "required|numeric|digits:10|unique:users,mobile_number," . $request->id . ",id",
            'full_name' => ['required', 'string', 'max:255'],
            'company_name' => ['required', 'string', 'max:255'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);

        if ($validate) {
            $UserUpdate = User::find($request->id);
            $all_data = $request->all();
            $all_data['password'] = md5($request->password);
            $request_data = array('old_data' => $UserUpdate, 'new_data' => $_REQUEST);
            $this->log_insert("User Updated",  $request->id, $request_data);
            $UserUpdate->update($all_data);
            return redirect('home')->with('success', trans('Update Successfully'));
        }
    }
}
