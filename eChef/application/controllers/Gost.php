<?php

class Gost extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model("Jelo");
        $this->load->model("Korisnik");
        /*   $this->load->model("");//ucitavaju se php fajlovi gde se nalase ovi modeli i pravi se instanca modela
          $this->load->model("");// kako su nam oba modela trebala u svim kontrolerima
          //mogli smo i u autoload falju da ih dodamo u niz za modele

          //provera da li je korisnik mozda vec ulogovan
          if (($this->session->userdata('')) != NULL) {
          if ($this->session->userdata('')->admin == 1) {
          redirect("Admin");
          } else {
          redirect("Korisnik");
          }
          } */
        //$this->load->view(
    }

    //--pomocna metoda koja sluzi za ucitavanje stranice posto nam se svaka stranica sadrzi iz tri dela
    private function prikazi($glavniDeo, $data) {
        $data['controller'] = 'Gost';
        $this->load->view("sablon/gost_header.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }

    //-- prikazuje index i u onaj slide bar u sredini  dohvata i stavlja 3
    // naj popularnija recepata / najbolje ocenjena za sad recimo.
    // IVANA
    public function index() {
        // dohvati ta 3 iz baze.
        // $this->prikazi("home stranicu ", array('vesti'=>$vesti,'controller'=>"Gost") oblika
        //                   
        //                   
        //                                                                                       ovog samo u podatke imamo 3 recepta);
        $podaci = [];
        $this->prikazi("home.php", $podaci);
        //$image = new Imagick();
    }

    //-- metoda koja se poziva prilikom pretrage  po nazivu itd itd.
    // IVANA
    public function prikazipretraga() {
        $data = [];
        $this->prikazi("search.php", $data);
    }

    public function pretraga() {
        //uzme podatak 
        $search = $this->input->get('searchBox');
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloIme($search);
        $this->prikazi("rezultatipretrage.php", $data);
        // uradi pretragu 
        //poziva metodu prikazi za jela sto je dobio.
        // $this->prikazi("jelo stranica",array rezultata);
    }

    //--metoda koja ucitava formu za  logovanje
    //JANIS
    public function login($poruka = NULL) {
        $podaci = [];
        if ($poruka) {
            $podaci['poruka'] = $poruka;
        }
        $this->prikazi("pages-login.php", $podaci);
    }

    //--metoda koja se poziva klikom na submit forme za logovanje
    // JANIS
    public function ulogujSe() {
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->form_validation->set_rules("username", "Username", "required");
        $this->form_validation->set_rules("password", "Password", "required");
        $this->form_validation->set_message("required", "Unesite polje {field}.");
        if ($this->form_validation->run()) {

            $korisnik = $this->Korisnik->dohvatiKorisnika2($this->input->post('username'));

            if (!$korisnik) {
                $this->login("Neispravno korisnicko ime!");
            } else if (!($this->input->post('password') == $korisnik->password)) {  //this->input->posl()-helper metoda, automatsi vraca null ako ne posotji
                $this->login("Neispravan password!");
            } else {

                $this->session->set_userdata('korisnik', $korisnik); //set_userdata setuje niz u session

                if ($korisnik->oznaka == 'R') {
                    redirect("Registrovani");
                } else if ($korisnik->oznaka == 'K') {
                    redirect("Kuvar");
                } else if ($korisnik->oznaka == 'A')
                    redirect("Admin");
            }
        }
        else {
            $this->login();
        }
    }

    ///--metoda koja ucitava formu za registraciu onu osnovnu /opstu. specialne su u kontroleru za korisnika i kontrolera za chefa.
    //JELENA
    public function register($poruka = NULL) {
        $podaci = [];
        if ($poruka) {
            $podaci['poruka'] = $poruka;
        }
        $this->prikazi("pages-sign-up.php", $podaci);
    }

    //provera dal su se uneli svi podaci na sign up stranici i dal username vec posotji u bazi
    private function proveriReg() {
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');

        $this->form_validation->set_rules("username", "Username", "required");
        $this->form_validation->set_rules("password", "Password", "required");

        $this->form_validation->set_rules("ime", "Ime", "required");
        $this->form_validation->set_rules("prezime", "Prezime", "required");
        $this->form_validation->set_rules("email", "E-mail", "required");
        $this->form_validation->set_rules("password2", "Password", "matches[password]");

        $this->form_validation->set_message("required", "Unesite polje {field}.");
        if ($this->form_validation->run()) {
            $korisnik = $this->Korisnik->dohvatiKorisnika2($this->input->post('username'));
            if ($korisnik) {
                $this->register("Korisnicno ime vec postoji. ");
            }
        } else {
            $this->register();
        }
    }

    //prebacuje sa sign up na client/chef sign up
    public function registerKorisnik() {

        $this->proveriReg();
        $podaci = [];
        $oznaka;

        if (isset($_POST['client']))
            $oznaka = 'R';
        else
            $oznaka = 'K';
       // $this->Korisnik->saveReg($this->input->post('ime'), $this->input->post('prezime'), $this->input->post('email'), $this->input->post('username'), $this->input->post('password'));
        $podaci['ime']=$this->input->post('ime');
        $podaci['prezime']=$this->input->post('prezime');
        $podaci['email']=$this->input->post('email');
        $podaci['username']= $this->input->post('username');
        $podaci['password']=$this->input->post('password');

        if ($oznaka == 'R')
            $this->prikazi("pages-client-sign-up.php", $podaci);
        else   //oznaka=='K'
            $this->prikazi("pages-chef-sign-up.php", $podaci);
    }

    public function registrujSeKorisnik() {
        $data = [];
        if (!isset($_POST['veggie'])) {
            $data['poruka'] = "Morate uneti preferirano voce/povrce";
            $this->prikazi("pages-client-sign-up.php", $data);
        }

        if (!isset($_POST['meat'])) {
            $data['poruka'] = "Morate uneti preferirane vrste mesa";
            $this->prikazi("pages-client-sign-up.php", $data);
        }

        if (!isset($_POST['ukusi'])) {
            $data['poruka'] = "Morate uneti preferirane ukuse dezerta";
            $this->prikazi("pages-client-sign-up.php", $data);
        }

        //ako je sve uneseno ispravno:
        $this->Korisnik->unesiKorisnika($this->input->post('ime') ,$this->input->post('prezime') ,$this->input->post('email'), $this->input->post('username'), $this->input->post('password'));
        $idK = $this->Korisnik->getId($this->input->post('username'))[0]->idK;
      
        
        foreach ($this->input->post('veggie') as $veggie) {
         
            $idS=$this->Jelo->getIdSastojka($veggie)[0]->idS;
            
            $this->Jelo->unesiOmiljeniSastojak($idK, $idS);
        }
        
        

        foreach ($this->input->post('meat') as $meat) {
            $idS = $this->Jelo->getIdSastojka($meat)[0]->idS;
            $this->Jelo->unesiOmiljeniSastojak($idK, $idS);
        }

        foreach ($this->input->post('ukusi') as $ukusi) {
            $idS = $this->Jelo->getIdSastojka($ukusi)[0]->idS;
            $this->Jelo->unesiOmiljeniSastojak($idK, $idS);
        }
        // *****fale alergije dodacu kad napravimo tabelu u bazi*****
        $pol = $_POST['gender'];
        $this->Korisnik->unesiRegistrovanog($idK, $pol);

        //dohvatam sve podatke novonastalog korisnika i stavljam ih u njegovu sesiju  
        $korisnik = $this->Korisnik->dohvatiKorisnika2($this->input->post('username'));
        $this->session->set_userdata('korisnik', $korisnik);
        redirect("Registrovani");
    }

    public function registrujSeKuvar() {

        $stream = fopen($_FILES['cv']['tmp_name'], 'rb');
        $cv = stream_get_contents($stream);
        $this->Korisnik->unesiZahtevKuvara($this->input->post('ime') ,$this->input->post('prezime') ,$this->input->post('email'), $this->input->post('username'), $this->input->post('password') ,$cv);
        $podaci = [];
        $this->prikazi("home.php", $podaci);
    }

    public function prikaziJelo($id) {
        $data = [];
        $data['jelo'] = $this->Jelo->dohvatiJeloId($id);
        $data['sastojci'] = $this->Jelo->dohvatiSastojkeJela($id);
        $data['komentari'] = $this->Jelo->dohvatiKomentareJela($id);
        $data['ocene'] = $this->Jelo->dohvatiOceneJela($id);
        //$data = $this->Jelo->dohvatiPodatkeJelo($id);
        $this->prikazi("recipe_demo.php", $data);
    }

    public function prikaziPrilika($prilika) {
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloPrilika($prilika);
        $this->prikazi("rezultatipretrage.php", $data);
    }

    public function prikaziPoSastojku($sastojak) {
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloSastojak($sastojak);
        $this->prikazi("rezultatipretrage.php", $data);
    }

    public function prikaziKategoriju($kategorija) {
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloKategorija($kategorija);
        $this->prikazi("rezultatipretrage.php", $data);
    }

}
