<?php

class Gost extends CI_Controller{
	
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
        }*/
         //$this->load->view(
    }
        
    //--pomocna metoda koja sluzi za ucitavanje stranice posto nam se svaka stranica sadrzi iz tri dela
    private function prikazi($glavniDeo, $data){
        $data['controller']='Gost';
        $this->load->view("sablon/gost_header.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }
    
    //-- prikazuje index i u onaj slide bar u sredini  dohvata i stavlja 3
    // naj popularnija recepata / najbolje ocenjena za sad recimo.
	
	// IVANA
    public function index(){
       // dohvati ta 3 iz baze.
       // $this->prikazi("home stranicu ", array('vesti'=>$vesti,'controller'=>"Gost") oblika
       //                   
       //                   
       //                                                                                       ovog samo u podatke imamo 3 recepta);
       $podaci=[];
       $this->prikazi("home.php",$podaci);
       //$image = new Imagick();
    }
    
    //-- metoda koja se poziva prilikom pretrage  po nazivu itd itd.
	// IVANA
    public function prikazipretraga(){
        $data=[];
        $this->prikazi("search.php",$data);
    }
    
    public function pretraga(){
        //uzme podatak 
        $search = $this->input->get('searchBox');
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloIme($search);
        $this->prikazi("rezultatipretrage.php",$data);
        // uradi pretragu 
        //poziva metodu prikazi za jela sto je dobio.
         // $this->prikazi("jelo stranica",array rezultata);
    }
   
    //--metoda koja ucitava formu za  logovanje
	//JANIS
    public function login($poruka=NULL)
    {
        $podaci=[];
        if ($poruka) {
            $podaci['poruka'] = $poruka;
        }
        $this->prikazi("pages-login.php",$podaci);
        
    }
    
    //--metoda koja se poziva klikom na submit forme za logovanje
	// JANIS
   public function ulogujSe(){
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
	$this->form_validation->set_rules("username", "Username", "required");
        $this->form_validation->set_rules("password", "Password", "required");
        $this->form_validation->set_message("required","Unesite polje {field}.");
        if ($this->form_validation->run()) {
            $data=[];
            $data=$this->Korisnik->dohvatiKorisnika($this->input->post('username'));
            $korisnik=$data[0];
            if (!$korisnik) {
                $this->login("Neispravno korisnicko ime!");
            } 
			else if (!($this->input->post('password')==$korisnik->password)) {		//this->input->posl()-helper metoda, automatsi vraca null ako ne posotji
                $this->login("Neispravan password!");
            } 
				else {
					
					$this->session->set_userdata('korisnik',$korisnik);	//set_userdata setuje niz u session
					
					if($korisnik->oznaka == 'R'){
						redirect("Registrovani");
					}
					else if($korisnik->oznaka == 'K')
                                        {
                                            redirect("Kuvar");
					}
					else if($korisnik->oznaka == 'A')
                                            redirect("Admin");
					
				}
        } 
		else {
            $this->login();
        }
    }
    
    ///--metoda koja ucitava formu za registraciu onu osnovnu /opstu. specialne su u kontroleru za korisnika i kontrolera za chefa.
	//JELENA
    public function register($poruka = NULL){
     $podaci=[];
        if ($poruka) {
            $podaci['poruka'] = $poruka;
        }
        $this->prikazi("pages-sign-up.php",$podaci);
        
    }
	
	 private function proveriReg(){
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        
	$this->form_validation->set_rules("username", "Username", "required");
        $this->form_validation->set_rules("password", "Password", "required");
        $this->form_validation->set_rules("ime", "Ime", "required");
        $this->form_validation->set_rules("prezime", "Prezime", "required");
        $this->form_validation->set_rules("email", "E-mail", "required");
        $this->form_validation->set_rules("password2", "Password", "required");
        $this->form_validation->set_rules("password2", "Password", "matches['password']");
        
        $this->form_validation->set_message("required","Unesite polje {field}.");
        if ($this->form_validation->run()) {
            $korisnik=$this->Korisnik->dohvatiKorisnika($this->input->post('username'));
            if($korisnik){
                $this->register("Korisnicno ime vec postoji. ");
            }
        }
     
    }
	
     private function registerKorisnik()
    {
             proveriReg();
        $podaci=[];
        $this->prikazi("pages-client-sign-up.php",$podaci);
        
    }
    public function registrujSeKorisnik(){
        // sve popunio i kliknuo e sad dal treba evidentirati u bazi ili ne.
        // i preusmeritiga na login.
    }
      private function registerKuvar()
    {
         proveriReg();
        $podaci=[];
        $this->prikazi("pages-chef-sign-up.php",$podaci);
        
    }
    public function registrujSeKuvar(){
        // sve popunio i kliknuo e sad dal treba evidentirati u bazi ili ne.
        // i preusmeritiga na login.
    }
    
    public function prikaziJelo($id){
     $data=[];
     $data['jelo']=$this->Jelo->dohvatiJeloId($id);
     $data['sastojci']= $this->Jelo->dohvatiSastojkeJela($id);
     $data['komentari']= $this->Jelo->dohvatiKomentareJela($id);
     $data['ocene']= $this->Jelo->dohvatiOceneJela($id);
       //$data = $this->Jelo->dohvatiPodatkeJelo($id);
       $this->prikazi("recipe_demo.php",$data);
    }
    public function prikaziPrilika($prilika){
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloPrilika($prilika);
        $this->prikazi("rezultatipretrage.php",$data);
    }
    
    public function prikaziPoSastojku($sastojak){
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloSastojak($sastojak);
        $this->prikazi("rezultatipretrage.php",$data);
    }
    
     public function prikaziKategoriju($kategorija){
        $data = [];
        $data['jela'] = $this->Jelo->dohvatiJeloKategorija($kategorija);
        $this->prikazi("rezultatipretrage.php",$data);
    }   
}
