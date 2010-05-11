package Graphisme.PanelOptions
{
	import Graphisme.Onglets.Onglet;
	import Graphisme.Onglets.TabOnglet;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.controls.Button;
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
		
	
		
		private var tab_onglet:TabOnglet;
		
		// type du jeu : 
		private var label_type_jeu:Label;
		private var groupe_bouton_type_jeu:RadioButtonGroup;
		// flex :
		private var btn_flex:RadioButton;
		// air :
		private var btn_air:RadioButton;
		// valider les changements sur le jeu :
		private var btn_valider_jeu;
		
		
		
		public function OptionJeu()
		{
			super();
			tab_onglet = null;
			this.layout="vertical";
			this.title="Options du jeu";
			this.styleName = "PanelsOption";
			this.width = 190;
			this.height = 200;
//			valeur_nom_jeu.text = tab_onglet.getOnglet().getNomJeu();	
		
			initialisationJeu();
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
		
		
			// accesseur pour le jeu :
		public function getNomJeu():String { return valeur_nom_jeu.text; }		
		public function getNomAuteur():String { return valeur_nom_auteur.text; }		
		
		public function setTypeFlex(b:Boolean):void {btn_flex.selected=b;}
		public function setTypeAir(b:Boolean):void {btn_air.selected=b;}
			
		public function setNomJeu(s:String):void { valeur_nom_jeu.text=s; }		
		public function setNomAuteur(s:String):void { valeur_nom_auteur.text=s; }
		
		
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
		
		public function setTabOnglet(t:TabOnglet):void { tab_onglet = t; 	tab_onglet.addEventListener(Event.CHANGE,miseAJour);}
		
	}
}