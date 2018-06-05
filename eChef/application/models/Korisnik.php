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

    /* public function dohvatiKorisnika($korisnicko_ime){
      $this->db->select("idK,username,password,ime,prezime,mail,oznaka");
      $this->db->from("korisnik");
      $this->db->where("username",$korisnicko_ime);
      $query=$this->db->get();

      return $query->result();
      } */

    public function dohvatiKorisnika2($username) {

        $result = $this->db->where('username', $username)->get('korisnik');
        $korisnik = $result->row();
        return $korisnik;
    }

    //cuva osnovne podatke sa 1. prozora registracije zajednickog za kuvara i reigstrovanog kor. u objektu modela
    //jer se gube iz posta nakon submita sa 2. stranice registracije koja sadrzi specificne podatke za svaku kategoriju korisnika
    //a osnovni podaci se ne smeju odmah po prikupljanju upisati u bazu jer korisnik moze odustati od registracije
    /*public function saveReg($ime, $prezime, $email, $username, $password) {
        $this->$ime = $ime;
        $this->$prezime = $prezime;
        $this->$email = $email;
        $this->$username = $username;
        $this->$password = $password;
    }*/

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
//***********
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

   

}
