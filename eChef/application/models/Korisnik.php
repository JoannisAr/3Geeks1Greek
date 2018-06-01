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
    
    public function dodajUKnjigu($id_korisnika,$id_jela){
        $query = $this->db->from("knjiga")->where("idKorisnika",$id_korisnika)->get();
        $knjiga = $query->row();
        if(!$knjiga){        
             $data = array('idKorisnika' => $id_korisnika);
             $this->db->insert('knjiga', $data); 
             
            $query = $this->db->from("knjiga")->where("idKorisnika",$id_korisnika)->get();
            $knjiga = $query->row();
        }
        $query = $this->db->from("veza_recepti_knjiga")->where("idK",$knjiga->idK)->where("idR",$id_jela)->get();
        $ima = $query->row();
        if(!$ima){
            $data = array('idK' =>$knjiga->idK ,'idR' => $id_jela);
            $this->db->insert('veza_recepti_knjiga', $data); 
        }
        return;
    }
    public function ukloniIzKnjige($id_korisnika,$id_jela){
       // $this->db->delete('veza_recepti_knjiga', array('idK' => $$id_korisnika,'idR' => $id)); 
       //return;
    }
}
