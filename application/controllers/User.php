<?php
class User extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        $userdata = $this->session->userdata();

        if (!$userdata['isLogin']) {
            redirect('auth');
        }
        if($userdata['user-data']['role'] == 1)
            redirect('Admin');
    }
    public function index()
    {
        $data['title'] = 'My Profile';
        $data['user'] = $this->db->get_where('tbl_user', ['email' =>
        $this->session->userdata('email')])->row_array();

        $this->load->view("templates/header", $data);
        $this->load->view("templates/sidebar", $data);
        $this->load->view("templates/topbar", $data);
        $this->load->view("user/index", $data);
        $this->load->view("templates/footer");
    }
}