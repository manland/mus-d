package NouvelOnglets
{
	import Onglets.Onglet;
	import Onglets.TabOnglet;
	
	import PanelOptions.PanelOption;
	
	import flash.events.MouseEvent;
	
	import mx.containers.HBox;
	import mx.containers.TitleWindow;
	import mx.containers.VBox;
	import mx.controls.Button;
	import mx.controls.Label;
	import mx.controls.TextArea;
	import mx.managers.PopUpManager;
	
	public class NouvelOnglet extends TitleWindow
	{
		private var panel_opt:PanelOption;
		private var tab_onglet:TabOnglet;
		
		private var btn_ok:Button;
		private var btn_annuler:Button;
		private var text_nom_onglet:TextArea;
		private var vBox_totale:VBox;
		private var hBox_nom_onglet:HBox;
		private var hBox_bouton:HBox;
		
		
		
		public function NouvelOnglet(tab_onglet:TabOnglet,panel_opt:PanelOption)
		{
			this.panel_opt=panel_opt;
			this.tab_onglet=tab_onglet;
			this.title="Nouvel onglet :";
			this.initialisation();
		}
		
		public function initialisation():void
		{
			vBox_totale = new VBox();
			hBox_bouton = new HBox();
			hBox_nom_onglet=new HBox();
			
			text_nom_onglet = new TextArea();
			text_nom_onglet.text="";
			text_nom_onglet.height=20;
		
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
			label_nom_onglet.text="Nom onglet : ";
			hBox_nom_onglet.addChild(label_nom_onglet);
			hBox_nom_onglet.addChild(text_nom_onglet);
			
			vBox_totale.addChild(hBox_nom_onglet);
			vBox_totale.addChild(hBox_bouton);
			
			this.addChild(vBox_totale);			
			
		}
		
		public function valider(event:MouseEvent):void
		{	
			if(text_nom_onglet.text!="")
			{
				var nouvel_onglet:Onglet = new Onglet(panel_opt);
				nouvel_onglet.label=text_nom_onglet.text;
				tab_onglet.addChild(nouvel_onglet);
				tab_onglet.selectedChild=nouvel_onglet;
				text_nom_onglet.text="";
				PopUpManager.removePopUp(this);
			}
		}
		
		public function annuler(event:MouseEvent):void
		{
			PopUpManager.removePopUp(this);
		}

	}
}