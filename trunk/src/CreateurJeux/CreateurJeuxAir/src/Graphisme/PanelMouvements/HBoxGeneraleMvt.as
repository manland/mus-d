package Graphisme.PanelMouvements
{
	import Erreurs.Erreur;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.containers.HBox;
	import mx.controls.Button;
	import mx.controls.ComboBox;

	public class HBoxGeneraleMvt extends HBox
	{
		// combobox permettant de choisir le type de mouvement pour l'objet selectionné:
		private var choix_mouvement:ComboBox;
		private var hBox:HBox;
		
		// bouton permettant d'annuler le mouvement
		private var btn_close:Button;
		
		private var hbox_mvt_perpetuel:HBoxMouvementPerpetuel;
		private var hbox_mvt_fini:HBoxMouvementFini;
		private var hbox_mvt_redim:HBoxRedimensionnement;
		private var hbox_mvt_circ_fini:HBoxMouvementCirculaireFini;
		private var hbox_mvt_circ_perpet:HBoxMouvementCirculairePerpetuel;
		private var hbox_rotation_perpet:HBoxMouvementCirculairePerpetuel;
		private var choix_deja_fait:Boolean=false;
		
		// type de hbox en string :
		private var type:String;	
	
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
			hbox_mvt_circ_fini = new HBoxMouvementCirculaireFini();
			hbox_mvt_circ_perpet = new HBoxMouvementCirculairePerpetuel();
			hbox_rotation_perpet = new HBoxMouvementCirculairePerpetuel();
			
			// combobox : 
			choix_mouvement = new ComboBox();
			choix_mouvement.prompt = "Type de mouvement";
			choix_mouvement.dataProvider = [
												{label:"Perpetuel"},
												{label:"Fini"},
												{label:"Redimensionnement"},
												{label:"Circulaire fini"},
												{label:"Circulaire perpetuel"},
												{label:"Rotation perpetuelle"}
											];
			choix_mouvement.addEventListener(Event.CHANGE,choixEffectue);
			
			this.addChild(choix_mouvement);
			
			// pour annuler le mouvement : 
			btn_close = new Button();
			btn_close.width = 20;
			btn_close.height = 20;
			btn_close.styleName = "boutonClose";
			btn_close.addEventListener(MouseEvent.CLICK,effacerHbox);
			
			// type : 
			type ="";
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
				type = "perpetuel";
			}
			else if(choix_mouvement.selectedLabel=="Fini")
			{
				hBox.removeAllChildren();
				hBox.addChild(hbox_mvt_fini);
				type = "fini";
			}
			else if(choix_mouvement.selectedLabel=="Redimensionnement")
			{
				hBox.removeAllChildren();
				hBox.addChild(hbox_mvt_redim);
				type = "redimensionnement";
			}
			else if(choix_mouvement.selectedLabel=="Circulaire fini")
			{
				hBox.removeAllChildren();
				hBox.addChild(hbox_mvt_circ_fini);
				type = "circulaire_fini";
			}
			else if(choix_mouvement.selectedLabel=="Circulaire perpetuel")
			{
				hBox.removeAllChildren();
				hBox.addChild(hbox_mvt_circ_perpet);
				type = "circulaire_perpet";
			}
			else if(choix_mouvement.selectedLabel=="Rotation perpetuelle")
			{
				hBox.removeAllChildren();
				hBox.addChild(hbox_rotation_perpet);
				type = "rotation_perpet";
			}
			if(!choix_deja_fait )
			{
				((FenetreMouvement)(this.parent)).addChildAt(new HBoxGeneraleMvt(erreur),((FenetreMouvement)(this.parent)).getChildren().length-2);
				((FenetreMouvement)(this.parent)).getTableauHbox().push(this);
				this.addChild(hBox);
				choix_deja_fait = true;
				this.addChild(btn_close);
			}
		}
		
		// ----------------------------------------------------------
		//			evenements du bouton close :  
		// ----------------------------------------------------------
		public function effacerHbox(event:MouseEvent):void
		{
			var indice:Number = ((FenetreMouvement)(this.parent)).getChildIndex(((event.currentTarget as Button).parent as HBoxGeneraleMvt)).toString();
			var indice_dans_tab:Number =  ((FenetreMouvement)(this.parent)).getTableauHbox().indexOf(((event.currentTarget as Button).parent as HBoxGeneraleMvt),0);

			((FenetreMouvement)(this.parent)).getTableauHbox().splice(indice_dans_tab,1);
			((FenetreMouvement)(this.parent)).removeChildAt(indice);		
			
		}
		
		// ----------------------------------------------------------
		//			accesseurs : 
		// ----------------------------------------------------------
		public function getType():String {return type; }
		public function setType(s:String) {type=s;}
		public function getHbox():HBox {return hBox;}
		public function getChoixMouvement():ComboBox {return choix_mouvement;}
	}
}