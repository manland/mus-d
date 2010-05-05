package
{
	import Controleur.MMouvementPerpetuel;
	
	import Graphique.MGraphiqueRectangle;
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.MIObjetGraphiqueEcouteur;
	
	import Utilitaires.MArete;
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.controls.Image;
	import mx.controls.Label;
	
	public class Jeux extends MGraphiqueScene
	{
		
		public var filletImage:Image;
		[Embed(source="Images/fillet.png")]
			private var imageClass:Class;//on embarque l'image dans une classe
			
		public var tempsImage:Image;
		[Embed(source="Images/temps.png")]
			private var imageClass2:Class;
			
		public var barreImage:Image;
		[Embed(source="Images/barre.png")]
			private var imageClass3:Class;
			
		public var scoreGaucheImage:Image;
		[Embed(source="Images/scoreGauche.png")]
			private var imageClass4:Class;
			
		public var scoreDroiteImage:Image;
		[Embed(source="Images/scoreDroite.png")]
			private var imageClass5:Class;
			
		public var joueurUnImage:Image;
		[Embed(source="Images/joueur1.png")]
			private var imageClass6:Class;
			
		public var joueurDeuxImage:Image;
		[Embed(source="Images/joueur2.png")]
			private var imageClass7:Class;
			
		// Menu
		private var leMenu:Menu;
			
		// Boutons
		public var menuBoutonGauche:Button;
		public var menuBoutonDroite:Button;

		// Temps    
        private var labelTemps:Label;
        private var delai:uint; // toutes les secondes
        private var tempsRestant:uint;
        private var leTimer:Timer;
        
        // Score
        public var scoreJ1:uint;
		public var scoreJ2:uint;
        public var labelScoreJ1:Label;
		public var labelScoreJ2:Label;
		
		private var raquetteJ1:Raquette;
		private var raquetteJ2:Raquette;
		private var balle:Balle;
		
		public function Jeux(menu:Menu)
		{
			this.leMenu = menu;
			
			// Scene
			this.x = 0;
			this.y = 0;
			this.width = menu.width-2; 
			this.height = menu.height-2;

			//Fillet
			filletImage = new Image();
			filletImage.x = 288;
			filletImage.y = 2;
			filletImage.height = 260;
			filletImage.source=imageClass;
			this.addChild(filletImage);

			// Barre
			barreImage = new Image();
			barreImage.x = 1;
			barreImage.y = 255;
			barreImage.source=imageClass3;
			this.addChild(barreImage);
			
			// Temps
			tempsImage = new Image();
			tempsImage.x = 254;
			tempsImage.y = 260;
			tempsImage.source=imageClass2;
			this.addChild(tempsImage);
			   
			// Score Gauche
			scoreGaucheImage = new Image();
			scoreGaucheImage.x = 135;
			scoreGaucheImage.y = 255;
			scoreGaucheImage.source=imageClass4;
			this.addChild(scoreGaucheImage);
			
			// Score Droite
			scoreDroiteImage = new Image();
			scoreDroiteImage.x = 351;
			scoreDroiteImage.y = 255;
			scoreDroiteImage.source=imageClass5;
			this.addChild(scoreDroiteImage);
			
			// Joueur 1
			joueurUnImage = new Image();
			joueurUnImage.y = 274;
			joueurUnImage.source=imageClass6;
			this.addChild(joueurUnImage);
			
			// Joueur 2
			joueurDeuxImage = new Image();
			joueurDeuxImage.x = 492;
			joueurDeuxImage.y = 274;
			joueurDeuxImage.source=imageClass7;
			this.addChild(joueurDeuxImage);

			// Bouton Menu
			menuBoutonGauche = new Button();
			menuBoutonGauche.id = "boutonMenuGauche";
			menuBoutonGauche.styleName = "boutonMenuGauche";
			menuBoutonGauche.label = "Menu";
			menuBoutonGauche.setStyle("fontSize", 20);
			menuBoutonGauche.x = 0;
			menuBoutonGauche.y = 321;
			
			menuBoutonGauche.addEventListener(MouseEvent.CLICK, afficheMenu);
			this.addChild(menuBoutonGauche);
			
			// Bouton Menu
			menuBoutonDroite = new Button();
			menuBoutonDroite.id = "boutonMenuDroite";
			menuBoutonDroite.styleName = "boutonMenuDroite";
			menuBoutonDroite.label = "Recommencer";
			menuBoutonDroite.setStyle("fontSize", 20);
			//menuBoutonDroite.setStyle("fontColor", 0xFF0000);
			menuBoutonDroite.x = 305;
			menuBoutonDroite.y = 321;
			
			menuBoutonDroite.addEventListener(MouseEvent.CLICK, recommencer);
			this.addChild(menuBoutonDroite);
			
			// Temps
			delai = 1000;
        	tempsRestant = 120;
        	leTimer = new Timer(delai, tempsRestant);
        	labelTemps = new Label();
            labelTemps.x = 272;
            labelTemps.y = 290;
            labelTemps.setStyle("fontSize", 20);

            labelTemps.text = "0"+((delai * tempsRestant) / 1000)/60+":00";

            leTimer.addEventListener(TimerEvent.TIMER, timerHandler);
            leTimer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
            addChild(labelTemps);
            
            //Score
            labelScoreJ1 = new Label();
            labelScoreJ1.x = 180;
            labelScoreJ1.y = 290;
            scoreJ1 = 0;
            labelScoreJ1.text = ""+scoreJ1;
            labelScoreJ1.setStyle("fontSize", 20);;
            addChild(labelScoreJ1);
            
            labelScoreJ2 = new Label();
			labelScoreJ2.x = 410;
            labelScoreJ2.y = 290;
            scoreJ2 = 0;
            labelScoreJ2.text = ""+scoreJ2;
            labelScoreJ2.setStyle("fontSize", 20);
            addChild(labelScoreJ2);
            
            raquetteJ1 = new Raquette(this, "J1", 2, 0, 20, 50);
            addChild(raquetteJ1);
            
            raquetteJ2 = new Raquette(this, "J2", this.width-20-2, 0, 20, 50);
            addChild(raquetteJ2);
           
           
           	balle = new Balle(this);
           	addChild(balle);
		}
		
		public function afficheMenu(e:MouseEvent):void {
			this.setVisible(false);
			this.leTimer.stop();
			balle.mouv.stopper();
			leMenu.menuBoutonDemarrer.setVisible(false);
			leMenu.menuBoutonReprendre.setVisible(true);
			leMenu.setVisible(true);
		}
		
		public function recommencer(e:MouseEvent):void {
			//leMenu.nouvellePartie(e);
			//completeHandler(null);
			balle.mouv.lancer();
		}

       	private function timerHandler(e:TimerEvent):void{
            tempsRestant--;
           	var tps:uint = ((delai * tempsRestant) / 1000);
           	if(tps>=60) {	labelTemps.text = "01:"+(tps-60);	}
           	else {	labelTemps.text = "00:"+tps;	}
        }

        private function completeHandler(e:TimerEvent):void {
            labelTemps.text = "Fini";
            
            var gagnant:String = "";
            var message:String = "";
            var scoreGagnant:int = 0;
            var scorePerdant:int = 0;
            
            if(scoreJ1<scoreJ2) {
            	gagnant = "Joueur 2";
            	scorePerdant = scoreJ1;
            	scoreGagnant = scoreJ2;
            	message = "BRAVO "+gagnant+" !\nVous avez gagné :\n\n"+scoreGagnant+" à "+scorePerdant+".";
            }
            else if(scoreJ1>scoreJ2) {
            	gagnant = "Joueur 1"; 
            	scoreGagnant = scoreJ1;
            	scorePerdant = scoreJ2;
            	message = "BRAVO "+gagnant+" !\nVous avez gagné :\n\n"+scoreGagnant+" à "+scorePerdant+".";
            }
            else {
            	scoreGagnant = scoreJ1;
            	scorePerdant = scoreJ2;
            	message = "Impossible de vous départager...\nVous avez le meme niveau !\n\nScore Final: "+scoreGagnant+" - "+scorePerdant+"";
            }
            Alert.show(message, "Fin de Partie...", Alert.OK, null, finPartieClic, null, Alert.OK);
        }
        
        // Action boutons Alert Fin de Partie
		public function finPartieClic(evt_obj:Object):void {
		 	if (evt_obj.detail == Alert.OK) {
		  		afficheMenu(null);
		 	}
		}
		
        public function relancerTimer():void {
           	leTimer.start(); 
        }
        
		public function getLeMenu():Menu { return leMenu; }
        
     
	}
}