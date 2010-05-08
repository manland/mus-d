package
{
	import Graphique.MGraphiqueScene;
	import Graphique.Textures.MImage;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.controls.Image;
	import mx.events.CloseEvent;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;

	public class Menu extends MGraphiqueScene
	{
		public var titreImage:Image;
		[Embed(source="Images/titre.png")]
			private var imageClass:Class;

		public var leJeu:Jeux;
		public var lesCommandes:Commandes;
		
		// Boutons
		public var menuBoutonDemarrer:Button;
		public var menuBoutonReprendre:Button;
		public var menuBoutonCommandes:Button;
		public var menuBoutonRegles:Button;
		public var menuBoutonCredits:Button;
				
		public function Menu()
		{
			
			// Scene
			this.x = 0;
			this.y = 0;
			this.width = 614; 
			this.height = 372;
						
			// Titre
			titreImage = new Image();
			titreImage.x = 200;
			titreImage.y = 0;
			titreImage.source=imageClass;
			this.addChild(titreImage);
			
			leJeu = null;

			// Bouton Menu
			menuBoutonDemarrer = new Button();
			menuBoutonDemarrer.id = "boutonMenuDemarrer";
			menuBoutonDemarrer.styleName = "boutonMenuDemarrer";
			menuBoutonDemarrer.label = "";
			menuBoutonDemarrer.x = 170;
			menuBoutonDemarrer.y = 90;
			menuBoutonDemarrer.addEventListener(MouseEvent.CLICK, nouvellePartie);
			addChild(menuBoutonDemarrer);
			
			// Bouton Menu
			menuBoutonReprendre = new Button();
			menuBoutonReprendre.id = "boutonMenuReprendre";
			menuBoutonReprendre.styleName = "boutonMenuReprendre";
			menuBoutonReprendre.label = "";
			menuBoutonReprendre.x = 170;
			menuBoutonReprendre.y = 90;
			menuBoutonReprendre.addEventListener(MouseEvent.CLICK, retour);
			menuBoutonReprendre.setVisible(false);
			addChild(menuBoutonReprendre);
			
			// Bouton Menu
			menuBoutonCommandes = new Button();
			menuBoutonCommandes.id = "boutonMenuCommandes";
			menuBoutonCommandes.styleName = "boutonMenuCommandes";
			menuBoutonCommandes.label = "";
			menuBoutonCommandes.x = 305;
			menuBoutonCommandes.y = 90;
			menuBoutonCommandes.addEventListener(MouseEvent.CLICK, afficheCommandes);
			addChild(menuBoutonCommandes);
			
			// Bouton Menu
			menuBoutonRegles = new Button();
			menuBoutonRegles.id = "boutonMenuRegles";
			menuBoutonRegles.styleName = "boutonMenuRegles";
			menuBoutonRegles.label = "";
			menuBoutonRegles.x = 170;
			menuBoutonRegles.y = 225;
			addChild(menuBoutonRegles);
			
			// Bouton Menu
			menuBoutonCredits = new Button();
			menuBoutonCredits.id = "boutonMenuCredits";
			menuBoutonCredits.styleName = "boutonMenuCredits";
			menuBoutonCredits.label = "";
			menuBoutonCredits.x = 305;
			menuBoutonCredits.y = 225;
			addChild(menuBoutonCredits);
			
			// Commandes
			lesCommandes = new Commandes(this);
			this.addChild(lesCommandes);
		}
		
		public function nouvellePartie(e:MouseEvent):void {
			if(leJeu!=null) {
				this.removeChild(leJeu);
			}
			leJeu = new Jeux(this);
			addChild(leJeu);
			var alertCSS:CSSStyleDeclaration;
			alertCSS = StyleManager.getStyleDeclaration("Alert");
			
			alertCSS.setStyle("modalTransparencyColor", 0xad5b64);
            alertCSS.setStyle("modalTransparency", 0.5);
            alertCSS.setStyle("modalTransparencyBlur", 3);
            alertCSS.setStyle("modalTransparencyDuration", 100);
            
            var a:Alert = new Alert;
			a = Alert.show("Démarrer", "", Alert.OK, leJeu, alertClicOK, null, Alert.OK);
		}
		
		public function alertClicOK(evt_obj:Object):void {
			if (evt_obj.detail == Alert.OK) {
		  		leJeu.balle.mouv.lancer();
		  		leJeu.relancerTimer();
		 	}
		}
		
		public function retour(e:MouseEvent):void {
			leJeu.setVisible(true);
			Alert.show("Reprendre", "", Alert.OK, this, alerteOK);
		}
		
		public function alerteOK(e:CloseEvent):void {
			leJeu.relancerTimer();
			leJeu.balle.mouv.lancer();
		}
		
		public function afficheCommandes(e:MouseEvent):void {
			lesCommandes.setVisible(true);
		}
		
		public function getLeJeu():Jeux { return leJeu; }
		public function getLesCommandes():Commandes { return lesCommandes;	}
		
	}
}