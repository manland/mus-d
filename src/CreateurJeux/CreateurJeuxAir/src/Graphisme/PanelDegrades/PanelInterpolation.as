package Graphisme.PanelDegrades
{
	import Graphique.Textures.Degrades.MDegrade;
	
	import flash.display.InterpolationMethod;
	import flash.events.MouseEvent;
	
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.RadioButton;
	import mx.controls.RadioButtonGroup;

	public class PanelInterpolation extends Panel
	{
		private var groupe_btn:RadioButtonGroup;
		private var btn_classic:RadioButton;
		private var btn_rgb:RadioButton;
		

		private var fenetre_degrade:FenetreDegrade;		
		
		public function PanelInterpolation(fenetre_degrade:FenetreDegrade)
		{
			super();
			this.fenetre_degrade=fenetre_degrade;
			this.width = 100;
			this.height = 105;
			this.title="Interpolation";
			this.styleName="stylePanelDegrade";
			initialisation();
		}
		
		public function initialisation():void
		{
			var vbox:VBox;
			vbox =  new VBox();
			groupe_btn = new RadioButtonGroup();
			btn_classic = new RadioButton();
			btn_rgb = new RadioButton();
			btn_classic.addEventListener(MouseEvent.CLICK,clicSurBouton);
			btn_rgb.addEventListener(MouseEvent.CLICK,clicSurBouton);
			
			btn_classic.label = "Classique";
			btn_rgb.label = "RGB";
			
			btn_classic.group = groupe_btn;
			btn_rgb.group = groupe_btn;
			btn_classic.selected=true;
			
			vbox.addChild(btn_classic);
			vbox.addChild(btn_rgb);
			this.addChild(vbox);
			
		}
		
		// evenements : 
		public function clicSurBouton(event:MouseEvent):void
		{
			if(event.currentTarget == btn_classic)
			{
				fenetre_degrade.getDegrade().setInterpolation(InterpolationMethod.LINEAR_RGB);
			}
			else if(event.currentTarget == btn_classic)
			{
				fenetre_degrade.getDegrade().setInterpolation(InterpolationMethod.RGB);
			}
			fenetre_degrade.getRendu().redessiner();
		}		
		
		public function mettreAJour():void
		{
			if(((MDegrade)(fenetre_degrade.getPanelOption().getObjet().getTexture())).getInterpolation()==InterpolationMethod.LINEAR_RGB)
			{
				btn_classic.selected=true;
			}
			else if(((MDegrade)(fenetre_degrade.getPanelOption().getObjet().getTexture())).getInterpolation()==InterpolationMethod.RGB)
			{
				btn_rgb.selected=true;
			}
		}
		
		// accesseur :
		public function getBtnClassic():RadioButton {return btn_classic; }
		public function getBtnRGB():RadioButton {return btn_rgb; }
		
	}
}