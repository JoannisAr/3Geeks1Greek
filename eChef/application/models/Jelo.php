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
class Jelo extends CI_Model {

    //dohvati jelo sa tim imenom

    public function __construct() {
        parent::__construct();
    }
//dohvatanje jela po parametru $id
    public function dohvatiJeloId($id) {
        $this->db->select("idR,naziv,sadrzaj,obrok,kategorija,spec_prilika,slika");
        $this->db->from("recepti");
        $this->db->where("idR", $id);
        $query = $this->db->get();
        return $query->result();
    }

    public function dohvatiJeloIme($ime) {
        $this->db->like("naziv", $ime);

        $this->db->from("recepti");
        $this->db->select("idR,naziv,obrok,kategorija,spec_prilika");
        $query = $this->db->get();
        return $query->result();
    }

    public function dohvatiJeloKategorija($obrok) {
        $this->db->select("idR,naziv,obrok,kategorija,spec_prilika");
        $this->db->where('obrok', $obrok);
        $query = $this->db->get('recepti');
        return $query->result();
    }

    public function dohvatiJeloPrilika($prilika) {
        $this->db->select("idR,naziv,obrok,kategorija,spec_prilika");
        $this->db->where('spec_prilika', $prilika);
        $query = $this->db->get('recepti');
        return $query->result();
    }

    public function dohvatiJeloSastojak($sastojak) {
        $this->db->select("idR,naziv,obrok,kategorija,spec_prilika");
        $this->db->where('kategorija', $sastojak);
        $query = $this->db->get('recepti');
        return $query->result();
    }

    public function dohvatiPodatkeJelo($id) {
        $data = [];
        $data['jelo'] = $this->dohvatiJeloId($id);
        $data['sastojci'] = $this->dohvatiSastojkeJela($id);
        $data['komentari'] = $this->dohvatiKomentareJela($id);
        $data['ocene'] = $this->dohvatiOceneJela($id);
        return $data;
    }

    public function dohvatiSastojkeJela($id) {
        $this->db->select("s.naziv,vsr.kolicina");
        $this->db->from("veza_sastojci_recepti vsr,sastojci s");
        $this->db->where("vsr.idR", $id);
        $this->db->where("vsr.idS = s.idS");
        $query = $this->db->get();
        return $query->result();
    }

    public function dohvatiKomentareJela($id) {
        $this->db->select("kom.idK,kom.sadrzaj,kom.vreme,k.username");
        $this->db->from("komentar kom,korisnik k");
        $this->db->where("kom.idR", $id);
        $this->db->where("kom.idKorisnika = k.idK");
        $query = $this->db->get();
        return $query->result();
    }

    public function dohvatiOceneJela($id) {
        $this->db->select("o.ocena, COUNT(*) as broj");
        $this->db->from("ocenjuje o");
        $this->db->where("o.idR", $id);
        $this->db->group_by("ocena");
        $query = $this->db->get();

        return $query->result();
    }

    public function getIdSastojka($naziv) {
        $this->db->select("idS");
        $this->db->from("sastojci");
        $this->db->where("naziv", $naziv);
        $query = $this->db->get();
        /* ob_flush();
          ob_start();
          var_dump($query->result());
          file_put_contents('dump.txt', ob_get_flush()); */
        return $query->result();
    }

    public function unesiOmiljeniSastojak($idK, $idS) {

        $data = array(
            'idK' => $idK,
            'idS' => $idS
        );

        $this->db->insert('omiljeni', $data);
    }

    //poziva se iz funkcije predlozi jelo
    public function getOmiljenaJela($idK) {

        $this->db->select("sr.idR");
        $this->db->from("veza_sastojci_recepti sr, omiljeni o");
        $this->db->where("o.idK", $idK);
        $this->db->where("o.idS = sr.idS");
        
        $tmp = $this->db->get();
        $query1 = $tmp->result();

        //  $this->db->query('SELECT sr.idR FROM veza_sastojci_recepti UNION SELECT column_name(s) FROM table_name2');

        /* ob_flush();
          ob_start();
          var_dump(count($query1));
          file_put_contents('dump.txt', ob_get_flush()); */

        $val = 3;

        $this->db->select("o.idR");
        $this->db->from("ocenjuje o");
        $this->db->where("o.idK", $idK);
        $this->db->where("o.ocena >", $val);
        $tmp = $this->db->get();
        $query2 = $tmp->result();

        /* ob_flush();
          ob_start();
          var_dump(count($query2));
          file_put_contents('dump.txt', ob_get_flush()); */

        $query = array_merge($query2, $query1);
        return $query;
    }

