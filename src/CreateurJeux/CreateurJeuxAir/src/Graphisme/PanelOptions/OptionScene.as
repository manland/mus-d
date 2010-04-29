package Graphique.PanelOptions
{
	import Graphisme.Onglets.TabOnglet;
	
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.HRule;
	import mx.controls.Label;
	import mx.controls.RadioButton;
	import mx.controls.RadioButtonGroup;
	import mx.controls.TextInput;

	public class OptionScene extends Panel
	{
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
		
		// Texture:
		private var label_Texture:Label;
		private var groupe_bouton:RadioButtonGroup;
		// couleur :
		private var hBox_couleur:HBox;
		private var btn_couleur:RadioButton;
		private var panel_couleur:Panel;
		// degrade :
		private var btn_degrade:RadioButton;
		// image :
		private var hBox_image:HBox;
		private var btn_image:RadioButton;
		private var adresse_image:TextInput;
		
		private var tab_onglet:TabOnglet;
		private var separateur:HRule;
		
		public function OptionScene()
		{
			super();
			this.layout="vertical";
			this.title="Options Scene";
			initialisation();
		}
		
		public function initialisation():void
		{
			// id : 
			hBox_id = new HBox();
			id_objet = new TextInput();
			label_id = new Label();
			label_id.text = "id : ";
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
			valeur_y.height=20;
			valeur_y.width=40;	
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
			label_largeur= new Label();
			label_hauteur= new Label();
			valeur_largeur=new TextInput();
			valeur_hauteur=new TextInput();
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
			
			separateur = new HRule();
			separateur.percentWidth=100;
			separateur.styleName="separateur";
		
						
			// Texture:
			label_Texture=new Label();
			label_Texture.text = "TEXTURE :";
			groupe_bouton=new RadioButtonGroup();
			
			// couleur :
			hBox_couleur=new HBox();
			btn_couleur= new RadioButton();
			btn_couleur.label = "Couleur";
			btn_couleur.group=groupe_bouton;
			panel_couleur=new Panel();
			hBox_couleur.addChild(btn_couleur);
			hBox_couleur.addChild(panel_couleur);
			// degrade :
			btn_degrade= new RadioButton();
			btn_degrade.label="Degradé";
			btn_degrade.group=groupe_bouton;
			// image :
			hBox_image=new HBox();
			btn_image=new RadioButton();
			adresse_image= new TextInput();
			adresse_image.height=20;
			adresse_image.width=80;
			btn_image.group=groupe_bouton;
			adresse_image.text="Adresse de l'image";
			btn_image.label="Image";
			hBox_image.addChild(btn_image);
			hBox_image.addChild(adresse_image);

			this.addChild(id_objet);
			this.addChild(hBox_position);
			this.addChild(vBox_taille);
			this.addChild(separateur);	
			this.addChild(label_Texture);
			this.addChild(hBox_couleur);
			this.addChild(btn_degrade);
			this.addChild(hBox_image);
			
		}
		
		public function getValeurX():String
		{
			return valeur_x.text;
		}
		
		public function getValeurY():String
		{
			return valeur_y.text;
		}
		
		public function getValeurLargeur():String
		{
			return valeur_largeur.text;
		}
		
		public function getValeurHauteur():String
		{
			return valeur_hauteur.text;
		}
		
		public function getAdresseImage():String
		{
			return adresse_image.text;
		}
		
		
		public function setValeurX(s:String):void
		{
			valeur_x.text=s;
		}
		
		public function setValeurY(s:String):void
		{
			valeur_y.text=s;
		}
		
		public function setValeurLargeur(s:String):void
		{
			valeur_largeur.text=s;
		}
		
		public function setValeurHauteur(s:String):void
		{
			valeur_hauteur.text=s;
		}
		
		public function setAdresseImage(s:String):void
		{
			adresse_image.text=s;
		}
	}
}