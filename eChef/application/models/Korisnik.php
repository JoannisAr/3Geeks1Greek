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
class Korisnik extends CI_Model {

    public $ime;
    public $prezime;
    public $email;
    public $username;
    public $password;

    // private $oznaka;


    public function __construct() {
        parent::__construct();
    }
    public function dohvatiKorisnika2($username) {

        $result = $this->db->where('username', $username)->get('korisnik');
        $korisnik = $result->row();
        return $korisnik;
    }

    //poziva se da se unesu osnovni podaci korisnika
    public function unesiKorisnika($ime, $prezime, $email, $username, $password) {
        $data = array(
            'ime' => $ime ,
            'prezime' => $prezime ,
            'mail' => $email ,
            'oznaka' => 'R' ,
            'username' => $username ,
            'password' => $password ,
        );

        $this->db->insert('korisnik', $data);
    }

    public function getId($username) {

        $this->db->select("idK");
        $this->db->from("korisnik");
        $this->db->where("username", $username);
        $query = $this->db->get();
        ob_flush();
        ob_start();
        var_dump($query->result());
        file_put_contents('dump.txt', ob_get_flush());
        return $query->result();
    }

    //unosi sacuvane osnovne podatke o kuvaru u zahtev ukoliko je ceo sign-up prosao regularno
    public function unesiZahtevKuvara($ime, $prezime, $email, $username, $password ,$cv) {
        $data = array(
            'ime' => $ime,
            'prezime' => $prezime,
            'mail' => $email,
            'username' => $username,
            'password' => $password,
            'cv' => $cv
        );

        $this->db->insert('zahtev', $data);
    }

    public function unesiRegistrovanog($idK, $pol) {

        $data = array(
            'idK' => $idK,
            'pol' => $pol
        );

        $this->db->insert('registrovani', $data);
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
        $query = $this->db->from("knjiga")->where("idKorisnika",$id_korisnika)->get();
       $knjiga = $query->row();
       if($knjiga){
       $this->db->delete('veza_recepti_knjiga', array('idK' => $knjiga->idK,'idR' => $id_jela)); 
       }
       return;
    }
    public function knjiga($id_korisnika){
        $query = $this->db->from("knjiga")->where("idKorisnika",$id_korisnika)->get();
        $knjiga = $query->row();
        if($knjiga){
            $this->db->select("r.idR,r.naziv,r.obrok,r.kategorija,r.spec_prilika,r.slika");
            $this->db->from("veza_recepti_knjiga k,recepti r");
            $this->db->where("k.idK",$knjiga->idK);
            $this->db->where("k.idR = r.idR");
            $query=$this->db->get();    
            return $query->result();   
        }
        return NULL;
    }
}
