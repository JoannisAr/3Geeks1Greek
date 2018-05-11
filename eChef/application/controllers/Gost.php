<?php

class Gost extends CI_Controller{
    
    public function __construct() {
        parent::__construct();
        $this->load->model("");//ucitavaju se php fajlovi gde se nalase ovi modeli i pravi se instanca modela
        $this->load->model("");// kako su nam oba modela trebala u svim kontrolerima 
        //mogli smo i u autoload falju da ih dodamo u niz za modele
        
        //provera da li je korisnik mozda vec ulogovan
        if (($this->session->userdata('')) != NULL) {
            if ($this->session->userdata('')->admin == 1) {
                redirect("Admin");
            } else {
                redirect("Korisnik");
            }
        }
    }
        
    //--pomocna metoda koja sluzi za ucitavanje stranice posto nam se svaka stranica sadrzi iz tri dela
    private function prikazi($glavniDeo, $data){
        $this->load->view("sablon/header_gost.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }
    
    //-- prikazuje index i u onaj slide bar u sredini  dohvata i stavlja 3
    // naj popularnija recepata / najbolje ocenjena za sad recimo.
    public function index(){
       // dohvati ta 3 iz baze.
       // $this->prikazi("home stranicu ", array('vesti'=>$vesti,'controller'=>"Gost") oblika
       //                                                            ovog samo u podatke imamo 3 recepta);
    }
    
    //-- metoda koja se poziva prilikom pretrage  po nazivu itd itd.
    public function pretraga(){
        //uzme podatak 
        $trazi=$this->input->get('pretraga');
        // uradi pretragu 
        //poziva metodu prikazi za jela sto je dobio.
         // $this->prikazi("jelo stranica",array rezultata);
    }
   
    //--metoda koja ucitava formu za  logovanje
    public function login($poruka=NULL)
    {
        $podaci=[];
        if ($poruka) {
            $podaci['poruka'] = $poruka;
        }
        $this->prikazi('login.php',$podaci);
    }
    
    //--metoda koja se poziva klikom na submit forme za logovanje
    public function ulogujSe(){
       //uradi sve cita iz baze itd itd
       // ako ne uspe poziva metodu login plus setovalo je poruke. koje metoda login radi
    }
    
    ///--metoda koja ucitava formu za registraciu onu osnovnu /opstu. specialne su u kontroleru za korisnika i kontrolera za chefa.
    public function register($poruka = NULL){
    
        
    }
    //-- metoda kja se poziva na sumbit forme za registraciu
    public function registrujSe(){ 
        //uzme podatke iz forme ukoliko su ok  + znaci kliknulo se register as chef ili korisnik i 
        // preusmeri na prikaz forme unosa dodatnik podataka . znaci metode register  chefa -ili korisnika.
        //ako ne valja prikaze register gosta.. sa porukom...
    }
    
    // -- medota koja ako nije ulogovan trazi loguj se. ako jeste da jelo..
    // ako vec ulogovan preusmerava na korisnik kontroler predlozi jelo..
    public function predloziJelo(){
     
        
    }
    
    // -- metoda koja ako nije ulogovan trazi loguj se ako jeste napravi mu meni ili ako ga vec ima prikaze. 
    // ako vec ulogovan preusmeri u kontroler korisnik akcija predlozi jelo.
    public function napraviMeni(){
    }
    
    // -- za review requirements nema metode u gostu to ce se izbaciti iz headera gosta.
    public function prikazNekeKategorije(){
        // uzme podatak preko geta sto se setovo kad je klikno dal 
        // je to beef ili chicken ili lunch ili whatever
        // vrsi pretragu  i ispisuje.. 
        // pozivajuci metodu prikazi sa array podatakama.
    }
    
    // -- metoda za postavljanje recepta.
    public function postavitiRecept(){
        // ako nije logovan prikaz za logovanje 
        // ako je ulogovan kao korisnik prikaz za logovanje uz poruku moras biti kuvar.
        // ako je ulogovan kao kuvar preusmeri u istu metodu kod kuvara.
    }
}
