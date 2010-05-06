package Graphisme.NouvelOnglets
{
	import Erreurs.Erreur;
	
	import Graphisme.Onglets.Onglet;
	import Graphisme.Onglets.TabOnglet;
	import Graphisme.PanelOptions.OptionJeu;
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.events.MouseEvent;
	
	import mx.containers.HBox;
	import mx.containers.TitleWindow;
	import mx.containers.VBox;
	import mx.controls.Button;
	import mx.controls.Label;
	import mx.controls.RadioButton;
	import mx.controls.RadioButtonGroup;
	import mx.controls.TextInput;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	
	public class NouvelOnglet extends TitleWindow
	{
		private var panel_opt:PanelOption;
		private var tab_onglet:TabOnglet;
		
		private var btn_ok:Button;
		private var btn_annuler:Button;
		private var text_nom_onglet:TextInput;
		private var vBox_totale:VBox;
		private var hBox_nom_onglet:HBox;
		private var hBox_bouton:HBox;
		
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
		
		private var flex_selectionne:Boolean;
		private var air_selectionne:Boolean;
		
		private var erreur:Erreur;
		
		private var option_jeu:OptionJeu;
		
		public function NouvelOnglet(tab_onglet:TabOnglet,panel_opt:PanelOption, erreur:Erreur)
		{
			this.erreur=erreur;
			this.panel_opt=panel_opt;
			this.tab_onglet=tab_onglet;
			this.option_jeu =tab_onglet.getOptionJeu();
			this.title="Nouvel onglet :";
			this.initialisation();
		}
		
		public function initialisation():void
		{
			vBox_totale = new VBox();
			hBox_bouton = new HBox();
			hBox_nom_onglet=new HBox();
			
			text_nom_onglet = new TextInput();
			text_nom_onglet.text="";
			text_nom_onglet.addEventListener(FlexEvent.ENTER,toucheEntree);
		
			// bouton ok : 
			btn_ok = new Button();
			btn_ok.label="ok";
			btn_ok.addEventListener(MouseEvent.CLICK,valider);
			
			// bouton annuler : 
			btn_annuler = new Button();
			btn_annuler.label="Annuler";
			btn_annuler.addEventListener(MouseEvent.CLICK,annuler);
			
			// ajout des boutons a la box :
			hBox_bouton.addChild(btn_ok);
			hBox_bouton.addChild(btn_annuler);
			
			// remplissage de l'hbox permettant de donner un nom a un onglet :
			var label_nom_onglet:Label = new Label();
			label_nom_onglet.text="Nom du jeu : ";
			hBox_nom_onglet.addChild(label_nom_onglet);
			hBox_nom_onglet.addChild(text_nom_onglet);
			
			
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
			btn_flex.selected=true;

			vBox_totale.addChild(hBox_nom_onglet);
			vBox_totale.addChild(hBox_nom_auteur);
			vBox_totale.addChild(label_type_jeu);
			vBox_totale.addChild(btn_flex);
			vBox_totale.addChild(btn_air);
			vBox_totale.addChild(hBox_bouton);
			
			this.addChild(vBox_totale);			
			
		}
		
		public function valider(event:MouseEvent):void
		{	
			if(text_nom_onglet.text!="")
			{
				var nouvel_onglet:Onglet = new Onglet(panel_opt,option_jeu,erreur);
				nouvel_onglet.label=text_nom_onglet.text;
//				panel_opt.setNomJeu(text_nom_onglet.text);
				tab_onglet.addChild(nouvel_onglet);
				tab_onglet.selectedChild=nouvel_onglet;
				mettreAJourPanelOption();
				text_nom_onglet.text="";
				PopUpManager.removePopUp(this);
			}
		}
		
		public function toucheEntree(event:FlexEvent):void
		{	
			if(text_nom_onglet.text!="")
			{
				var nouvel_onglet:Onglet = new Onglet(panel_opt,option_jeu,erreur);
				nouvel_onglet.label=text_nom_onglet.text;
				tab_onglet.addChild(nouvel_onglet);
				tab_onglet.selectedChild=nouvel_onglet;
				mettreAJourPanelOption();
				text_nom_onglet.text="";
				PopUpManager.removePopUp(this);
				
			}
		}
		
		public function annuler(event:MouseEvent):void
		{
			text_nom_onglet.text="";
			PopUpManager.removePopUp(this);
		}
		
		public function getTextInput():TextInput
		{
			return text_nom_onglet;
		}

		//	// mettre a jour le panel option en fonction de ce qui est entré dans la fenetre :
		public function mettreAJourPanelOption():void
		{
			var ong:Onglet = tab_onglet.getOnglet();
			ong.setNomJeu(this.getNomJeu());
			ong.setNomAuteur(this.getNomAuteur());
			if(this.btn_air.selected)
			{
				ong.setTypeJeu("Air");
			}
			else if(this.btn_flex.selected)
			{
				ong.setTypeJeu("Flex");
			}
		}
		
		
		
		//-----------------------------------------------------------------------------------
		//								ACCESSEURS :
		//-----------------------------------------------------------------------------------
			public function getNomJeu():String { return text_nom_onglet.text; }		
			public function setNomJeu(s:String):void { text_nom_onglet.text=s; }	
					
			public function getNomAuteur():String { return valeur_nom_auteur.text; }
			public function setNomAuteur(s:String):void { valeur_nom_auteur.text=s; }	
		
	}
}