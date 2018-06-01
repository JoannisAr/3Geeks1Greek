<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Jelo
 *
 * @author Korisnik
 */
class Jelo extends CI_Model{
    //dohvati jelo sa tim imenom
    
    public function __construct() {
        parent::__construct();
    }
    
    public function dohvatiJeloId($id){
        $this->db->select("idR,naziv,sadrzaj");
        $this->db->from("recepti");
        $this->db->where("idR",$id);
        $query=$this->db->get();
        return $query->result();
    }
    public  function dohvatiJeloIme($ime){
        $this->db->like("naziv", $ime);
       
        $this->db->from("recepti");
        $this->db->select("idR,naziv,obrok,kategorija,spec_prilika");
        $query=$this->db->get();
        return $query->result();
    }
    
    public  function dohvatiJeloKategorija($kategorija){
       $this->db->select("idR,naziv,obrok,kategorija,spec_prilika");
       $this->db->where('kategorija',$kategorija);            
       $query = $this->db->get('recepti');
       return $query->result();
    }
    public function dohvatiJeloPrilika($prilika){
       $this->db->select("idR,naziv,obrok,kategorija,spec_prilika");
       $this->db->where('spec_prilika',$prilika);            
       $query = $this->db->get('recepti');
       return $query->result();
    }
    
    public function dohvatiJeloSastojak($sastojak){    
     
    } 
    
    public function dohvatiPodatkeJelo($id){
     $data=[];
     $data['jelo']= $this->dohvatiJeloId($id);
     $data['sastojci']= $this->dohvatiSastojkeJela($id);
     $data['komentari']= $this->dohvatiKomentareJela($id);
     $data['ocene']= $this->dohvatiOceneJela($id);
     return $data;
    }
    public function dohvatiSastojkeJela($id){
        $this->db->select("s.naziv,vsr.kolicina");
        $this->db->from("veza_sastojci_recepti vsr,sastojci s");
        $this->db->where("vsr.idR",$id);
        $this->db->where("vsr.idS = s.idS");
        $query = $this->db->get();
        return $query->result();
    }
    public function dohvatiKomentareJela($id){
        $this->db->select("kom.idK,kom.sadrzaj,kom.vreme,k.username");
        $this->db->from("komentar kom,korisnik k");
        $this->db->where("kom.idR",$id);
        $this->db->where("kom.idKorisnika = k.idK");
        $query = $this->db->get();
        return $query->result();
    }
    public function dohvatiOceneJela($id){
        $this->db->select("o.ocena, COUNT(*) as broj");
        $this->db->from("ocenjuje o");
        $this->db->where("o.idR",$id);
        $this->db->group_by("ocena");
        $query = $this->db->get();
        return $query->result();
    }
    
    public function dodajOcenu($idK,$ocena,$idR)
    {
       $date=new DateTime();
        $data = array(
            'idK' => $idK,
            'idR' => $idR ,
            'ocena' => $ocena           
        );
        $this->db->insert('ocenjuje', $data); 
    }
}
