<?php
class Admin extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        if (!$this->session->userdata("isLogin")) {
            redirect('auth');
        }

        if($this->session->userdata('role') == 2)
            redirect('User');
    }
    public function index()
    {
        $data['title'] = 'My Profile';
        $data['user'] = $this->db->get_where('tbl_user', ['email' =>
        $this->session->userdata('email')])->row_array();

        $this->load->view("templates/header", $data);
        $this->load->view("templates/sidebar", $data);
        $this->load->view("templates/topbar", $data);
        $this->load->view("admin/index", $data);
        $this->load->view("templates/footer");
    }
}