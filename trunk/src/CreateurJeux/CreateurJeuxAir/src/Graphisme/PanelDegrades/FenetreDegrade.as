package Graphisme.PanelDegrades
{
	import Erreurs.Erreur;
	
	import Graphique.MGraphiqueScene;
	import Graphique.Textures.Degrades.MDegrade;
	
	import Graphisme.Onglets.Onglet;
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.display.SpreadMethod;
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
	import mx.controls.Spacer;
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
		
		// bouton de validation et d'annuler : 
		private var btn_valider:Button;
		private var btn_annuler:Button;
		
		// degradé : 
		private var degrade:MDegrade;
		
		private var panel_option:PanelOption;
		private var erreur:Erreur;
		
		public function FenetreDegrade(panel_option:PanelOption,erreur:Erreur)
		{
			super();
			this.panel_option = panel_option;
			this.erreur = erreur;
			this.width=453;
			this.height=400;
			this.title= "Options du dégradé :";
			this.showCloseButton = true;
			initialisation();
		}
		
		
		public function initialisation():void
		{
			vbox_generale = new VBox();
			grille = new Grid();
			degrade = new MDegrade();

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
			color_picker1.addEventListener(Event.CHANGE,changerCouleur);
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
			alpha1.value=1;
			alpha1.stepSize = 0.1;
			alpha1.width=43;
			alpha1.height=20;
			alpha1.addEventListener(Event.CHANGE,changerCouleur);
			
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
			ratio1.addEventListener(Event.CHANGE,changerCouleur);
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


			// apercu : 
			panel_apercu = new Panel();
			panel_apercu.title="Aperçu :";
			panel_apercu.width = 130;
			panel_apercu.height = 130;
			panel_apercu.styleName = "stylePanelDegrade";
			
			rendu = new MGraphiqueScene();
			rendu.width = 124;
			rendu.height= 115;
			rendu.setTexture(degrade);
			panel_apercu.addChild(rendu);			
		
			// différents panels : 	
			panel_spread_method = new PanelSpreadMethod(this,erreur);
			panel_type = new PanelType(this,erreur);
			panel_interpolation = new PanelInterpolation(this);
			
		
			
			// les différents panel : ligne 1 :
			var hbox1:HBox;
			hbox1 = new HBox();
			var space:Spacer;
			space = new Spacer();
			space.width =1;
			hbox1.addChild(space);
			hbox1.addChild(panel_spread_method);
			space = new Spacer();
			space.width = 3;
			hbox1.addChild(space);
			hbox1.addChild(panel_type);
			hbox1.addChild(panel_apercu);
			
			
			// différents panel ligne 2 :
			var hbox2:HBox;
			hbox2 = new HBox();
			space = new Spacer();
			space.width = 1;
			hbox2.addChild(space);
			panel_box = new PanelBox(this);
			hbox2.addChild(panel_box);
			
			// valider et annuler : 
			btn_valider = new Button();
			btn_annuler = new Button();
			btn_valider.label = "Valider";
			btn_annuler.label = "Annuler";
			btn_valider.addEventListener(MouseEvent.CLICK,valider);
			btn_annuler.addEventListener(MouseEvent.CLICK,annuler);
			
			space = new Spacer();
			space.width = 3;
			hbox2.addChild(space);
			hbox2.addChild(panel_interpolation);
//			hbox2.addChild(btn_valider);
//			hbox2.addChild(btn_annuler);
			
			var vBox1:VBox;
			vBox1=new VBox();
			
			vBox1.addChild(hbox1);
			vBox1.addChild(hbox2);
			
			var hbox_generale:HBox;
			hbox_generale = new HBox();
			hbox_generale.addChild(vBox1);
			
			
			vbox_apercu = new VBox();
			space = new Spacer();
			space.height = 30;
			var vbox_apercu:VBox;
			
			vbox_apercu.addChild(space);
			vbox_apercu.addChild(panel_apercu);
			
			space = new Spacer();
			space.width = 3;
			hbox_generale.addChild(space);
			hbox_generale.addChild(vbox_apercu);
			
			var hbox_btn:HBox;
			hbox_btn = new HBox();
			space = new Spacer();
			space.width = 130;
			hbox_btn.addChild(space);
			hbox_btn.addChild(btn_valider);
			space = new Spacer();
			space.width = 20;
			hbox_btn.addChild(space);
			hbox_btn.addChild(btn_annuler);
			var vbox_btn:VBox;
			vbox_btn = new VBox();
			space = new Spacer();
			space.height = 15;
			vbox_btn.addChild(space);
			vbox_btn.addChild(hbox_btn);
			
			vbox_generale.addChild(grille);
			space = new Spacer();
			space.height = 3;
			vbox_generale.addChild(space);
			vbox_generale.addChild(hbox_generale);
			vbox_generale.addChild(vbox_btn);
			
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
		
		public function ajouterOjetsPourCouleur():void
		{
				var color_picker:ColorPicker;
				color_picker = new ColorPicker();
				color_picker.addEventListener(Event.CHANGE,changerCouleur);
				
				tab_couleur.push(color_picker);
				
				var ratio:NumericStepper;
				ratio = new NumericStepper();
				ratio.minimum=0;
				ratio.maximum=255;
				ratio.stepSize=1;
				ratio.width=45;
				ratio.height=20;
				ratio.addEventListener(Event.CHANGE,changerCouleur);
				tab_ratio.push(ratio);
				
				var alpha:NumericStepper;
				alpha = new NumericStepper();
				alpha.minimum=0;
				alpha.maximum=1;
				alpha.value=1;
				alpha.stepSize=0.1;
				alpha.width=43;
				alpha.height=20;
				alpha.addEventListener(Event.CHANGE,changerCouleur);
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
		
		public function afficherColorPicker(event:Event):void
		{
			if(nb_couleur.value > tab_couleur.length)
			{
				ajouterOjetsPourCouleur();
			}
			else
			{
				ligne_couleur.removeChildAt(tab_couleur.length+1);
				tab_couleur.pop();
				
				ligne_alpha.removeChildAt(tab_alpha.length+1);
				tab_alpha.pop();
				
				ligne_ratio.removeChildAt(tab_ratio.length+1);
				tab_ratio.pop();
			}
		}
		
		// --------------------------------------------------------------------
		// 						Evenement du color picker :
		// --------------------------------------------------------------------
		public function changerCouleur(event:Event):void
		{
			// intialisation des tableaux de couleur : 
			var tableau_couleur_uint:Array;
			tableau_couleur_uint = new Array();
			for(var i:int=0;i<tab_couleur.length;i++)
			{
				tableau_couleur_uint[i]="0x"+Onglet.uint2hex(((ColorPicker)(tab_couleur[i])).selectedColor.valueOf());
			}
			var tableau_nombre_alpha:Array;
			tableau_nombre_alpha = new Array();
			for(var i:int=0;i<tab_alpha.length;i++)
			{
				tableau_nombre_alpha[i]=((NumericStepper)(tab_alpha[i])).value;
			}
			var tableau_nombre_ratio:Array;
			tableau_nombre_ratio = new Array();
			for(var i:int=0;i<tab_ratio.length;i++)
			{
				tableau_nombre_ratio[i]=((NumericStepper)(tab_ratio[i])).value;
			}
			
			
			
			determinerSpreadMethod();
			
			degrade.setCouleurs(tableau_couleur_uint);
			degrade.setAlphas(tableau_nombre_alpha);
			degrade.setRatios(tableau_nombre_ratio);
			rendu.redessiner();
		}
		
		
		public function determinerSpreadMethod():void
		{
			if(panel_spread_method.getBtnNormal().selected==true)
			{
				degrade.setSpreadMethod(SpreadMethod.PAD);
			}
			else if(panel_spread_method.getBtnReflet().selected==true)
			{
				degrade.setSpreadMethod(SpreadMethod.REFLECT);
			}
			else if(panel_spread_method.getBtnRepeat().selected==true)
			{
				degrade.setSpreadMethod(SpreadMethod.REPEAT);
			}
			
		}
		
		// --------------------------------------------------------------------
		//						Evenement sur les boutons
		// --------------------------------------------------------------------
		
		public function annuler(event:MouseEvent):void
		{
			PopUpManager.removePopUp(this);
		}
		
		public function valider(event:MouseEvent):void
		{
			panel_option.getObjet().setTexture(degrade.clone());
			panel_option.getPanelRenduDegrade().setTexture(degrade.clone());
			PopUpManager.removePopUp(this);
		}

		// --------------------------------------------------------------------
		//						mise-a-jour :
		// --------------------------------------------------------------------
		public function mettreAJour():void
		{
			var tab_c:Array = ((MDegrade)(panel_option.getObjet().getTexture())).getCouleurs();
			var tab_a:Array =((MDegrade)(panel_option.getObjet().getTexture())).getAlphas();
			var tab_r:Array = ((MDegrade)(panel_option.getObjet().getTexture())).getRatios();
			
			if(tab_c.length==nb_couleur.value)
			{
				for(var i:int=0;i<nb_couleur.value;i++)
				{
					((ColorPicker)(tab_couleur[i])).selectedColor=tab_c[i];
					((NumericStepper)(tab_alpha[i])).value = tab_a[i];
					((NumericStepper)(tab_ratio[i])).value = tab_r[i];
				}
			}
			else if(tab_c.length<nb_couleur.value)
			{
				var n:Number;
				n=nb_couleur.value-tab_c.length;		// on récupère la différence des deux
				nb_couleur.value=tab_c.length;
				for(var i:int=0;i<n;i++)
				{
					ligne_couleur.removeChildAt(tab_couleur.length+1);
					tab_couleur.pop();
					
					ligne_alpha.removeChildAt(tab_alpha.length+1);
					tab_alpha.pop();
				
					ligne_ratio.removeChildAt(tab_ratio.length+1);
					tab_ratio.pop();
					
					((ColorPicker)(tab_couleur[i])).selectedColor=tab_c[i];
					((NumericStepper)(tab_alpha[i])).value = tab_a[i];
					((NumericStepper)(tab_ratio[i])).value = tab_r[i];
				}
			}
			else
			{
				var n:Number;
				n=tab_c.length-nb_couleur.value;		// on récupère la différence des deux
				nb_couleur.value=tab_c.length;
				for(var i:int=0;i<n;i++)
				{
					var color_picker:ColorPicker;
					color_picker = new ColorPicker();
					color_picker.addEventListener(Event.CHANGE,changerCouleur);
					
					
					tab_couleur.push(color_picker);
					
					
					var ratio:NumericStepper;
					ratio = new NumericStepper();
					ratio.minimum=0;
					ratio.maximum=255;
					ratio.stepSize=1;
					ratio.width=45;
					ratio.height=20;
					ratio.addEventListener(Event.CHANGE,changerCouleur);
					tab_ratio.push(ratio);
					
					var alpha:NumericStepper;
					alpha = new NumericStepper();
					alpha.minimum=0;
					alpha.maximum=1;
					alpha.value=1;
					alpha.stepSize=0.1;
					alpha.width=43;
					alpha.height=20;
					alpha.addEventListener(Event.CHANGE,changerCouleur);
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
				for(var i:int=0;i<nb_couleur.value;i++)
				{
					((ColorPicker)(tab_couleur[i])).selectedColor=tab_c[i];
					((NumericStepper)(tab_alpha[i])).value = tab_a[i];
					((NumericStepper)(tab_ratio[i])).value = tab_r[i];
				}
			}
			panel_box.mettreAJour();
			panel_interpolation.mettreAJour();
			panel_spread_method.mettreAJour();
			panel_type.mettreAJour();
			degrade = panel_option.getObjet().getTexture().clone() as MDegrade;
			rendu.setTexture(degrade);
			rendu.redessiner();
		}
		
		
		// --------------------------------------------------------------------
		//						accesseurs : 
		// --------------------------------------------------------------------
		public function getErreur():Erreur {return erreur;}
		public function getRendu():MGraphiqueScene {return rendu;}
		public function getApercu():Panel {return panel_apercu;}
		public function getDegrade():MDegrade {return degrade;}
		public function getPanelOption():PanelOption {return panel_option;}
	}
	
}