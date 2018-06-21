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
         $this->load->model('Korisnik');
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
    public function pretraga(){
        //uzme podatak 
        $search = $this->input->get('searchBox');
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloIme($search);
        $this->prikazi("rezultatipretrage.php",$data);
    }
    public function prikaziDodavanjeRecepta(){
        $data=[];
        $this->prikazi("recipe-uploadx.php",$data);
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
    // ovde je stavio WEB/eChef/images/ ako je na www onda ovo menjati.
	//funkcija koja dodaje novi recept u bazu 
    public function postavitiRecept()
    {
        
        $uploaddir = '/WEB/eChef/images/';
        $uploadfile = $uploaddir . basename($_FILES['image']['name']);
        move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile);
        
        $naziv= $this->input->post('recipe_name');
        $img="/images/" . $_FILES["image"]["name"];
        $sadrzaj= $this->input->post('instructions');
        $obrok= $this->input->post('specMeals[]');
        $kategorija= $this->input->post('categories[]');
        $spec=$this->input->post('holidayRecipe[]');
        
        $sastojci= $this->input->post('chk_group[]');
        
        $this->Jelo->postaviJelo($naziv,$img,$sadrzaj,$obrok,$kategorija,$spec,$sastojci);
        
        
        redirect(site_url("Kuvar/index"));
    }
    
   public function knjiga(){
        $data = [];
        $data['jela'] = $this->Korisnik->knjiga($this->session->userdata('korisnik')->idK);
        $this->prikazi("book-2-column.php",$data);
     }
    public function dodajUKnjigu($id){
       $this->Korisnik->dodajUKnjigu($this->session->userdata('korisnik')->idK,$id);
       redirect(site_url("Kuvar/prikaziJelo/".$id));    
     }
    public function ukloniIzKnjige($id){
        $this->Korisnik->ukloniIzKnjige($this->session->userdata('korisnik')->idK,$id);
        redirect(site_url("Kuvar/prikaziJelo/".$id)); 
    }
       public function oceni($idK,$ocena,$idR)
    {
        $this->Jelo->dodajOcenu($idK,$ocena,$idR);
       redirect(site_url("Kuvar/prikaziJelo/".$idR));
    }
    public function dodajKomentar()
    { 
        $data = array
        (
            'idKorisnika'=> $this->session->userdata('korisnik')->idK,
            'sadrzaj' => $this->input->get('comment'),
            'idR' => $this->input->get('idr')
        );
        
        $this->Jelo->dodajKomentar($data);
        redirect(site_url("Kuvar/prikaziJelo/".$data['idR']));
    }
    
    public function ukloniKomentar($idK,$idR){
        $this->Jelo->ukloniKomentar($idK);
        redirect(site_url("Kuvar/prikaziJelo/".$idR));
    }
    public function logout(){
        $this->session->unset_userdata("korisnik");// brise se podatak o autoru iz sesije
        $this->session->sess_destroy(); //brise se sesija
        redirect("Gost");//kako vise nije ulogovan, treba da se ponasa kao sto je definisano u kontroleru gost
    }
}
