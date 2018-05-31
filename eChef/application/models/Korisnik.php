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
class Korisnik {
   /* private $ime;
    private $prezime;
    private $korisnicko_ime;
    private $lozinka;
    private tip/vrsta

    */ // nekaki ovakvi podaci..
    public static function dohvatiKorisnika($korisnicko_ime){
        $result=$this->db->where('username',$korisnicko_ime)->get('korisnik');
        $korisnik=$result->row();
       return $korisnik;
    }
}
