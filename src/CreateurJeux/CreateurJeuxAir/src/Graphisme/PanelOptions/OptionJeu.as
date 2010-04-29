package Graphisme.PanelOptions
{
	import Graphisme.Onglets.TabOnglet;
	
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.controls.Label;
	import mx.controls.RadioButton;
	import mx.controls.RadioButtonGroup;
	import mx.controls.TextInput;

	public class OptionJeu extends Panel
	{
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
		private var groupe_bouton:RadioButtonGroup;
		// flex :
		private var btn_flex:RadioButton;
		// air :
		private var btn_air:RadioButton;
		
		private var flex_selectionne:Boolean;
		private var air_selectionne:Boolean;
		
		private var tab_onglet:TabOnglet;
		
		public function OptionJeu()
		{
			super();
			this.layout="vertical";
			this.title="Options du jeu";
			flex_selectionne=false;
			air_selectionne=false;
			initialisation();
		}
		
		public function initialisation():void
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
			groupe_bouton= new RadioButtonGroup();
			btn_flex= new RadioButton();
			btn_air=new RadioButton();
			label_type_jeu.text="Type de jeu :"
			btn_flex.label = "Flex (web)";
			btn_flex.group=groupe_bouton;
			btn_air.label="Air (bureau)";
			btn_air.group=groupe_bouton;

			this.addChild(hBox_nom_jeu);
			this.addChild(hBox_nom_auteur);
			this.addChild(label_type_jeu);
			this.addChild(btn_flex);
			this.addChild(btn_air);
			
		}
		
		public function getNomJeu():String
		{
			return valeur_nom_jeu.text;
		}
		
		public function getNomAuteur():String
		{
			return valeur_nom_auteur.text;
		}
		
		public function estDeTypeFlex():Boolean
		{
			if(btn_flex.selected)
			{
				flex_selectionne=true;
			}
			else
			{
				flex_selectionne=false;
			}
			return flex_selectionne;
		}
		
		public function estDeTypeAir():Boolean
		{
			if(btn_air.selected)
			{
				air_selectionne=true;
			}
			else
			{
				air_selectionne=false;
			}
			return flex_selectionne;
		}
		
		
		public function setNomJeu(s:String):void
		{
			valeur_nom_jeu.text=s;
		}
		
		public function setValeurAuteur(s:String):void
		{
			valeur_nom_auteur.text=s;
		}
	}
}