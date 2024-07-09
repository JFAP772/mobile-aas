<?php

namespace App\Models;

use CodeIgniter\Model;

class UserModel extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'username', 'password', 'email', 'foto_profile', 'nama_lengkap', 
        'tanggal_lahir', 'jenis_kelamin', 'nohp', 'alamat'
    ];

    // Hapus callback hashPassword
    // protected $beforeInsert = ['hashPassword'];
    // protected $beforeUpdate = ['hashPassword'];

    // Hapus method hashPassword
    // protected function hashPassword(array $data)
    // {
    //     if (isset($data['data']['password'])) {
    //         $data['data']['password'] = password_hash($data['data']['password'], PASSWORD_DEFAULT);
    //     }

    //     return $data;
    // }
}
