<?php

namespace App\Models;

use CodeIgniter\Model;

class ProfileModel extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'username', 'password', 'email', 'foto_profile', 'nama_lengkap', 
        'tanggal_lahir', 'jenis_kelamin', 'nohp', 'alamat'
    ];
}
