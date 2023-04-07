<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserLog extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $table = 'user_log';
    protected $fillable = [
        'user_id',
        'action_name',
        'action_value',
        'action_value',
        'ip_address',
    ];
}
