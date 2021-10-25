<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserDocuments extends Model
{
    protected $fillable = ['user_id','document'];
}
