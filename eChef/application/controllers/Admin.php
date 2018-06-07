<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Admin
 *
 * @author Korisnik
 */
class Admin extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("Zahtev");
        $this->load->model("Korisnik");
        $this->load->model("Kuvar");
        //$this->load->library('session');
    }

    private function prikazi($glavniDeo, $data) {
        //$podaci['autor']=$this->session->userdata('autor');
        //$data[controller] = 'admin';
        $this->load->view("sablon/admin_header.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }

    public function index() {
        $data['zahtevi'] = $this->Zahtev->dohvatiZahteve();
        $this->prikazi("requirements.php", $data);
    }

    public function pretraga() {

        $search = $this->input->get('searchBox');
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloIme($search);
        $this->prikazi("rezultatipretrage.php", $data);
    }

    public function prikaziPrilika($prilika) {
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloPrilika($prilika);
        $this->prikazi("rezultatipretrage.php", $data);
    }

    public function prikaziPoSastojku($sastojak) {
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloSastojak($sastojak);
        $this->prikazi("rezultatipretrage.php", $data);
    }

    public function prikaziKategoriju($kategorija) {
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloKategorija($kategorija);
        $this->prikazi("rezultatipretrage.php", $data);
    }

    public function logout() {
        $this->session->unset_userdata("korisnik");
        $this->session->sess_destroy();
        redirect("Gost");
    }

    public function odobriZahtev($id) {
        $this->Zahtev->odobriZahtev($id);
        redirect("Admin/index");
    }

    public function odbijZahtev($id) {
        $this->Zahtev->odbijZahtev($id);
        redirect("Admin/index");
    }

    
    
    public function sacuvajCV($id){
        $z= $this->Zahtev->dohvatiZahtev($id);
        echo $z[0]->cv;
        header("Content-Disposition: attachment; filename='cv'");
    }
    public function ukloniKomentar() {
        //gleda dal logovan itd
        // gledaj dal je komentariso do sad.
        // ukloni ocenu
        // prikaze opet to jelo
        //znaci pozove prikazi.         
    }

}
