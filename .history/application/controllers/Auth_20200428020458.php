<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Auth extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Auth_model');
        $this->load->library('form_validation');
    }
    public function index()
    {
        $userdata = $this->session->userdata();
        var_dump($this->session->userdata);die;
        if ($userdata['isLogin']) {
            if($userdata['user-data']['role'] == 1)
                redirect('Admin');

            if($userdata['user-data']['role'] == 2)
                redirect('User');
        }
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('password', 'Password', 'trim|required');
        if ($this->form_validation->run() == false) {
            $data['title'] = 'Halaman Login';
            $this->load->view('templates/login_header', $data);
            $this->load->view('auth/login');
            $this->load->view('templates/login_footer');
        } else {
            $this->_login();
        }
    }

    private function _login()
    {
        $email = $this->input->post('email');
        $password = $this->input->post('password');

        $user = $this->db->get_where('tbl_user', ['email' => $email])->row_array();

        // cek user ada apa tidak
        if ($user) {
            if ($user['is_active'] == 1) {
                // cek password
                if (password_verify($password, $user['password'])) {
                    $data = array(
                        'user-data'=> $user,
                        'isLogin' => true,
                    );
                    // var_dump($user);die;
                    $this->session->set_userdata($data);
                    if ($user['role'] == 1) {
                        redirect('admin');
                    }
                    if($user['role'] == 2){
                        redirect('user');
                    }
                } else {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
                    Wrong password!
                  </div>');
                    redirect('auth');
                }
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
                This email has not been activated!
              </div>');
                redirect('auth');
            }
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
            Email is not registered!
          </div>');
            redirect('auth');
        }
    }
    public function registrasi()
    {
        $data['title'] = 'Halaman Registrasi';

        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[tbl_user.email]');
        $this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[3]|matches[password2]', [
            'matches' => 'password dont match!',
            'min_length' => 'password too short'
        ]);
        $this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');
        if ($this->form_validation->run() == false) {
            $this->load->view('templates/login_header', $data);
            $this->load->view('auth/registrasi');
            $this->load->view('templates/login_footer');
        } else {
            $this->Auth_model->tambahDataUser();
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
            Akun Telah Dibuat
          </div>');
            redirect('auth');
        }
    }
    public function logout()
    {
        $this->session->sess_destroy();
        $data = array(
            'isLogin' => false
        );
        $this->session->set_userdata($data);
        // $this->session->unset_userdata('id_status');
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
        You have been logged out !
      </div>');
        var_dump($this->session->userdata);

        redirect('auth');
    }
}