    //koristi ga funkcija getOmiljenoJelo
    //vraca bilo koje jelo tog tipa obroka
    public function getJeloPoObroku($obrok) {

        $this->db->select("idR");
        $this->db->from("recepti");
        $this->db->where("obrok", $obrok);
        $tmp = $this->db->get();
        $jela = $tmp->result();

        $size = count($jela);
        $ind = mt_rand(0, $size - 1);

        return $jela[$ind]->idR;
    }
    //poziva se iz funkcije izradaPlana Menija
    public function getOmiljenoJelo($idK, $obrok) {

        //gleda da li ima jelo koje spada u omiljene i da je taj tip obroka, ako nema vraca bilo koje jelo tog tipa obroka
        $this->db->select("sr.idR");
        $this->db->from("veza_sastojci_recepti sr, omiljeni o, recepti r");
        $this->db->where("o.idK", $idK);
        $this->db->where("o.idS = sr.idS");
        $this->db->where("sr.idR = r.idR");
        $this->db->where("r.obrok", $obrok);
        $tmp = $this->db->get();
        $jela = $tmp->result();

        $size = count($jela);
        if ($size > 0) {
            $ind = mt_rand(0, $size - 1);
            return $jela[$ind]->idR;
        } else {
            $id=$this->getJeloPoObroku($obrok);
            return $id;
        }
    }

    public function dodajOcenu($idK, $ocena, $idR) {
        $this->db->select('*');
        $this->db->from('ocenjuje');
        $this->db->where('idK', $idK);
        $this->db->where('idR', $idR);
        $q = $this->db->get();
        $result = $q->result();


        if ($result == NULL) {
            $data = array
                (
                'idK' => $idK,
                'idR' => $idR,
                'ocena' => $ocena,
                'datum' => date('Y-m-d H:i:s')
            );

            $this->db->insert('ocenjuje', $data);
        } else {
            $data = array(
                'ocena' => $ocena,
                'datum' => date('Y-m-d H:i:s')
            );

            $this->db->where('idK', $idK);
            $this->db->where('idR', $idR);
            $this->db->update('ocenjuje', $data);
        }
    }

    public function dodajKomentar($data) {

        $podaci = array
            (
            'idKorisnika' => $data['idKorisnika'],
            'sadrzaj' => $data['sadrzaj'],
            'idR' => $data['idR'],
            'vreme' => date('Y-m-d H:i:s')
        );

        $this->db->insert('komentar', $podaci);
    }

    public function ukloniKomentar($idK) {
        $this->db->delete('komentar', array('idK' => $idK));
    }

  public function postaviJelo($naziv,$img,$sadrzaj,$obrok,$kategorija,$spec,$sastojci)
    {
   
        $data = array
            (
                'naziv' => $naziv,
                'slika' => $img ,
                'sadrzaj' => $sadrzaj,
                'obrok'=> $obrok[0],
                'kategorija'=>$kategorija[0],
                'spec_prilika'=>$spec[0]
            );
            
            $this->db->insert('recepti', $data); 
            
            $idR=$this->db->insert_id();
            
            foreach($sastojci as $sastojak)
            {
                $this->db->select("idS");
                $this->db->where("naziv",$sastojak);
                $this->db->from('sastojci');
                $query=$this->db->get();
                $idS=$query->result()[0]->idS;
                $row=array
                (
                    'idR'=>$idR,
                    'idS'=>$idS
                );
                $this->db->insert('veza_sastojci_recepti',$row);
            }
            
            
    }  
    
     public function unesiAlergiju($idK, $idS) {

        $data = array(
            'idK' => $idK,
            'idS' => $idS
        );

        $this->db->insert('alergije', $data);
    }
    
    public function getAlergije($idK){
        $this->db->select("idS");
        $this->db->from("alergije");
        $this->db->where("idK", $idK);
        $query = $this->db->get();
        if ($query->num_rows() > 0) 
            return $query->result();
        else
            return false;
    }
    //proverava da li je korisnik alergican na taj recept
    //false-jeste; true=nije;
    public function proveriRecept($idR,$idK){
        $this->db->select("a.idS");
        $this->db->from("alergije a, veza_sastojci_recepti vsr");
        $this->db->where("a.idK", $idK);
        $this->db->where("a.idS = vsr.idS");
        $this->db->where("vsr.idR", $idR);
        $query = $this->db->get();
        if ($query->num_rows() > 0) 
            return false;
        else
            return true;
    }

}
