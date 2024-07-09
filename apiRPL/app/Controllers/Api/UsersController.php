<?php

namespace App\Controllers\Api;

use App\Models\ProfileModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class ProfileController extends ResourceController
{
    use ResponseTrait;

    private $profileModel;
    private $secretKey;

    public function __construct()
    {
        $this->profileModel = new ProfileModel();
        $this->secretKey = getenv('JWT_SECRET_KEY');
    }

    public function show($id = null)
    {
        // Extract the user ID from the token
        $authHeader = $this->request->getHeader("Authorization");
        $token = null;

        if ($authHeader) {
            $token = $authHeader->getValue();
        }

        if ($token) {
            try {
                $decoded = JWT::decode($token, new Key($this->secretKey, 'HS256'));
                $userId = $decoded->uid;

                $user = $this->profileModel->find($userId);
                if ($user) {
                    return $this->respond($user);
                } else {
                    return $this->failNotFound('User not found');
                }
            } catch (\Exception $e) {
                return $this->fail('Invalid token');
            }
        }

        return $this->failUnauthorized('Token not provided');
    }

    public function update($id = null)
    {
        // Extract the user ID from the token
        $authHeader = $this->request->getHeader("Authorization");
        $token = null;

        if ($authHeader) {
            $token = $authHeader->getValue();
        }

        if ($token) {
            try {
                $decoded = JWT::decode($token, new Key($this->secretKey, 'HS256'));
                $userId = $decoded->uid;

                $data = $this->request->getRawInput();

                // Handle file upload
                if ($this->request->getFile('foto_profile')->isValid()) {
                    $file = $this->request->getFile('foto_profile');
                    $newName = $file->getRandomName();
                    $file->move(WRITEPATH . 'uploads', $newName);
                    $data['foto_profile'] = $newName;
                }

                $this->profileModel->update($userId, $data);
                return $this->respond(['message' => 'Profile updated successfully']);
            } catch (\Exception $e) {
                return $this->fail('Invalid token');
            }
        }

        return $this->failUnauthorized('Token not provided');
    }
}
