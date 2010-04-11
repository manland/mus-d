package
{
	import Graphique.MGraphiqueScene;
	
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Button;
	import mx.controls.Image;
	import mx.controls.Label;
	
	//[style="monStyle.css"]
	
	public class FenetrePrincipale extends MGraphiqueScene
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
			
		public var menuBoutonGauche:Button;
		public var menuBoutonDroite:Button;

		// Temps
		private var labelTemps:Label;
        private var duree:uint;
        private var repeat:uint;
        private var leTemps:Timer;
		
		public function FenetrePrincipale()
		{
			// Scene
			this.x = 0;
			this.y = 0;
			this.width = 612; 
			this.height = 370;
			//trace(" -> "+this.x);
			
			//this.texture = new MCouleur();

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
			menuBoutonDroite.x = 305;
			menuBoutonDroite.y = 321;
			this.addChild(menuBoutonDroite);
			
			// Temps
			var testString:String = new String(" le temps ");
			labelTemps = new Label();
			labelTemps.text = new String(" le temps ");
			addChild(labelTemps);
			//labelTemps.x = 10;
			//labelTemps.y = 10;
			//labelTemps.width = 100;
			//labelTemps.width = stage.stageWidth;
			//labelTemps.text = testString; 
			
			//labelTemps.au = TextFieldAutoSize.CENTER;
			
			//labelTemps.x = 20;
			//labelTemps.y = 20;
			//textFieldTemps.type = TextFieldType.DYNAMIC;
			//labelTemps.width = 200;
			//labelTemps.background = true;
			//labelTemps.autoSize = TextFieldAutoSize.LEFT;   
			
			/*duree = 200000; // 2 minutes
	        repeat = 3;
	        leTemps = new Timer(duree, repeat);
	        
			leTemps.start();
			
            leTemps.addEventListener(TimerEvent.TIMER, timerHandler);
            leTemps.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
			*/
            
		}
		
		public function afficheMenu():void {
			
		}

       /* public function timerHandler(event:TimerEvent):void {
            repeat--;
            //labelTemps.text = ((duree * repeat) / 1000) + " secondes.";
        }

        private function completeHandler(e:TimerEvent):void {
//            labelTemps.text = "Times Up.";   
        }*/
        
	}
}