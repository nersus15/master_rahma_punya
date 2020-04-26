<?php
class Home extends CI_Controller
{
    public function index($nama = '')
    {
        $data['title'] = 'Halaman Utama';
        $data['nama'] = $nama;

        $this->load->view('utama/index', $data);
    }
}