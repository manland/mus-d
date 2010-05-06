package Graphisme.PanelMouvements
{
	import Erreurs.Erreur;
	
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import mx.containers.HBox;
	import mx.containers.TitleWindow;
	import mx.containers.VBox;
	import mx.controls.Button;
	import mx.controls.CheckBox;
	import mx.controls.HRule;
	import mx.controls.Label;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;

	public class FenetreMouvement extends TitleWindow
	{
		private var hBox_generale1:HBoxGeneraleMvt;
	
		// bouton valider et annuler : 
		private var btn_valider:Button;
		private var btn_annuler:Button;
		
		// pour les controles : 
		private var separator:HRule;
		private var clavier:CheckBox;
		private var souris:CheckBox;
		
		// tableau contenant les mouvements ou le controle clavier;
		private var tableau_mvt:Array;
		
		// hashmap contenant un objet et son tableau de mouvement associé :
		private var dico_mvt:Dictionary;
		
		private var panel_option:PanelOption;
		private var erreur:Erreur;
		
		public function FenetreMouvement(panel_option:PanelOption,erreur:Erreur)
		{
			super();
			this.panel_option = panel_option;
			this.erreur = erreur;
			this.width=600;
			this.height=410;
			this.title= "Mouvements :";
//			objet=null;
			this.showCloseButton = true;
			initialisation();
			
		}
		
		public function initialisation():void
		{
			hBox_generale1=new HBoxGeneraleMvt(erreur);
								
			clavier = new CheckBox();
			clavier.label = "Clavier";
			souris = new CheckBox();
			souris.label = "Souris";
			
			var vbox_controle:VBox = new VBox();
			
			separator = new HRule();
			separator.percentWidth = 80;
			separator.x = 10;
			vbox_controle.addChild(separator);
			var label_controle:Label = new Label();
			label_controle.text = "Type de contrôle";
			vbox_controle.addChild(label_controle);
			vbox_controle.addChild(souris);
			vbox_controle.addChild(clavier);
				
			this.addChild(vbox_controle);
			
			// bouton valider et annuler :
			var hbox_btn:HBox = new HBox();
			btn_valider = new Button();
			btn_valider.label = "Valider";
			btn_valider.addEventListener(MouseEvent.CLICK,clicSurBouton);
			btn_annuler = new Button();
			btn_annuler.label = "Annuler";
			btn_annuler.addEventListener(MouseEvent.CLICK,clicSurBouton);
			hbox_btn.addChild(btn_valider);
			hbox_btn.addChild(btn_annuler);
											
			this.addChild(hBox_generale1);
			this.addChild(hbox_btn);
		}
		
		
		// ----------------------------------------------------------
		// 				evenements pour la fenetre : 
		// ----------------------------------------------------------
		private function closeEventHandler(event:CloseEvent):void
		{
            PopUpManager.removePopUp(this);
        } 
        
		override protected function createChildren():void
		{
			super.createChildren();
			this.addEventListener(Event.CLOSE, closeEventHandler);
		}
		
		
		// ----------------------------------------------------------
		//			evenements pour les boutons valider annuler  
		// ----------------------------------------------------------
		public function clicSurBouton(event:MouseEvent):void
		{
			if(event.currentTarget == btn_valider)
			{
				erreur.sysout.text+="valider";	
			}
			else if (event.currentTarget == btn_annuler)
			{
				PopUpManager.removePopUp(this);
			}
		}
		
	}
}