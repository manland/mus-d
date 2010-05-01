package Graphisme.PanelDegrades
{
	import Erreurs.Erreur;
	
	import Graphique.MIObjetGraphique;
	import Graphique.Textures.Degrades.MDegrade;
	
	import flash.display.GradientType;
	import flash.events.MouseEvent;
	
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.RadioButton;
	import mx.controls.RadioButtonGroup;

	public class PanelType extends Panel
	{
		private var groupe_btn:RadioButtonGroup;
		private var btn_normal:RadioButton;
		private var btn_radial:RadioButton;
		
		private var fenetre_degrade:FenetreDegrade;
		private var erreur:Erreur;
		
		public function PanelType(fenetre_degrade:FenetreDegrade,erreur:Erreur)
		{
			super();
			this.fenetre_degrade = fenetre_degrade;
			this.width = 100;
			this.height = 95;
			this.styleName = "stylePanelDegrade";
			this.title = "Type";
			initialisation();
		}
		
		public function initialisation():void
		{
			var vbox:VBox;
			vbox = new VBox();
			btn_normal = new RadioButton();
			btn_radial = new RadioButton();
			groupe_btn = new RadioButtonGroup();
				
			btn_normal.label = "Normal";
			btn_radial.label = "Radial";
			
			btn_normal.addEventListener(MouseEvent.CLICK,changerType);
			btn_radial.addEventListener(MouseEvent.CLICK,changerType);
			
			btn_normal.selected = true;
			
			btn_normal.group = groupe_btn;
			btn_radial.group = groupe_btn;
			vbox.addChild(btn_normal);
			vbox.addChild(btn_radial);
			
			this.addChild(vbox);
		}
		
		
		//----------------------------------------------------------------------------
		// 						Evenements :
		//----------------------------------------------------------------------------
		public function changerType(event:MouseEvent):void
		{
			if(event.currentTarget==btn_normal)
			{
				fenetre_degrade.getDegrade().setType(GradientType.LINEAR);	
			}
			else if(event.currentTarget==btn_radial)
			{
				fenetre_degrade.getDegrade().setType(GradientType.RADIAL);
			}
			fenetre_degrade.getRendu().redessiner();
		}
		
		public function mettreAJour(obj:MIObjetGraphique):void
		{
			var str:String;
			str = ((MDegrade)(obj.getTexture())).getType();
			if(str==GradientType.LINEAR)
			{
				btn_normal.selected=true;
			}
			else if(str==GradientType.RADIAL)
			{
				btn_radial.selected=true;
			}
			fenetre_degrade.getRendu().redessiner();
		}
		
		// accesseur : 
		public function getBtnNormal():RadioButton {return btn_normal; }
		public function getBtnRadial():RadioButton {return btn_radial; }
		
	}
}