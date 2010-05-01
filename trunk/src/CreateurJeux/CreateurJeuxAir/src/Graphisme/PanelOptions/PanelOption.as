package Graphisme.PanelOptions
{
	import Coeur.MIObjet;
	import Coeur.MIObjetEcouteur;
	
	import Erreurs.Erreur;
	
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.Textures.Degrades.MDegrade;
	import Graphique.Textures.MBordure;
	import Graphique.Textures.MCouleur;
	import Graphique.Textures.MITexture;
	import Graphique.Textures.MImage;
	
	import Graphisme.Onglets.Onglet;
	import Graphisme.Onglets.OperationSurObjet;
	import Graphisme.Onglets.TabOnglet;
	import Graphisme.PanelDegrades.FenetreDegrade;
	
	import Modele.Objets.Objet;
	
	import Utilitaires.MAxe;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.controls.CheckBox;
	import mx.controls.ColorPicker;
	import mx.controls.HRule;
	import mx.controls.Label;
	import mx.controls.NumericStepper;
	import mx.controls.RadioButton;
	import mx.controls.RadioButtonGroup;
	import mx.controls.TextInput;
	import mx.events.ColorPickerEvent;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;

	public class PanelOption extends Panel implements MIObjetEcouteur
	{
		// separateur :
		private var separateur:HRule;
		
		// id de l'objet :
		private var hBox_id:HBox;
		private var id_objet:TextInput;
		private var label_id:Label;		
		
		// position :
		private var hBox_position:HBox;
		private var label_x:Label;
		private var label_y:Label;
		private var valeur_x:TextInput;
		private var valeur_y:TextInput;
		
		// taille : 
		private var vBox_taille:VBox;
		private var hBox_largeur:HBox;
		private var hBox_hauteur:HBox;
		private var label_largeur:Label;
		private var label_hauteur:Label;
		private var valeur_largeur:TextInput;
		private var valeur_hauteur:TextInput;
		private var maintenir_ratio:CheckBox;
		private var hBox_taille:HBox;
		
		// Texture:
		private var groupe_bouton_texture:RadioButtonGroup;
		private var label_Texture:Label;
		// couleur :
		private var hBox_couleur:HBox;
		private var btn_couleur:RadioButton;
		// color picker : 
		private var color_picker:ColorPicker;
		
		// bordure : 
		private var hBox_bordure:HBox;
		private var btn_bordure:Button;
		// color picker : 
		private var color_picker_bordure:ColorPicker;
		private var epaisseur_bordure:NumericStepper;
		private var enlever_bordure:Button;
		
		// degrade :
		private var btn_degrade:RadioButton;
		private var rendu_degrade:MGraphiqueScene;
		private var fenetre_degrade:FenetreDegrade;
		
		// image :
		private var vBox_image:VBox;
		private var url_image:Label;
		private var btn_image:RadioButton;
		private var adresse_image:TextInput;
		
		// bouton permettant de valider la texture : 
		private var btn_valider_texture:Button;
		
		// pour le jeu : 
				// nom du jeu :
		private var hBox_nom_jeu:HBox;
		private var label_nom_jeu:Label;
		private var valeur_nom_jeu:TextInput;
		
		// nom de l'auteur :
		private var hBox_nom_auteur:HBox;
		private var label_nom_auteur:Label;
		private var valeur_nom_auteur:TextInput;
		
		// type du jeu : 
		private var label_type_jeu:Label;
		private var groupe_bouton_type_jeu:RadioButtonGroup;
		// flex :
		private var btn_flex:RadioButton;
		// air :
		private var btn_air:RadioButton;
		// valider les changements sur le jeu :
		private var btn_valider_jeu;
		

		private var erreur:Erreur;

		private var modele_global:Objet;
		
		// objet sur lequel on fait des actions :
		private var objet:MIObjetGraphique;
		private var operation:OperationSurObjet;
		
		private var tab_onglet:TabOnglet;
		
		public function PanelOption(erreur:Erreur)
		{
			super();
			this.erreur=erreur;
			tab_onglet = null;
			this.height=400;
			this.width=190;
			this.title="Options :";
			objet=null;
			operation=null;
			modele_global=null;
			initialisationGenerale();
			initialisationJeu();
		}
		
		public function initialisationGenerale():void
		{
			// id : 
			hBox_id = new HBox();
			id_objet = new TextInput();
			label_id = new Label();
			label_id.text = "id : ";
			id_objet.addEventListener(Event.CHANGE,changerIdObjet);
			hBox_id.addChild(label_id);
			hBox_id.addChild(id_objet);
			
			
			// position :
			hBox_position=new HBox();
			label_x= new Label();
			label_y=new Label();
			valeur_x=new TextInput();
			valeur_y=new TextInput();	
			valeur_x.height=20;
			valeur_x.width=40;
			valeur_x.addEventListener(Event.CHANGE,changerPositionX);
			valeur_y.height=20;
			valeur_y.width=40;
			valeur_y.addEventListener(Event.CHANGE,changerPositionY);	
			label_x.text="x :";
			label_y.text="y :";
			valeur_x.id="xPos";
			valeur_x.id="yPos";			
			hBox_position.addChild(label_x);
			hBox_position.addChild(valeur_x);
			hBox_position.addChild(label_y);
			hBox_position.addChild(valeur_y);
			
			// taille :
			vBox_taille = new VBox();
			hBox_hauteur=new HBox(); 
			hBox_largeur=new HBox();
			hBox_taille=new HBox();
			label_largeur= new Label();
			label_hauteur= new Label();
			valeur_largeur=new TextInput();
			valeur_largeur.addEventListener(FlexEvent.ENTER,redimensionner);
			valeur_hauteur=new TextInput();
			valeur_hauteur.addEventListener(FlexEvent.ENTER,redimensionner);
			maintenir_ratio=new CheckBox();
			maintenir_ratio.label="ratio";
			valeur_hauteur.height=20;
			valeur_hauteur.width=40;
			valeur_largeur.height=20;
			valeur_largeur.width=40;
			label_largeur.text="Largeur";
			label_hauteur.text="Hauteur";
			hBox_largeur.addChild(label_largeur);
			hBox_largeur.addChild(valeur_largeur);
			hBox_hauteur.addChild(label_hauteur);
			hBox_hauteur.addChild(valeur_hauteur);
			vBox_taille.addChild(hBox_largeur);
			vBox_taille.addChild(hBox_hauteur);
			hBox_taille.addChild(vBox_taille);
			hBox_taille.addChild(maintenir_ratio);			
			
			separateur = new HRule();
			separateur.percentWidth=80;
			separateur.styleName="separateur";
		
						
			// Texture:
			label_Texture=new Label();
			label_Texture.text = "TEXTURE :";
			groupe_bouton_texture = new RadioButtonGroup();
			
			// couleur :
			hBox_couleur=new HBox();
			hBox_couleur.width = 95;
			hBox_couleur.height=30;
			btn_couleur= new RadioButton();
			btn_couleur.group=groupe_bouton_texture;
			btn_couleur.label = "Couleur";
			btn_couleur.addEventListener(MouseEvent.CLICK,clicSurCouleur);
			// mise en place du color picker :
			color_picker= new ColorPicker();
			color_picker.editable = true;
			color_picker.addEventListener(MouseEvent.CLICK, afficherColorPicker);
			color_picker.addEventListener(ColorPickerEvent.CHANGE,changerCouleur);
	//		color_picker.move(10, 10);
			color_picker.enabled=false;
			hBox_couleur.addChild(btn_couleur);
			hBox_couleur.addChild(color_picker);
			
			// degrade :
			var hbox_degrade:HBox;
			hbox_degrade = new HBox();
			hbox_degrade.width = 95;
			hbox_degrade.height=30;
			btn_degrade= new RadioButton();
			btn_degrade.label="Degradé";
			btn_degrade.group = groupe_bouton_texture;
			rendu_degrade = new MGraphiqueScene();
			rendu_degrade.largeur = 20;
			rendu_degrade.hauteur=20;
			rendu_degrade.setTexture(new MDegrade());
			rendu_degrade.enabled = false;
			hbox_degrade.addChild(btn_degrade);
			hbox_degrade.addChild(rendu_degrade);
			rendu_degrade.addEventListener(MouseEvent.CLICK,clicSurDegrade);
			btn_degrade.addEventListener(MouseEvent.CLICK,clicSurDegrade);
			fenetre_degrade = new FenetreDegrade(this,erreur);
			
			// image :
			vBox_image=new VBox();
			btn_image=new RadioButton();
			btn_image.group = groupe_bouton_texture;
			url_image = new Label();
			url_image.text = "Url :";
			adresse_image= new TextInput();
			adresse_image.addEventListener(FlexEvent.ENTER,changerImage);
			btn_image.addEventListener(MouseEvent.CLICK,clicSurImage);
			adresse_image.height=20;
			adresse_image.width=80;
			adresse_image.text="Adresse de l'image";
			btn_image.label="Image";
			url_image.enabled=false;
			adresse_image.enabled=false;
			btn_image.selected = false;
			vBox_image.addChild(btn_image);
	
			
			btn_valider_texture = new Button();
			btn_valider_texture.label = "Ok";
			btn_valider_texture.addEventListener(MouseEvent.CLICK,validerTexture);
			btn_valider_texture.enabled=false;
			var hBox_adresseImage:HBox;
			hBox_adresseImage = new HBox();
			hBox_adresseImage.x=20;
			hBox_adresseImage.addChild(url_image);
			hBox_adresseImage.addChild(adresse_image);
			hBox_adresseImage.addChild(btn_valider_texture);
			vBox_image.addChild(hBox_adresseImage);
			
			this.addChild(hBox_id);
			this.addChild(hBox_position);
			this.addChild(hBox_taille);
			this.addChild(separateur);	
			this.addChild(label_Texture);
			this.addChild(hBox_couleur);
			this.addChild(hbox_degrade);
			this.addChild(vBox_image);
			
			var separateur2:HRule = new HRule();
			separateur2.percentWidth=80;
			separateur2.styleName="separateur";
			
			this.addChild(separateur2);

			// bordure : 
			hBox_bordure = new HBox();
			color_picker_bordure = new ColorPicker();
			color_picker_bordure.editable = true;
			color_picker_bordure.addEventListener(MouseEvent.CLICK, afficherColorPicker);
			epaisseur_bordure = new NumericStepper();
			epaisseur_bordure.minimum = 0.1;
			epaisseur_bordure.maximum = 5;
			epaisseur_bordure.stepSize = 0.1;
			btn_bordure = new Button();
			btn_bordure.label = "Ok";
			btn_bordure.addEventListener(MouseEvent.CLICK,validerBordure);
			hBox_bordure.addChild(color_picker_bordure);
			hBox_bordure.addChild(epaisseur_bordure);
			hBox_bordure.addChild(btn_bordure);	
			
			var bordure:Label = new Label();
			bordure.text = "Bordure :"; 
			enlever_bordure = new Button();
			enlever_bordure.label="Enlever";
			enlever_bordure.addEventListener(MouseEvent.CLICK,enleverBordure);
			var hb:HBox = new HBox();
			hb.addChild(bordure);
			hb.addChild(enlever_bordure);
			this.addChild(hb);
			this.addChild(hBox_bordure);
			
			
			var separateur3:HRule = new HRule();
			separateur3.percentWidth=80;
			separateur3.styleName="separateur";

			this.addChild(separateur3);
			

		}
		
		public function initialisationJeu():void
		{
			// nom du jeu :
			hBox_nom_jeu=new HBox();
			label_nom_jeu= new Label();
			valeur_nom_jeu=new TextInput();
			valeur_nom_jeu.text="";	
			label_nom_jeu.text="Nom du jeu";
			valeur_nom_jeu.height=20;
			valeur_nom_jeu.width=80;
			hBox_nom_jeu.addChild(label_nom_jeu);
			hBox_nom_jeu.addChild(valeur_nom_jeu);
			
		
			// nom de l'auteur :
			hBox_nom_auteur=new HBox();
			label_nom_auteur= new Label();
			valeur_nom_auteur=new TextInput();	
			valeur_nom_auteur.text="";
			label_nom_auteur.text="Nom de l'auteur";
			valeur_nom_auteur.height=20;
			valeur_nom_auteur.width=70;
			hBox_nom_auteur.addChild(label_nom_auteur);
			hBox_nom_auteur.addChild(valeur_nom_auteur);

			// type du jeu : 
			label_type_jeu=new Label();
			groupe_bouton_type_jeu= new RadioButtonGroup();
			btn_flex= new RadioButton();
			btn_air=new RadioButton();
			label_type_jeu.text="Type de jeu :"
			btn_flex.label = "Flex (web)";
			btn_flex.group=groupe_bouton_type_jeu;
			btn_air.label="Air (bureau)";
			btn_air.group=groupe_bouton_type_jeu;
			
			// bouton valider jeu :
			btn_valider_jeu = new Button();
			btn_valider_jeu.label= "Valider changement";
			btn_valider_jeu.toolTip= "appliquer tous les changements concernant le nom du jeu, son type et l'auteur.";
			btn_valider_jeu.addEventListener(MouseEvent.CLICK,validerOptionJeu);

			this.addChild(hBox_nom_jeu);
			this.addChild(hBox_nom_auteur);
			this.addChild(label_type_jeu);
			this.addChild(btn_flex);
			this.addChild(btn_air);
			this.addChild(btn_valider_jeu);
		}
		
// ------------------------------------------------------------------------------------------------
// 							ACCESSEURS :
// ------------------------------------------------------------------------------------------------		
		// accesseurs pour le general :
		public function getIdObjet():String { return id_objet.text; }
		public function getValeurX():String { return valeur_x.text;	}		
		public function getValeurY():String { return valeur_y.text;	}
		public function getValeurLargeur():String { return valeur_largeur.text;	}
		public function getValeurHauteur():String { return valeur_hauteur.text;	}
		public function getAdresseImage():String { return adresse_image.text; }
			
		public function setIdObjet(s:String):void {id_objet.text=s; }
		public function setValeurX(s:String):void 
		{ 
			if(s==null)
			{
				valeur_x.text="0";
			} 
			else if(valeur_x.text != s)
			{
				valeur_x.text=s;
			} 
			
		}
		public function setValeurY(s:String):void 
		{
			if(s==null)
			{
				valeur_y.text="0";
			} 
			else if(valeur_y.text != s)
			{
				valeur_y.text=s;
			} 
			
		}
		public function setValeurLargeur(s:String):void { valeur_largeur.text=s; }
		public function setValeurHauteur(s:String):void { valeur_hauteur.text=s; }
		public function setAdresseImage(s:String):void { adresse_image.text=s;}
		
		// accesseur pour le jeu :
		public function getNomJeu():String { return valeur_nom_jeu.text; }		
		public function getNomAuteur():String { return valeur_nom_auteur.text; }		
		
		public function setTypeFlex(b:Boolean):void {btn_flex.selected=b;}
		public function setTypeAir(b:Boolean):void {btn_air.selected=b;}
			
		public function setNomJeu(s:String):void { valeur_nom_jeu.text=s; }		
		public function setNomAuteur(s:String):void { valeur_nom_auteur.text=s; }
		
		// accesseurs à l'objet :
		public function getObjet():MIObjetGraphique{ return objet; }
		
		// accesseurs aux tab_onglet : 
		public function setTabOnglet(tab_onglet:TabOnglet):void {
			 this.tab_onglet = tab_onglet; 
			 tab_onglet.addEventListener(Event.CHANGE,miseAJour);
		}
		public function getTabOnglet():TabOnglet { return tab_onglet; }
		
		// accesseur au panel de rendu degradé : 
		public function getPanelRenduDegrade():MGraphiqueScene {return rendu_degrade;}

// -----------------------------------------------------------------------------
// 	  initialisation du panel des options en fonction de l'objet en parametre
// -----------------------------------------------------------------------------
		public function setObjet(objet:MIObjetGraphique):void 
		{ 
			if(objet!=null)
			{
				objet.getObjet().supprimeObjetEcouteur(this);
			}
			this.objet = objet;
			objet.getObjet().ajoutObjetEcouteur(this);
			setIdObjet(objet.getGraphique().id);
			setValeurX(objet.getObjet().getX().toString());
			setValeurY(objet.getObjet().getY().toString());
			setValeurHauteur(objet.getObjet().getHauteur().toString());
			setValeurLargeur(objet.getObjet().getLargeur().toString());
			
			// bordure : 
			
			calculDesTextures(objet.getTexture());
				
			
			
		}
		
		public function calculDesTextures(texture:MITexture):void
		{
			var exp_reg:RegExp = new RegExp(/MDegrade/);
			// on s'occupe de la texture : 
			if(texture.getNomClasse()=="MImage")
			{
				btn_image.selected=true;
				adresse_image.text=((MImage)(texture)).getUrlImage();
				url_image.enabled=true;
				adresse_image.enabled=true;
				btn_image.selected = true;
				btn_valider_texture.enabled=true;

			}
			else
			{
				adresse_image.text="Adresse de l'image";
				url_image.enabled=false;
				adresse_image.enabled=false;
				btn_image.selected = false;
				btn_valider_texture.enabled=false;
			}
			if(texture.getNomClasse()=="MCouleur")
			{
				btn_couleur.selected=true;
				color_picker.enabled = true;
				var couleur_obj:MCouleur = texture as MCouleur;
				
				color_picker.selectedColor = couleur_obj.getCouleur(); 
			}
			else
			{
				btn_couleur.selected=false;
				color_picker.enabled = false;
			}
			if(exp_reg.test(texture.getNomClasse()))		// ca du degradé :
			{
				btn_degrade.selected=true;
				rendu_degrade.setTexture(objet.getTexture().clone());
				rendu_degrade.redessiner();
			}
			else
			{
				btn_degrade.selected=false;
				rendu_degrade.enabled=false;
			}
			
			// a decommenter dans le cas ou on prend en compte que plusieurs texture puissent etre ajoutée
//			if(texture.getADecorer()!=null)
//			{
//				calculDesTextures(texture.getADecorer());
//			}
		}
		
		
		public function setOperation(operation:OperationSurObjet):void
		{
			this.operation=operation;
		}
		
		public function getColorPicker():ColorPicker { return color_picker; }
		
// ------------------------------------------------------------------------------		
//		mise a jour du panel des jeux en fonction de l'onglet qui change 
// ------------------------------------------------------------------------------
		public function miseAJour(event:Event):void
		{
			this.setNomJeu(tab_onglet.getOnglet().getNomJeu());
			this.setNomAuteur(tab_onglet.getOnglet().getNomAuteur());
			if(tab_onglet.getOnglet().getTypeJeu() == "Flex")
			{
				this.setTypeFlex(true);
			}
			else if(tab_onglet.getOnglet().getTypeJeu()=="Air")
			{
				this.setTypeAir(true);
			}
		}
			
		
// ------------------------------------------------------------------------------		
//				changement de l'id
// ------------------------------------------------------------------------------

		public function changerIdObjet(event:Event):void
		{
			objet.getGraphique().id= getIdObjet();
		}
		
// 	-----------------------------------------------------------------------------
// 							Changement de position :
//	-----------------------------------------------------------------------------
		public function changerPositionX(event:Event):void
		{
			var temp:Number = Number(getValeurX());
			if(!isNaN(temp))
			{
				objet.getObjet().setX(Number(getValeurX()));
			}
			else
			{
				objet.getObjet().setX(0);
			}
			operation.apresDeplacement();
		}
		
		public function changerPositionY(event:Event):void
		{
			var temp:Number = Number(getValeurY());
			if(!isNaN(temp))
			{
				objet.getObjet().setY(Number(getValeurY()));
			}
			else
			{
				objet.getObjet().setY(0);
			}
			operation.apresDeplacement();
		}
		
// ---------------------------------------------------------------------
//				Redimensionnement :
// ---------------------------------------------------------------------		
		
		public function redimensionner(event:Event):void
        {
        	var exp_reg:RegExp = new RegExp(/^0/);	// expression reguliere interdisant des string de type 0001
          	if(maintenir_ratio.selected)
          	{
          		var largeur_init:Number = objet.getObjet().getLargeur();
          		var hauteur_init:Number = objet.getObjet().getHauteur();
          		
          		var text_input:TextInput = event.target as TextInput;
	      		if(text_input==valeur_hauteur)	// on modifie la hauteur
	      		{
	      			var ratio:Number = calculerRatioPourLargeur(hauteur_init,largeur_init,Number(getValeurHauteur()));
					if(getValeurHauteur()=="" || isNaN(Number(getValeurHauteur())) || exp_reg.test(getValeurHauteur()))
					{
						objet.getObjet().setHauteur(1);
	      				objet.getObjet().setLargeur(ratio);
					}
					else
					{
						objet.getObjet().setHauteur((Number(getValeurHauteur())));
	      				objet.getObjet().setLargeur(ratio);
					}      			
	      			setValeurLargeur(ratio.toString());  // permet de mettre la meme valeur dans le largeur dans le cas ou ratio maintenu
	      		}
	      		else if(text_input==valeur_largeur)		// on modifie la largeur
	      		{
	      			var ratio:Number = calculerRatioPourHauteur(hauteur_init,largeur_init,Number(getValeurLargeur()));
	      			if(getValeurLargeur()=="" || isNaN(Number(getValeurLargeur())) || exp_reg.test(getValeurLargeur()))
					{
						objet.getObjet().setHauteur(ratio);
	      				objet.getObjet().setLargeur(1);
					}
					else
					{
						objet.getObjet().setHauteur(ratio);
	      				objet.getObjet().setLargeur(Number(getValeurLargeur()));
					}
	      			setValeurHauteur(ratio.toString());
	      		}
          	}
          	else	// le ratio n'est pas maintenu
          	{
          		var text_input:TextInput = event.target as TextInput;
	      		if(text_input==valeur_hauteur)
	      		{
	      			if(getValeurHauteur()=="" || isNaN(Number(getValeurHauteur())) || exp_reg.test(getValeurHauteur()))
					{
						objet.getObjet().setHauteur(1);
	      				objet.getObjet().setLargeur(Number(getValeurLargeur()));
					}
					else
					{
						objet.getObjet().setHauteur(Number(getValeurHauteur()));
	      				objet.getObjet().setLargeur(Number(getValeurLargeur()));
					}
	      		}
	      		else if(text_input==valeur_largeur)
	      		{
	      			if(getValeurLargeur()=="" || isNaN(Number(getValeurLargeur())) || exp_reg.test(getValeurLargeur()))
					{
						objet.getObjet().setHauteur(Number(getValeurHauteur()));
	      				objet.getObjet().setLargeur(1);
					}
					else
					{
						objet.getObjet().setHauteur(Number(getValeurHauteur()));
	      				objet.getObjet().setLargeur(Number(getValeurLargeur()));
					}
	      		}
          	}
          	operation.afficherCadre();          	
        }
        
        // fonction calculant le ratio si on modifie la largeur : 
        public function calculerRatioPourHauteur(hauteur_init:Number, largeur_init:Number, nouvelle_largeur:Number):Number
        {
        		if(largeur_init<1 || isNaN(largeur_init))
        		{
        			largeur_init=1;
        		}
        		if(isNaN(nouvelle_largeur))
        		{
        			nouvelle_largeur =1;
        		}
        		return (nouvelle_largeur * hauteur_init)/largeur_init;
        }
        
        // fonction calculant le ratio si on modifie la hauteur : 
        public function calculerRatioPourLargeur(hauteur_init:Number, largeur_init:Number, nouvelle_hauteur:Number):Number
        {
        		if(hauteur_init<1 || isNaN(hauteur_init)) 
        		{
        			hauteur_init=1;
        		}
        		if(isNaN(nouvelle_hauteur))
        		{
        			nouvelle_hauteur=1;
        		}
        		return (nouvelle_hauteur * largeur_init)/hauteur_init;
        }

// ----------------------------------------------------------------------------
// 			Chargement des images : 
// ----------------------------------------------------------------------------
        
        // fonction permettant de tester si l'url de l'image est juste
        public function chargerImage():void
        {
        	var url_image:URLRequest = new URLRequest(adresse_image.text);
			var loader:Loader = new Loader();
			loader.load(url_image);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, finaliserChangementImage); // si l'url est correcte
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, erreurChargementImage); // si l'url est fausse
        }
	
		// fonction déclanchée par la touche entrée, permet de changer l'image
		public function changerImage(event:FlexEvent):void
		{
				chargerImage();	
		}
		
		// fonction appelée à l'appui sur le bouton valider :
		public function validerTexture(event:MouseEvent):void
		{
			chargerImage();
		}
		
		// si l'url de l'image est correcte :
		public function finaliserChangementImage(event:Event):void
		{
			var temp_img:MImage = new MImage(adresse_image.text);
			objet.setTexture(temp_img);
			//objet.ajouterTexture(temp_img);
		}
		
		
		// si l'url de l'image n'est pas correcte :
		public function erreurChargementImage(event:Event):void
		{
			Alert.show("Le chemin de l'image est faux","Erreur !");
		}

	
