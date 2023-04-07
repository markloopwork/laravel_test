<?php

namespace App\Http\Controllers;

use App\Models\UserLog;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * User Log to Register and edit
     *
     * @return void
     */
    public function log_insert($action, $user_id, $action_value)
    {
        $data = array();
        $data['user_id'] = $user_id;
        $data['action_name']  = $action;
        $data['action_value'] = $action_value;
        if (is_array($data['action_value']) || is_object($data['action_value'])) {
            $data['action_value'] = json_encode($data['action_value'], JSON_UNESCAPED_UNICODE);
        }
        $data['ip_address'] = $_SERVER['REMOTE_ADDR'];
        return UserLog::create($data);
    }
}
