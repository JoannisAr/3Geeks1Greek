<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Zahtev extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function dohvatiZahteve() {

        $this->db->select("idZ,username,password,ime,prezime,mail,cv");

        $query = $this->db->get('zahtev');

        return $query->result();
    }

    public function dohvatiZahtev($id){
        $this->db->where('idZ',$id);
        $query= $this->db->get('zahtev');
        return $query->result();
    }
    
    public function odobriZahtev($id) {

        //uzimanje podataka iz zahteva
        $this->db->where('idZ', $id);
        $query1 = $this->db->get('zahtev');
        $r1 =$query1->result();
        
        //ubacivanje u korisnik
        $this->db->set("username",$r1[0]->username);
        $this->db->set("password",$r1[0]->password);
        $this->db->set("ime",$r1[0]->ime);
        $this->db->set("prezime",$r1[0]->prezime);
        $this->db->set("mail",$r1[0]->mail);
        $this->db->set("oznaka",'K');
        $this->db->insert('korisnik');
        
        //uzimanje id-a iz korisnik, i ubacivanje u kuvar
        $this->db->where('username',$r1[0]->username);
        $query2 = $this->db->get('korisnik');
        $r2=$query2->result();
        $this->db->set("idK",$r2[0]->idK);
        $this->db->set("cv",$r1[0]->cv);
        $this->db->insert('kuvar');
        
        //brisanje iz zahtev
        $this->db->where('idZ', $id);
        $this->db->delete('zahtev');
    }

    public function odbijZahtev($id) {
        //brisanje iz zahtev
        $this->db->where('idZ', $id);
        $this->db->delete('zahtev');
    }

}
