<?php

namespace App\Controllers\Api;

use App\Models\UserModel;
use CodeIgniter\RESTful\ResourceController;
use Firebase\JWT\JWT;

class AuthController extends ResourceController
{
    private $userModel;
    private $secretKey;

    public function __construct()
    {
        $this->userModel = new UserModel();
        $this->secretKey = getenv('JWT_SECRET_KEY');
    }

    public function register()
    {
        $rules = [
            'username' => 'required|min_length[3]|max_length[50]|is_unique[users.username]',
            'email' => 'required|valid_email|is_unique[users.email]',
            'password' => 'required|min_length[6]',
            'confirm_password' => 'matches[password]'
        ];

        if (!$this->validate($rules)) {
            return $this->fail($this->validator->getErrors());
        }

        $data = [
            'username' => $this->request->getVar('username'),
            'email' => $this->request->getVar('email'),
            'password' => $this->request->getVar('password') // Tanpa hashing di controller
        ];

        if ($this->userModel->save($data)) {
            return $this->respondCreated(['message' => 'User registered successfully']);
        } else {
            return $this->fail($this->userModel->errors());
        }
    }

    public function login()
    {
        $username = $this->request->getVar('username');
        $password = $this->request->getVar('password');

        // Debug: Cek apakah username dan password diterima dengan benar
        log_message('debug', 'Username: ' . $username);
        log_message('debug', 'Password: ' . $password);

        $user = $this->userModel->where('username', $username)->first();

        // Debug: Cek apakah user ditemukan di database
        if ($user) {
            log_message('debug', 'User found: ' . json_encode($user));
        } else {
            log_message('debug', 'User not found');
        }

        // Tanpa password hashing, langsung membandingkan plaintext password
        if (!$user || $password !== $user['password']) {
            log_message('debug', 'Invalid password for user: ' . $username);
            return $this->failUnauthorized('Invalid username or password');
        }

        $payload = [
            'iat' => time(),
            'exp' => time() + 3600, // Token expires in 1 hour
            'uid' => $user['id'],
        ];

        $token = JWT::encode($payload, $this->secretKey, 'HS256');

        return $this->respond(['token' => $token]);
    }
}
