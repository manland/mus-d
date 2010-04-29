package Graphisme.PanelDegrades
{
	import Erreurs.Erreur;
	
	import Graphique.MGraphiqueScene;
	import Graphique.Textures.Degrades.MDegrade;
	
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.containers.Grid;
	import mx.containers.GridItem;
	import mx.containers.GridRow;
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.containers.TitleWindow;
	import mx.containers.VBox;
	import mx.controls.Button;
	import mx.controls.ColorPicker;
	import mx.controls.Label;
	import mx.controls.NumericStepper;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;

	public class FenetreDegrade extends TitleWindow
	{
		// tableau qui contiendra tout ce qui concerne : couleur, alpha et ratio:
		private var grille:Grid;
		private var vbox_generale:VBox;
		
		// couleurs  :
		private var ligne_couleur:GridRow;
		private var label_couleur:Label;
		private var nb_couleur:NumericStepper;
		private var tab_couleur:Array;
		private var color_picker1:ColorPicker;
		
		// alpha :
		private var ligne_alpha:GridRow;  
		private var label_alpha:Label;
		private var tab_alpha:Array;
		private var alpha1:NumericStepper;
		
		// ratio :
		private var ligne_ratio:GridRow;  
		private var label_ratio:Label;
		private var tab_ratio:Array;
		private var ratio1:NumericStepper;
		
		// panel spread method :
		private var panel_spread_method:PanelSpreadMethod;
		
		// panel type :
		private var panel_type:PanelType;
		
		// panel interpolation :
		private var panel_interpolation:PanelInterpolation;
		
		// Apercu : 
		private var panel_apercu:Panel;
		private var rendu:MGraphiqueScene;
		
		// panel Box :
		private var panel_box:PanelBox;
		
		// panel position dans box :
		private var panel_position_dans_box:PanelPositionDansBox;
		
		// bouton de validation et d'annuler : 
		private var btn_valider:Button;
		private var btn_annuler:Button;
		
		private var panel_option:PanelOption;
		private var erreur:Erreur;
		
		public function FenetreDegrade(panel_option:PanelOption,erreur:Erreur)
		{
			super();
			this.panel_option = panel_option;
			this.erreur = erreur;
			this.width=453;
			this.height=500;
			this.title= "Options du dégradé :";
			this.showCloseButton = true;
			initialisation();
		}
		
		
		public function initialisation():void
		{
			vbox_generale = new VBox();
			grille = new Grid();

			// couleur :
			ligne_couleur = new GridRow();
			label_couleur = new Label();
			label_couleur.text = "Nombre de Couleurs :";
			nb_couleur = new NumericStepper();
			nb_couleur.minimum = 1;
			nb_couleur.maximum = 5;
			nb_couleur.stepSize = 1;
			nb_couleur.width=40;
			nb_couleur.height=20;
			nb_couleur.addEventListener(Event.CHANGE,afficherColorPicker);
			color_picker1 = new ColorPicker();
			var item_nbCouleur:GridItem;
			item_nbCouleur = new GridItem();
			item_nbCouleur.addChild(nb_couleur)
			tab_couleur = new Array();
			tab_couleur.push(color_picker1);
			
			var item_color_picker:GridItem;
			item_color_picker = new GridItem();
			item_color_picker.addChild(color_picker1);
			
			var item_label_couleur:GridItem;
			item_label_couleur = new GridItem();
			item_label_couleur.addChild(label_couleur);
			
			ligne_couleur.addChild(item_label_couleur);
			ligne_couleur.addChild(item_nbCouleur);
			ligne_couleur.addChild(item_color_picker);
			
			// alpha : 
			ligne_alpha = new GridRow();
			label_alpha = new Label();
			label_alpha.text = "Alpha :";
			alpha1 = new NumericStepper();
			alpha1.minimum = 0;
			alpha1.maximum = 1;
			alpha1.stepSize = 0.1;
			alpha1.width=43;
			alpha1.height=20;
			
			var item_label_alpha:GridItem;
			item_label_alpha = new GridItem();
			item_label_alpha.addChild(label_alpha);
			
			var item_alpha:GridItem;
			item_alpha = new GridItem();
			item_alpha.addChild(alpha1);
			
			tab_alpha = new Array();
			tab_alpha.push(alpha1);
			
			ligne_alpha.addChild(item_label_alpha);
			ligne_alpha.addChild(new GridItem());
			ligne_alpha.addChild(item_alpha);


			// ratio : 
			ligne_ratio = new GridRow();
			label_ratio = new Label();
			label_ratio.text = "Ratio :";
			ratio1 = new NumericStepper();
			ratio1.minimum = 0;
			ratio1.maximum = 255;
			ratio1.stepSize = 1;
			ratio1.width=45;
			ratio1.height=20;
			
			var item_label_ratio:GridItem;
			item_label_ratio = new GridItem();
			item_label_ratio.addChild(label_ratio);
			
			var item_ratio:GridItem;
			item_ratio = new GridItem();
			item_ratio.addChild(ratio1);

			tab_ratio = new Array();
			tab_ratio.push(ratio1);
			
			ligne_ratio.addChild(item_label_ratio);
			ligne_ratio.addChild(new GridItem());
			ligne_ratio.addChild(item_ratio);			
			
			grille.addChild(ligne_couleur);
			grille.addChild(ligne_alpha);
			grille.addChild(ligne_ratio);
		
			// différents panels : 	
			panel_spread_method = new PanelSpreadMethod();
			panel_type = new PanelType();
			panel_interpolation = new PanelInterpolation();
			
			// apercu : 
			panel_apercu = new Panel();
			panel_apercu.title="Aperçu :";
			panel_apercu.width = 100;
			panel_apercu.width = 95;
			panel_apercu.styleName = "stylePanelDegrade";
			
			rendu = new MGraphiqueScene();
			rendu.largeur=50;
			rendu.hauteur = 50;
			rendu.setTexture(new MDegrade());
			
			panel_apercu.addChild(rendu);			
			
			// les différents panel : ligne 1 :
			var hbox1:HBox;
			hbox1 = new HBox();
			hbox1.addChild(panel_spread_method);
			hbox1.addChild(panel_type);
			hbox1.addChild(panel_interpolation);
			hbox1.addChild(panel_apercu);
			
			
			// différents panel ligne 2 :
			var hbox2:HBox;
			hbox2 = new HBox();
			panel_box = new PanelBox();
			hbox2.addChild(panel_box);
			
			panel_position_dans_box = new PanelPositionDansBox();
			hbox2.addChild(panel_position_dans_box);
			
			// valider et annuler : 
			btn_valider = new Button();
			btn_annuler = new Button();
			btn_valider.label = "Valider";
			btn_annuler.label = "Annuler";
			btn_valider.addEventListener(MouseEvent.CLICK,valider);
			btn_annuler.addEventListener(MouseEvent.CLICK,annuler);
			
			hbox2.addChild(btn_valider);
			hbox2.addChild(btn_annuler);
			
			vbox_generale.addChild(grille);
			vbox_generale.addChild(hbox1);
			vbox_generale.addChild(hbox2);
			
			
			
			
			this.addChild(vbox_generale);
			
			
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
		// 						Couleurs : 
		// ----------------------------------------------------------		
		public function afficherColorPicker(event:Event):void
		{
			if(nb_couleur.value > tab_couleur.length)
			{
				var color_picker:ColorPicker;
				color_picker = new ColorPicker();
				tab_couleur.push(color_picker);
				
				var ratio:NumericStepper;
				ratio = new NumericStepper();
				ratio.minimum=0;
				ratio.maximum=255;
				ratio.stepSize=1;
				ratio.width=45;
				ratio.height=20;
				tab_ratio.push(ratio);
				
				var alpha:NumericStepper;
				alpha = new NumericStepper();
				alpha.minimum=0;
				alpha.maximum=1;
				alpha.stepSize=0.1;
				alpha.width=43;
				alpha.height=20;
				tab_alpha.push(alpha);

				var item_couleur:GridItem;
				item_couleur = new GridItem();
				item_couleur.addChild(color_picker);
				ligne_couleur.addChild(item_couleur);
				
				var item_alpha:GridItem;
				item_alpha = new GridItem();
				item_alpha.addChild(alpha);
				ligne_alpha.addChild(item_alpha);
				
				var item_ratio:GridItem;
				item_ratio = new GridItem();
				item_ratio.addChild(ratio);
				ligne_ratio.addChild(item_ratio);
			}
			else
			{
				ligne_couleur.removeChildAt(tab_couleur.length);
				tab_couleur.pop();
				
				ligne_alpha.removeChildAt(tab_alpha.length);
				tab_alpha.pop();
				
				ligne_ratio.removeChildAt(tab_ratio.length);
				tab_ratio.pop();
			}
		}
		
		public function annuler(event:MouseEvent):void
		{
			erreur.sysout.text+="annuler \n";
		}
		
		public function valider(event:MouseEvent):void
		{
			erreur.sysout.text+="valider \n";
		}
		
	}
}