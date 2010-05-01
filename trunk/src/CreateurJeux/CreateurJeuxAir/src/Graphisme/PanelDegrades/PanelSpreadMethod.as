package Graphisme.PanelDegrades
{
	import Erreurs.Erreur;
	
	import Graphique.MIObjetGraphique;
	import Graphique.Textures.Degrades.MDegrade;
	
	import flash.display.SpreadMethod;
	import flash.events.MouseEvent;
	
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.RadioButton;
	import mx.controls.RadioButtonGroup;

	public class PanelSpreadMethod extends Panel
	{
		// boutons : 
		private var groupe_btn:RadioButtonGroup;
		private var btn_normal:RadioButton;
		private var btn_reflet:RadioButton;
		private var btn_repeat:RadioButton;
		
		private var fenetre_degrade:FenetreDegrade;
		private var erreur:Erreur;
		
		public function PanelSpreadMethod(fenetre_degrade:FenetreDegrade,erreur:Erreur)
		{
			super();
			this.erreur = erreur;
			this.fenetre_degrade = fenetre_degrade;
			this.title = "SpreadMethod";
			this.width = 145;
			this.height=96;
			this.styleName = "stylePanelDegrade";
			initialisation();
		}
		
		public function initialisation():void
		{
			var vBox:VBox;
			vBox = new VBox();
			groupe_btn = new RadioButtonGroup();
			btn_normal = new RadioButton();
			btn_reflet = new RadioButton();
			btn_repeat = new RadioButton();
			
			btn_normal.label = "Normal";
			btn_reflet.label = "Reflet";
			btn_repeat.label = "Repété";
		
			btn_normal.group = groupe_btn;
			btn_reflet.group = groupe_btn;
			btn_repeat.group = groupe_btn;
			
			btn_normal.addEventListener(MouseEvent.CLICK,clicSurBouton);
			btn_reflet.addEventListener(MouseEvent.CLICK,clicSurBouton);
			btn_repeat.addEventListener(MouseEvent.CLICK,clicSurBouton);
			
			
			
			btn_normal.selected = true;
			
			vBox.addChild(btn_normal);
			vBox.addChild(btn_reflet);
			vBox.addChild(btn_repeat);
			
			this.addChild(vBox);
		}
		
		// accesseur : 
		public function getBtnNormal():RadioButton {return btn_normal; }
		public function getBtnReflet():RadioButton {return btn_reflet; }
		public function getBtnRepeat():RadioButton {return btn_repeat; }
		
		//----------------------------------------------------------------------
		//						Evenements : 
		//----------------------------------------------------------------------
		public function clicSurBouton(event:MouseEvent):void
		{
			var degrade:MDegrade;
			degrade=fenetre_degrade.getDegrade();
			
			if(event.currentTarget==btn_normal)
			{
				degrade.setSpreadMethod(SpreadMethod.PAD);
			}
			else if(event.currentTarget==btn_reflet)
			{
				degrade.setSpreadMethod(SpreadMethod.REFLECT);
			}
			else if(event.currentTarget==btn_repeat)
			{
				degrade.setSpreadMethod(SpreadMethod.REPEAT);
			}
			fenetre_degrade.getRendu().redessiner();
		}
		
		public function mettreAJour(obj:MIObjetGraphique):void
		{
			var str:String;
			str = ((MDegrade)(obj.getTexture())).getSpreadMethod();
			if(str==SpreadMethod.PAD)
			{
				btn_normal.selected=true;
			}
			else if(str==SpreadMethod.REFLECT)
			{
				btn_reflet.selected=true;
			}
			else if(str==SpreadMethod.REPEAT)
			{
				btn_repeat.selected=true;
			}
			fenetre_degrade.getRendu().redessiner();
		}
	}
}