<?php
// ima jos za pretragu da se doda.. i u modelu za jelo isto.
class Gost extends CI_Controller{
	
    public function __construct() {
        parent::__construct();
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
        $this->load->view("sablon/header_gost.php", $data);
        $this->load->view($glavniDeo, $data);
        $this->load->view("sablon/footer.php");
    }
    
    //-- prikazuje index i u onaj slide bar u sredini  dohvata i stavlja 3
    // naj popularnija recepata / najbolje ocenjena za sad recimo.
	
	// IVANA
    public function index(){
       // dohvati ta 3 iz baze.
       // $this->prikazi("home stranicu ", array('vesti'=>$vesti,'controller'=>"Gost") oblika
       //                                    ovog samo u podatke imamo 3 recepta);
         $this->load->view("home.php");
    }
    
    //-- metoda koja se poziva prilikom pretrage  po nazivu itd itd.
	// IVANA
    public function pretraga(){
        //uzme podatak 
        $trazi=$this->input->get('pretraga');
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
        $this->prikazi('login.php',$podaci);
    }
    
    //--metoda koja se poziva klikom na submit forme za logovanje
	// JANIS
    public function ulogujSe(){
       //uradi sve cita iz baze itd itd
       // ako ne uspe poziva metodu login plus setovalo je poruke. koje metoda login radi
    }
    
    ///--metoda koja ucitava formu za registraciu onu osnovnu /opstu. specialne su u kontroleru za korisnika i kontrolera za chefa.
	//JELENA
    public function register($poruka = NULL){
    
        
    }
    //-- metoda kja se poziva na sumbit forme za registraciu
	// JELENA
    public function registrujSe(){ 
        //uzme podatke iz forme ukoliko su ok  + znaci kliknulo se register as chef ili korisnik i 
        // preusmeri na prikaz forme unosa dodatnik podataka . znaci metode register  chefa -ili korisnika.
        //ako ne valja prikaze register gosta.. sa porukom...
    }
    private function registerKorisnik()
    {
        //prikazi stranicu za registraciju Korisnika
        //private zato sto je poziva registruj.
        
    }
    public function registrujSeKorisnik(){
        // sve popunio i kliknuo e sad dal treba evidentirati u bazi ili ne.
        // i preusmeritiga na login.
    }
      private function registerKuvar()
    {
        //prikazi stranicu za registraciju Kuvara
        //private zato sto je poziva registruj.
        
    }
    public function registrujSeKuvar(){
        // sve popunio i kliknuo e sad dal treba evidentirati u bazi ili ne.
        // i preusmeritiga na login.
    }
    
    // -- medota koja ako nije ulogovan trazi loguj se. ako jeste da jelo..
    // ako vec ulogovan preusmerava na korisnik kontroler predlozi jelo..
	//CHEVU 
    public function predloziJelo(){
     
        
    }
    
    // -- metoda koja ako nije ulogovan trazi loguj se ako jeste napravi mu meni ili ako ga vec ima prikaze. 
    // ako vec ulogovan preusmeri u kontroler korisnik akcija predlozi jelo.
	// CHEVU 
    public function napraviMeni(){
    }
    
    // -- za review requirements nema metode u gostu to ce se izbaciti iz headera gosta.
<<<<<<< HEAD:eChef/application/controllers/Gost_controller.php
    public function prikaziKategoriju(){
=======
	// IVANA
    public function prikazNekeKategorije(){
>>>>>>> 4cadef48215f530c42888ff116954c1d0af99814:eChef/application/controllers/Gost.php
        // uzme podatak preko geta sto se setovo kad je klikno dal 
        // je to beef ili chicken ili lunch ili whatever
        // vrsi pretragu  i ispisuje.. 
        // pozivajuci metodu prikazi sa array podatakama.
    }
     public function prikaziPrilika(){
        // uzme podatak preko geta sto se setovo kad je klikno dal 
        // je to dorucak ili rucak ili sta god.
        // vrsi pretragu  i ispisuje.. 
        // pozivajuci metodu prikazi sa array podatakama.
    }
    // -- metoda za postavljanje recepta.
	// CHEVU
    public function postavitiRecept(){
        // ako nije logovan prikaz za logovanje 
        // ako je ulogovan kao korisnik prikaz za logovanje uz poruku moras biti kuvar.
        // ako je ulogovan kao kuvar preusmeri u istu metodu kod kuvara.
    }
}
