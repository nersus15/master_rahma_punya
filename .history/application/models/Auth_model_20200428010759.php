<?php
class Auth_model extends CI_Model
{
    // public function getAllUser()
    // {
    //     return $this->db->get('tbl_user')->result_array();
    // }
    public function tambahDataUser()
    {
        $data = [
            'username' => htmlspecialchars($this->input->post('name', true)),
            'email' => htmlspecialchars($this->input->post('email', true)),
            'image' => 'default.jpg',
            'password' => password_hash(
                $this->input->post('password1'),
                PASSWORD_DEFAULT
            ),
            'id_status' => 2,
            'is_active' => 1,
            'role' => 2, // 1 Admin, 2 User
            'date_created' => time()
        ];
        $this->db->insert('tbl_user', $data);
    }
}