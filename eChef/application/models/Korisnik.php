<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Korisnik
 *
 * @author Korisnik
 */
class Korisnik extends CI_Model{
   /* private $ime;
    private $prezime;
    private $korisnicko_ime;
    private $lozinka;
    private tip/vrsta
 */ // nekaki ovakvi podaci..

    public function __construct() {
        parent::__construct();
    }
    
    
    
    
   
    public function dohvatiKorisnika($korisnicko_ime){
        $this->db->select("idK,username,password,ime,prezime,mail,oznaka");
        $this->db->from("korisnik");
        $this->db->where("username",$korisnicko_ime);
        $query=$this->db->get();
        
        return $query->result();
    }
}
