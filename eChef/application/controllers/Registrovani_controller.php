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
    private function prikazi($glavniDeo, $data){
       // $this->load->view("sablon/header_korisnik.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }
    
    public function logout(){
        // ubija sesiju
        //preusmeri na gosta.
    }
    public function knijga(){
     // proveri dal validan korisnik itd.
     // dohvati njegove knjige i prosledi u prikazi sa odgovar
     //jucom stranicom.
    }
    
    public function izradiPlanIshrane(){
        // proveri dal ima vec plan. 
        // ukoliko ima tj nije jos istekao
        // onda pozove prikaz njegov
        // ukoliko nema generisi jela pa prikazi
        // sa odgovarajucim prikazom i podacima
    }
    
    public function predloziJelo(){
        //generisi jelo neko,
        // pozovi prikaz
    }
     
}