// -----------------------------------------------------------------
//			Implémentation de MIObjetEcouteur
// -----------------------------------------------------------------
		public function changementTaille(objet:MIObjet):void { }
		
		public function deplacementObjet(obj:MIObjet):void
		{
			setValeurX(obj.getX().toString());
			setValeurY(obj.getY().toString());
		}
		
		public function objetMeurt(objet:MIObjet):void { }
	
		public function objetNait(obj:MIObjet):void { }
		
		public function objetCollision(objet:MIObjet, axe:MAxe):void {}
		
		
// ----------------------------------------------------------------
// 				evenement du color picker 
// -----------------------------------------------------------------
		
		// affichage du colorpicker :
		public function afficherColorPicker(event:MouseEvent):void
		{
			 event.currentTarget.open();
		}
		
		public function changerCouleur(event:ColorPickerEvent):void
		{
			((MIObjetGraphique)(objet)).setTexture(new MCouleur(color_picker.selectedColor));
		}
		
// ----------------------------------------------------------------
// 			evenement des clics sur check box texture :
// -----------------------------------------------------------------
		public function clicSurCouleur(event:MouseEvent):void
		{
			color_picker.enabled=true;
		}
		
		public function clicSurImage(event:MouseEvent):void
		{
			url_image.enabled=true;
			adresse_image.enabled=true;
			btn_valider_texture.enabled=true;
		}
		
		public function clicSurDegrade(event:MouseEvent):void
		{
			rendu_degrade.enabled = true;
			
			if(objet.getTexture().getNomClasse()=="MDegrade")
			{
				fenetre_degrade.mettreAJour(objet);
				fenetre_degrade.getRendu().redessiner();
			}
			
			PopUpManager.removePopUp(fenetre_degrade);
			fenetre_degrade.setObjet(objet);
			PopUpManager.addPopUp(fenetre_degrade, tab_onglet.parent, false);
            PopUpManager.centerPopUp(fenetre_degrade);
            
		}
		
// ----------------------------------------------------------------
// 						Bordure : 
// -----------------------------------------------------------------		
		public function validerBordure(event:MouseEvent):void
		{
			var epaisseur:Number = epaisseur_bordure.value;
			var couleur:uint = color_picker_bordure.selectedColor;
			objet.setBordure(new MBordure(epaisseur,couleur));
		}
		
		public function enleverBordure(event:MouseEvent):void
		{
			if(objet.getBordure()!=null)
			{
				objet.setBordure(null);
			}
		}
		
// ----------------------------------------------------------------
// 			Valider option du jeu :
// -----------------------------------------------------------------
		public function validerOptionJeu(event:MouseEvent):void
		{
			
			var ong:Onglet = tab_onglet.getOnglet();
			ong.setNomJeu(this.getNomJeu());
			ong.setNomAuteur(this.getNomAuteur());
			ong.setTitreOnglet(this.getNomJeu());
			if(btn_air.selected)
			{
				ong.setTypeJeu("Air");
			}
			else if(btn_flex.selected)
			{
				ong.setTypeJeu("Flex");
			}
			
			
		}
		
	
	}
}