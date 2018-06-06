<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Kuvar
 *
 * @author Korisnik
 */
class Kuvar extends CI_Controller {
    public function __construct() {
         parent::__construct();
         
         $this->load->model('Jelo');
    }
    public function index(){
       $podaci=[];
       $this->prikazi("home.php",$podaci);
    }
    
    private function prikazi($glavniDeo, $data){
        $data['controller']='Kuvar';
        $this->load->view("sablon/chef_header.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }

     public function pretraga(){
        //uzme podatak 
        $trazi=$this->input->get('pretraga');
        // uradi pretragu 
        //poziva metodu prikazi za jela sto je dobio.
         // $this->prikazi("jelo stranica",array rezultata);
    }
    public function prikaziDodavanjeRecepta(){
        $data=[];
        $this->prikazi("recipe-uploadx.php",$data);
    }
      public function prikaziPrilika(){
    }
    
    public function prikaziPoSastojku(){
        // uzme podatak preko geta sto se setovo kad je klikno dal 
        // je to beef ili chicken ili lunch ili whatever
        // vrsi pretragu  i ispisuje.. 
        // pozivajuci metodu prikazi sa array podatakama.
    }
    
     public function prikaziKategoriju(){
        // uzme podatak preko geta sto se setovo kad je klikno dal 
        // je to dorucak ili rucak ili sta god.
        // vrsi pretragu  i ispisuje.. 
        // pozivajuci metodu prikazi sa array podatakama.
    }
    public function postavitiRecept(){
        $uploaddir = '/WEB/eChef/images/';
        $uploadfile = $uploaddir . basename($_FILES['image']['name']);
        move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile);
        
        $naziv= $this->input->post('recipe_name');
        $img="/images/" . $_FILES["image"]["name"];
        $sadrzaj= $this->input->post('instructions');
        $obrok= $this->input->post('specMeals[]');
        $kategorija= $this->input->post('categories[]');
        $spec=$this->input->post('holidayRecipe[]');
        
        $idR=$this->Jelo->postaviJelo($naziv,$img,$sadrzaj,$obrok,$kategorija,$spec);
        
        
       // save_string_to_database("images/" . $_FILES["image"]["name"]);
        


    }
    
    
    
      public function knijga(){
     // proveri dal validan korisnik itd.
     // dohvati njegove knjige i prosledi u prikazi sa odgovar
     //jucom stranicom.
    }
      public function dodajUKnjigu(){
        //proveri dal logovan itd.
        //proveri dal ima vec u knjigu
        // dodaj mu i nista nek ostane na tu stranicu
    }
    public function ukloniIzKnjige(){
        // proveri dal logovan itd.
        //proveri dal ima vec u knjigu
        // ukloni 
    }
     public function dodajOcenu(){
        //gleda dal logovan itd.
        // oceni z
        // prikazi opet to jelo.
        // znaci pozove prikazi
    }
    
    public function ukloniOcenu(){
        //gleda dal logovan itd
        // gledaj dal je ocenjivo do sad.
        // ukloni ocenu
        // prikaze opet to jelo
        //znaci pozove prikazi.
    }
    
    public function dodajKomentar(){
        //gleda dal logovan itd.
        // doda komentar
        // prikazi opet to jelo.
        // znaci pozove prikazi
    }
    
    public function ukloniKomentar(){
        //gleda dal logovan itd
        // gledaj dal je komentariso do sad.
        // ukloni ocenu
        // prikaze opet to jelo
        //znaci pozove prikazi.         
    }
    public function logout(){
        // ubija sesiju
        //preusmeri na gosta.
    }
}
