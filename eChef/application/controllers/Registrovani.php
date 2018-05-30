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
       /*session_start();
        if(!isset($_SESSION['korisnik'])
        * header("Location:?controller=Gost&akcija=index");
        * else if(isset($_SESSION[kuvar]== 1)
        *header("Location:?controller=Kuvar&akcija=index");
         else if(isset($_SESSION[admin]== 1)
        *   header("Location:?controller=Admin&akcija=index");
         */
    }
    // samo poziva prikazi sa drugim podacima..
    //isto kao i kod gosta samo se loaduje novi novi header.  
    public function index(){
        
    }
    
    public function pretraga(){
        //uzme podatak 
        $trazi=$this->input->get('pretraga');
        // uradi pretragu 
        //poziva metodu prikazi za jela sto je dobio.
         // $this->prikazi("jelo stranica",array rezultata);
    }
    
    
    public function predloziJelo(){
     
        
    }    
    // -- metoda koja ako nije ulogovan trazi loguj se ako jeste napravi mu meni ili ako ga vec ima prikaze. 
    // ako vec ulogovan preusmeri u kontroler korisnik akcija predlozi jelo.
	// CHEVU 
    
    public function izradiPlanIshrane(){
        // proveri dal ima vec plan. 
        // ukoliko ima tj nije jos istekao
        // onda pozove prikaz njegov
        // ukoliko nema generisi jela pa prikazi
        // sa odgovarajucim prikazom i podacima
    }
    
     public function knijga(){
     // proveri dal validan korisnik itd.
     // dohvati njegove knjige i prosledi u prikazi sa odgovar
     //jucom stranicom.
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
    
    
    
    
    private function prikazi($glavniDeo, $data){
       // $this->load->view("sablon/header_korisnik.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }
    
    public function logout(){
        // ubija sesiju
        //preusmeri na gosta.
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     

