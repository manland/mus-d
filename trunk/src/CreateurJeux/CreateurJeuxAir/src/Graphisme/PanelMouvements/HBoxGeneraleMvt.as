package Graphisme.PanelMouvements
{
	import Erreurs.Erreur;
	
	import flash.events.Event;
	
	import mx.containers.HBox;
	import mx.controls.ComboBox;

	public class HBoxGeneraleMvt extends HBox
	{
		// combobox permettant de choisir le type de mouvement pour l'objet selectionné:
		private var choix_mouvement:ComboBox;
		private var hBox:HBox;
		
		private var hbox_mvt_perpetuel:HBoxMouvementPerpetuel;
		private var hbox_mvt_fini:HBoxMouvementFini;
		private var hbox_mvt_redim:HBoxRedimensionnement;
		private var choix_deja_fait:Boolean=false;
		
		private var erreur:Erreur;
		
		public function HBoxGeneraleMvt(erreur:Erreur)
		{
			super();
			this.erreur = erreur;
			initialisation();
		}
		
		public function initialisation():void
		{
			hBox = new HBox();
			// initialisation des vbox des mouvements :
			hbox_mvt_fini = new HBoxMouvementFini();
			hbox_mvt_perpetuel = new HBoxMouvementPerpetuel();
			hbox_mvt_redim = new HBoxRedimensionnement();
		
			
			// combobox : 
			choix_mouvement = new ComboBox();
			choix_mouvement.prompt = "Type de mouvement";
			choix_mouvement.dataProvider = [
												{data:1, label:"Perpetuel"},
												{data:1, label:"Fini"},
												{data:1, label:"Redimensionnement"}
											];
			choix_mouvement.addEventListener(Event.CHANGE,choixEffectue);
			
			this.addChild(choix_mouvement);
		}
		
		// ----------------------------------------------------------
		//			evenements du choix :  
		// ----------------------------------------------------------
		public function choixEffectue(event:Event):void
		{
			if(this.contains(hBox) && !choix_deja_fait)
			{
				this.removeChild(hBox);
			}	
			
				
			if(choix_mouvement.selectedLabel=="Perpetuel")
			{
				hBox.removeAllChildren();
				hBox.addChild(hbox_mvt_perpetuel);
			}
			else if(choix_mouvement.selectedLabel=="Fini")
			{
				hBox.removeAllChildren();
				hBox.addChild(hbox_mvt_fini);
			}
			else if(choix_mouvement.selectedLabel=="Redimensionnement")
			{
				hBox.removeAllChildren();
				hBox.addChild(hbox_mvt_redim);
			}
			
			if(!choix_deja_fait )
			{
				((FenetreMouvement)(this.parent)).addChildAt(new HBoxGeneraleMvt(erreur),((FenetreMouvement)(this.parent)).getChildren().length-1);
		
				this.addChild(hBox);
				choix_deja_fait = true;
			}
		}
	}
}