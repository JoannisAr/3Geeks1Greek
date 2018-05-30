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
    
    public  function dohvatiJeloIme($ime){
        $this->db->like("naziv", $ime);
       
        $this->db->from("recepti");
        $this->db->select("naziv,obrok,kategorija,spec_prilika");
        
        $query=$this->db->get();

        return $query->result();
    }
    
    public  function dohvatiJeloKategorija($kategorija){
       $this->db->select("naziv,obrok,kategorija,spec_prilika");
       $this->db->where('kategorija',$kategorija);            
       $query = $this->db->get('recepti');
       return $query->result();
    }
    public function dohvatiJeloPrilika($prilika){
       $this->db->select("naziv,obrok,kategorija,spec_prilika");
       $this->db->where('spec_prilika',$prilika);            
       $query = $this->db->get('recepti');
       return $query->result();
    }
    public function dohvatiJeloSastoja($sastojak){
        
    }
}
