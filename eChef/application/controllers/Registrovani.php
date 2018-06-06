<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Registrovani
 *
 * @author Korisnik
 */
class Registrovani extends CI_Controller {
    public function __construct() {
           parent::__construct();
           $this->load->model('Jelo');
           $this->load->model('Korisnik');
           
          if (($this->session->userdata('korisnik')) == NULL) {
            redirect("Gost");
          }
          if ($this->session->userdata('korisnik')->oznaka == 'a') {
            redirect("Admin");
          }
          if ($this->session->userdata('korisnik')->oznaka == 'k'){
                 redirect("Kuvar");
          }
		 
    }
    // samo poziva prikazi sa drugim podacima..
    //isto kao i kod gosta samo se loaduje novi novi header.  
    public function index(){
       $podaci=[];
       $this->prikazi("home.php",$podaci);
    }
    
    public function pretraga(){
        //uzme podatak 
        $search = $this->input->get('searchBox');
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloIme($search);
        $this->prikazi("rezultatipretrage.php",$data);
        // uradi pretragu 
        //poziva metodu prikazi za jela sto je dobio.
         // $this->prikazi("jelo stranica",array rezultata);
    }
    
    
    public function prikazipretraga(){
        $data=[];
        $this->prikazi("search.php",$data);
    }
    
    
    public function predloziJelo(){
     
        $jela=$this->Jelo->getOmiljenaJela($this->session->userdata('korisnik')->idK);
        $size=count($jela);
        $ind=mt_rand(0,$size-1);
        
        /*ob_flush();
        ob_start();
        var_dump($size);
        file_put_contents('dump.txt', ob_get_flush());
        
        ob_flush();
        ob_start();
        var_dump($ind);
        file_put_contents('dump.txt', ob_get_flush());
        
        ob_flush();
        ob_start();
        var_dump($jela[$ind]->idR);
        file_put_contents('dump.txt', ob_get_flush());*/
        
        $this->prikaziJelo($jela[$ind]->idR);
        
    }    

    public function izradiPlanIshrane(){
        // proveri dal ima vec plan. 
        // ukoliko ima tj nije jos istekao
        // onda pozove prikaz njegov
        // ukoliko nema generisi jela pa prikazi
        // sa odgovarajucim prikazom i podacima
    }
    
     public function knjiga(){
        $data = [];
        $data['jela'] = $this->Korisnik->knjiga($this->session->userdata('korisnik')->idK);
        $this->prikazi("book-2-column.php",$data);
     }

    public function oceni($idK,$ocena,$idR)
    {
        $this->Jelo->dodajOcenu($idK,$ocena,$idR);
       redirect(site_url("Registrovani/prikaziJelo/".$idR));
    }
    
    public function ukloniOcenu(){
        //gleda dal logovan itd
        // gledaj dal je ocenjivo do sad.
        // ukloni ocenu
        // prikaze opet to jelo
        //znaci pozove prikazi.
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
        redirect(site_url("Registrovani/prikaziJelo/".$data['idR']));
    }
    
    public function ukloniKomentar($idK,$idR){
        $this->Jelo->ukloniKomentar($idK);
        redirect(site_url("Registrovani/prikaziJelo/".$idR));
    }
    
    public function dodajUKnjigu($id){
       $this->Korisnik->dodajUKnjigu($this->session->userdata('korisnik')->idK,$id);
       redirect(site_url("Registrovani/prikaziJelo/".$id));    
     }
    public function ukloniIzKnjige($id){
        $this->Korisnik->ukloniIzKnjige($this->session->userdata('korisnik')->idK,$id);
        redirect(site_url("Registrovani/prikaziJelo/".$id)); 
    }
    private function prikazi($glavniDeo, $data){
       
        $data['controller']='Registrovani';
        $this->load->view("sablon/registrovan_header.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }
    
    public function logout(){
        // ubija sesiju
        //preusmeri na gosta.
    }
    
    
    
     public function prikaziJelo($id){
     $data=[];
     $data['jelo']=$this->Jelo->dohvatiJeloId($id);
     $data['sastojci']= $this->Jelo->dohvatiSastojkeJela($id);
     $data['komentari']= $this->Jelo->dohvatiKomentareJela($id);
     $data['ocene']= $this->Jelo->dohvatiOceneJela($id);
       //$data = $this->Jelo->dohvatiPodatkeJelo($id);
       $this->prikazi("recipe_demo.php",$data);
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
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     

