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
class Admin  extends CI_Controller{
     public function __construct() {
         parent::__construct();
          $this->load->model('Jelo');
           $this->load->model("Zahtev");
        $this->load->model("Korisnik");
        $this->load->model("Kuvar");
          if (($this->session->userdata('korisnik')) == NULL) {
            redirect("Gost");
          }
          if ($this->session->userdata('korisnik')->oznaka == 'R') {
            redirect("Registrovani");
          }
          if ($this->session->userdata('korisnik')->oznaka == 'K'){
                 redirect("Kuvar");
          }
		 
    }
  
     private function prikazi($glavniDeo, $data){
       
        $data['controller']='Registrovani';
        $this->load->view("sablon/admin_header.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }
    public function index(){
      $data['zahtevi'] = $this->Zahtev->dohvatiZahteve();
        $this->prikazi("requirements.php", $data);
    }
    public function pretraga(){
        //uzme podatak 
        $search = $this->input->get('searchBox');
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloIme($search);
        $this->prikazi("rezultatipretrage.php",$data);      
    }
     public function prikaziJelo($id){
     $data=[];
     $data['jelo']=$this->Jelo->dohvatiJeloId($id);
     $data['komentari']= $this->Jelo->dohvatiKomentareJela($id);
     $data['ocene']= $this->Jelo->dohvatiOceneJela($id);
       $this->prikazi("recipe_demo.php",$data);
    }
    
     public function prikazipretraga(){
        $data=[];
        $this->prikazi("search.php",$data);
    }
    
    
     public function ukloniKomentar($idK,$idR){
        $this->Jelo->ukloniKomentar($idK);
         redirect(site_url("Admin/prikaziJelo/".$idR));
    }
     public function prikaziPrilika($prilika){
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloPrilika($prilika);
        $this->prikazi("rezultatipretrage.php",$data);
    }
    
    public function prikaziPoSastojku($sastojak){
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloSastojak($sastojak);
        $this->prikazi("rezultatipretrage.php",$data);
    }
    
     public function prikaziKategoriju($kategorija){
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloKategorija($kategorija);
        $this->prikazi("rezultatipretrage.php",$data);
    }
   public function logout(){
        $this->session->unset_userdata("korisnik");// brise se podatak o autoru iz sesije
        $this->session->sess_destroy(); //brise se sesija
        redirect("Gost");//kako vise nije ulogovan, treba da se ponasa kao sto je definisano u kontroleru gost
    }
   
    public function sacuvajCV($id){
        $z= $this->Zahtev->dohvatiZahtev($id);
        echo $z[0]->cv;
        header("Content-Disposition: attachment; filename='cv'");
    }
}
