package
{
	import Graphique.MGraphiqueScene;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.controls.Button;
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.controls.TextInput;

	public class Commandes extends MGraphiqueScene
	{
		
		public var titreCommandesImage:Image;
		[Embed(source="Images/titreCommandes.png")]
			private var imageClass:Class;
		
		public var joueurUnImage:Image;
		[Embed(source="Images/joueur1.png")]
			private var imageClass6:Class;
			
		public var joueurDeuxImage:Image;
		[Embed(source="Images/joueur2.png")]
			private var imageClass7:Class;
			
		public var commandesCentreImage:Image;
		[Embed(source="Images/commandesCentre2.png")]
			private var imageClass5:Class;
			
		public var commandesCadreJ1Image:Image;
		public var commandesCadreJ2Image:Image;
		[Embed(source="Images/commandesCadre.png")]
			private var imageClass4:Class;
			
			
		// Menu
		private var menu:Menu;
			
		// Boutons
		public var menuBoutonGauche:Button;
		public var menuBoutonDroite:Button;
		
		// TextField
		public var textfieldHautJ1:TextInput;
		public var labelHautJ1:Label;
		public var codeHautJ1:uint = 0;
		
		public var textfieldBasJ1:TextInput;
		public var labelBasJ1:Label;
		public var codeBasJ1:uint = 0;
		
		public var textfieldHautJ2:TextInput;
		public var labelHautJ2:Label;
		public var codeHautJ2:uint = 0;
		
		public var textfieldBasJ2:TextInput;
		public var labelBasJ2:Label;
		public var codeBasJ2:uint = 0;
		
		
		public function Commandes(menu:Menu)
		{
			this.menu = menu;
			
			this.setVisible(false);
						
			// Scene
			this.x = 0;
			this.y = 0;
			this.width = menu.width-2; 
			this.height = menu.height-2;
			
			// Titre
			titreCommandesImage = new Image();
			titreCommandesImage.x = 200;
			titreCommandesImage.y = 0;
			titreCommandesImage.source=imageClass;
			this.addChild(titreCommandesImage);
			
			// Joueur 1
			joueurUnImage = new Image();
			joueurUnImage.x = 85;
			joueurUnImage.y = 100;
			joueurUnImage.source=imageClass6;
			this.addChild(joueurUnImage);
			
			// Joueur 2
			joueurDeuxImage = new Image();
			joueurDeuxImage.x = 415;
			joueurDeuxImage.y = 100;
			joueurDeuxImage.source=imageClass7;
			this.addChild(joueurDeuxImage);
			
			// Commandes Centre
			commandesCentreImage = new Image();
			commandesCentreImage.x = 250;
			commandesCentreImage.y = 105;
			commandesCentreImage.source=imageClass5;
			this.addChild(commandesCentreImage);
			
			// Commandes Cadre J1
			commandesCadreJ1Image = new Image();
			commandesCadreJ1Image.x = 30;
			commandesCadreJ1Image.y = 115;
			commandesCadreJ1Image.source=imageClass4;
			this.addChild(commandesCadreJ1Image);
			
			// Commandes Cadre J2
			commandesCadreJ2Image = new Image();
			commandesCadreJ2Image.x = 365;
			commandesCadreJ2Image.y = 115;
			commandesCadreJ2Image.source=imageClass4;
			this.addChild(commandesCadreJ2Image);
			
			// Bouton Menu
			menuBoutonGauche = new Button();
			menuBoutonGauche.id = "boutonMenuGauche";
			menuBoutonGauche.styleName = "boutonMenuGauche";
			menuBoutonGauche.label = "Defaut";
			menuBoutonGauche.setStyle("fontSize", 20);
			menuBoutonGauche.x = 0;
			menuBoutonGauche.y = 321;
			
			menuBoutonGauche.addEventListener(MouseEvent.CLICK, commandesParDefaut);
			this.addChild(menuBoutonGauche);
			
			// Bouton Menu
			menuBoutonDroite = new Button();
			menuBoutonDroite.id = "boutonMenuDroite";
			menuBoutonDroite.styleName = "boutonMenuDroite";
			menuBoutonDroite.label = "Menu";
			menuBoutonDroite.setStyle("fontSize", 20);
			menuBoutonDroite.x = 305;
			menuBoutonDroite.y = 321;
			
			menuBoutonDroite.addEventListener(MouseEvent.CLICK, afficheMenu);
			this.addChild(menuBoutonDroite);
			
			// TextField Haut J1
			textfieldHautJ1 = new TextInput;
			textfieldHautJ1.x = 70;
			textfieldHautJ1.y = 160;
			textfieldHautJ1.width = 130;
			textfieldHautJ1.setStyle("textAlign","center");
			textfieldHautJ1.setStyle("fontSize",17);
			textfieldHautJ1.visible = false;
			textfieldHautJ1.addEventListener(KeyboardEvent.KEY_UP, pressJ1H);
			this.addChild(textfieldHautJ1);
			// Label Haut J1
			labelHautJ1 = new Label;
			labelHautJ1.x = 70;
			labelHautJ1.y = 160;
			labelHautJ1.width = 130;
			labelHautJ1.text = "z";
			labelHautJ1.setStyle("textAlign","center");
			labelHautJ1.setStyle("fontSize",17);
			labelHautJ1.visible = true;
			labelHautJ1.addEventListener(MouseEvent.CLICK, clicLabelJ1H);
			labelHautJ1.addEventListener(KeyboardEvent.KEY_UP, pressJ1H);
			this.addChild(labelHautJ1);
			
			// TextField Bas J1
			textfieldBasJ1 = new TextInput;
			textfieldBasJ1.x = 70;
			textfieldBasJ1.y = 230;
			textfieldBasJ1.width = 130;
			textfieldBasJ1.setStyle("textAlign","center");
			textfieldBasJ1.setStyle("fontSize",17);
			textfieldBasJ1.visible = false;
			textfieldBasJ1.addEventListener(KeyboardEvent.KEY_UP, pressJ1B);
			this.addChild(textfieldBasJ1);
			// Label Bas J1
			labelBasJ1 = new Label;
			labelBasJ1.x = 70;
			labelBasJ1.y = 230;
			labelBasJ1.width = 130;
			labelBasJ1.text = "s";
			labelBasJ1.setStyle("textAlign","center");
			labelBasJ1.setStyle("fontSize",17);
			labelBasJ1.visible = true;
			labelBasJ1.addEventListener(MouseEvent.CLICK, clicLabelJ1B);
			labelBasJ1.addEventListener(KeyboardEvent.KEY_UP, pressJ1B);
			this.addChild(labelBasJ1);
			
			// TextField Haut J2
			textfieldHautJ2 = new TextInput;
			textfieldHautJ2.x = 405;
			textfieldHautJ2.y = 160;
			textfieldHautJ2.width = 130;
			textfieldHautJ2.setStyle("textAlign","center");
			textfieldHautJ2.setStyle("fontSize",17);
			textfieldHautJ2.visible = false;
			textfieldHautJ2.addEventListener(KeyboardEvent.KEY_UP, pressJ2H);
			this.addChild(textfieldHautJ2);
			// Label Haut J2
			labelHautJ2 = new Label;
			labelHautJ2.x = 405;
			labelHautJ2.y = 160;
			labelHautJ2.width = 130;
			labelHautJ2.text = "o";
			labelHautJ2.setStyle("textAlign","center");
			labelHautJ2.setStyle("fontSize",17);
			labelHautJ2.visible = true;
			labelHautJ2.addEventListener(MouseEvent.CLICK, clicLabelJ2H);
			labelHautJ2.addEventListener(KeyboardEvent.KEY_UP, pressJ2H);
			this.addChild(labelHautJ2);
			
			// TextField Bas J2
			textfieldBasJ2 = new TextInput;
			textfieldBasJ2.x = 405;
			textfieldBasJ2.y = 230;
			textfieldBasJ2.width = 130;
			textfieldBasJ2.setStyle("textAlign","center");
			textfieldBasJ2.setStyle("fontSize",17);
			textfieldBasJ2.visible = false;textfieldBasJ2.addEventListener(KeyboardEvent.KEY_UP, pressJ2B);
			this.addChild(textfieldBasJ2);
			// Label Bas J2
			labelBasJ2 = new Label;
			labelBasJ2.x = 405;
			labelBasJ2.y = 230;
			labelBasJ2.width = 130;
			labelBasJ2.text = "l";
			labelBasJ2.setStyle("textAlign","center");
			labelBasJ2.setStyle("fontSize",17);
			labelBasJ2.visible = true;
			labelBasJ2.addEventListener(MouseEvent.CLICK, clicLabelJ2B);
			labelBasJ2.addEventListener(KeyboardEvent.KEY_UP, pressJ2B);
			this.addChild(labelBasJ2);
			
			commandesParDefaut(null);
		}
		
		public function afficheMenu(e:MouseEvent):void {
			this.setVisible(false);
			menu.setVisible(true);
		}
		
		public function commandesParDefaut(e:MouseEvent):void {
			
			codeHautJ1 = 90;
			codeBasJ1 = 83;
			codeHautJ2 = 79;
			codeBasJ2 = 76;
			
			textfieldHautJ1.text = String.fromCharCode(codeHautJ1);
			textfieldHautJ2.text = String.fromCharCode(codeHautJ2);
			textfieldBasJ1.text = String.fromCharCode(codeBasJ1);
			textfieldBasJ2.text = String.fromCharCode(codeBasJ2);
			textfieldHautJ1.visible = false;
			textfieldHautJ2.visible = false;
			textfieldBasJ1.visible = false;
			textfieldBasJ2.visible = false;
			
			labelHautJ1.text = String.fromCharCode(codeHautJ1);
			labelHautJ2.text = String.fromCharCode(codeHautJ2);
			labelBasJ1.text = String.fromCharCode(codeBasJ1);
			labelBasJ2.text = String.fromCharCode(codeBasJ2);
			labelHautJ1.visible = true;
			labelHautJ2.visible = true;
			labelBasJ1.visible = true;
			labelBasJ2.visible = true;
			
		}
		
		/*public function reportKeyDown(event:KeyboardEvent):void
		{
		    if (event.keyCode == Keyboard.SHIFT)
		    { textfieldHautJ1.setStyle("borderColor", 0xFF0000); }
		    
		    textfieldHautJ1.text = String.fromCharCode(event.charCode);
		}*/
		
		public function pressJ1H(event:KeyboardEvent):void
		{
		    /*
		    trace("Key Released: " + String.fromCharCode(event.charCode) + 
		        " (key code: " + event.keyCode + " character code: " + 
		        event.charCode + ")");
		    */
		        
		    if (event.keyCode == Keyboard.SHIFT)
		    { textfieldHautJ1.setStyle("borderColor", 0x000000); }
		    
		    textfieldHautJ1.visible = false;
		    labelHautJ1.text = String.fromCharCode(event.charCode);
		    
		    toucheSpecial(event, labelHautJ1);
		    		    
		    labelHautJ1.visible = true;
		    codeHautJ1 = event.keyCode;		    
		}
		
		public function pressJ1B(event:KeyboardEvent):void
		{		        
		    if (event.keyCode == Keyboard.SHIFT)
		    { textfieldBasJ1.setStyle("borderColor", 0x000000); }
		    
		    textfieldBasJ1.visible = false;
		    labelBasJ1.text = String.fromCharCode(event.charCode);
		    
		    toucheSpecial(event, labelBasJ1);
		    
		    labelBasJ1.visible = true;
		    codeBasJ1 = event.keyCode;		    
		}
		
		public function pressJ2H(event:KeyboardEvent):void
		{		        
		    if (event.keyCode == Keyboard.SHIFT)
		    { textfieldHautJ2.setStyle("borderColor", 0x000000); }
		    
		    textfieldHautJ2.visible = false;
		    labelHautJ2.text = String.fromCharCode(event.charCode);
		    
		    toucheSpecial(event, labelHautJ2);
		    
		    labelHautJ2.visible = true;
		    codeHautJ2 = event.keyCode;		    
		}
		
		public function pressJ2B(event:KeyboardEvent):void
		{		        
		    if (event.keyCode == Keyboard.SHIFT)
		    { textfieldBasJ2.setStyle("borderColor", 0x000000); }
		    
		    textfieldBasJ2.visible = false;
		    labelBasJ2.text = String.fromCharCode(event.charCode);
		    
		    toucheSpecial(event, labelBasJ2);
		    
		    labelBasJ2.visible = true;
		    codeBasJ2 = event.keyCode;		    
		}
		

		public function clicLabelJ1H(event:MouseEvent):void
		{
		    textfieldHautJ1.text = "";
		    textfieldHautJ1.visible = true;
		    textfieldHautJ1.setFocus();
		    labelHautJ1.visible = false;
		    labelHautJ1.setStyle("color", 0xFFFFFF); 
		    labelHautJ1.setStyle("fontWeight", "bold");
		    
		}
		
		public function clicLabelJ2H(event:MouseEvent):void
		{
		    textfieldHautJ2.text = "";
		    textfieldHautJ2.visible = true;
		    textfieldHautJ2.setFocus();
		    labelHautJ2.visible = false;
		    labelHautJ2.setStyle("color", 0xFFFFFF);
		    labelHautJ2.setStyle("fontWeight", "bold");
		}
		
		public function clicLabelJ1B(event:MouseEvent):void
		{
		    textfieldBasJ1.text = "";
		    textfieldBasJ1.visible = true;
		    textfieldBasJ1.setFocus();
		    labelBasJ1.visible = false;
		    labelBasJ1.setStyle("color", 0xFFFFFF);
		    labelBasJ1.setStyle("fontWeight", "bold");
		}
		
		public function clicLabelJ2B(event:MouseEvent):void
		{
		    textfieldBasJ2.text = "";
		    textfieldBasJ2.visible = true;
		    textfieldBasJ2.setFocus();
		    labelBasJ2.visible = false;
		    labelBasJ2.setStyle("color", 0xFFFFFF);
		    labelBasJ2.setStyle("fontWeight", "bold");
		}
		
		public function toucheSpecial(event:KeyboardEvent, label:Label):void {
			if(event.keyCode==Keyboard.F1) { label.text = "F1"; }
			else if(event.keyCode==Keyboard.F2) { label.text = "F2"; }
			else if(event.keyCode==Keyboard.F3) { label.text = "F3"; }
			else if(event.keyCode==Keyboard.F4) { label.text = "F4"; }
			else if(event.keyCode==Keyboard.F5) { label.text = "F5"; }
			else if(event.keyCode==Keyboard.F6) { label.text = "F6"; }
			else if(event.keyCode==Keyboard.F7) { label.text = "F7"; }
			else if(event.keyCode==Keyboard.F8) { label.text = "F8"; }
			else if(event.keyCode==Keyboard.F9) { label.text = "F9"; }
			else if(event.keyCode==Keyboard.F10) { label.text = "F10"; }
			else if(event.keyCode==Keyboard.F11) { label.text = "F11"; }
			else if(event.keyCode==Keyboard.F12) { label.text = "F12"; }
			else if(event.keyCode==Keyboard.F13) { label.text = "F13"; }
			else if(event.keyCode==Keyboard.F14) { label.text = "F14"; }
			else if(event.keyCode==Keyboard.F15) { label.text = "F15"; }
			else if(event.keyCode==Keyboard.BACKSPACE) { label.text = "BACKSPACE"; } 
			else if(event.keyCode==Keyboard.CONTROL) { label.text = "CTRL"; }
			else if(event.keyCode==Keyboard.DELETE) { label.text = "SUPPR"; }
			else if(event.keyCode==Keyboard.DOWN) { label.text = "FLECHE BAS"; } 
			else if(event.keyCode==Keyboard.END) { label.text = "FIN"; }
			else if(event.keyCode==Keyboard.ENTER) { label.text = "ENTRER"; }
			else if(event.keyCode==Keyboard.ESCAPE) { label.text = "ECHAP"; }
			else if(event.keyCode==Keyboard.HOME) { label.text = "HOME"; }
			else if(event.keyCode==Keyboard.INSERT) { label.text = "INSER"; }
			else if(event.keyCode==Keyboard.LEFT) { label.text = "FLECHE GAUCHE"; }
			else if(event.keyCode==Keyboard.RIGHT) { label.text = "FLECHE DROITE"; }
			else if(event.keyCode==Keyboard.SHIFT) { label.text = "SHIFT"; }
			else if(event.keyCode==Keyboard.SPACE) { label.text = "ESPACE"; }
			else if(event.keyCode==Keyboard.TAB) { label.text = "TABULATION"; }
			else if(event.keyCode==Keyboard.UP) { label.text = "FLECHE HAUT"; }
			else if(event.keyCode==Keyboard.numLock) { label.text = "NUM_LOCK"; }
			else if(event.keyCode==Keyboard.CAPS_LOCK) { label.text = "CAPS_LOCK"; }
			else if(event.keyCode==Keyboard.PAGE_DOWN) { label.text = "PAGE_DOWN"; }
			else if(event.keyCode==Keyboard.PAGE_UP) { label.text = "PAGE_UP"; }
			else if(event.keyCode==Keyboard.NUMPAD_0) { label.text = "NUMPAD_0"; }
			else if(event.keyCode==Keyboard.NUMPAD_1) { label.text = "NUMPAD_1"; }
			else if(event.keyCode==Keyboard.NUMPAD_2) { label.text = "NUMPAD_2"; }
			else if(event.keyCode==Keyboard.NUMPAD_3) { label.text = "NUMPAD_3"; }
			else if(event.keyCode==Keyboard.NUMPAD_4) { label.text = "NUMPAD_4"; }
			else if(event.keyCode==Keyboard.NUMPAD_5) { label.text = "NUMPAD_5"; }
			else if(event.keyCode==Keyboard.NUMPAD_6) { label.text = "NUMPAD_6"; }
			else if(event.keyCode==Keyboard.NUMPAD_7) { label.text = "NUMPAD_7"; }
			else if(event.keyCode==Keyboard.NUMPAD_8) { label.text = "NUMPAD_8"; }
			else if(event.keyCode==Keyboard.NUMPAD_9) { label.text = "NUMPAD_9"; }
			else if(event.keyCode==Keyboard.NUMPAD_ADD) { label.text = "NUMPAD_ADD"; }
			else if(event.keyCode==Keyboard.NUMPAD_DECIMAL) { label.text = "NUMPAD_DECIMAL"; }
			else if(event.keyCode==Keyboard.NUMPAD_DIVIDE) { label.text = "NUMPAD_DIVIDE"; }
			else if(event.keyCode==Keyboard.NUMPAD_ENTER) { label.text = "NUMPAD_ENTER"; }
			else if(event.keyCode==Keyboard.NUMPAD_MULTIPLY) { label.text = "NUMPAD_MULTIPLY"; }
			else if(event.keyCode==Keyboard.NUMPAD_SUBTRACT) { label.text = "NUMPAD_SUBTRACT"; }
		}
	}
}