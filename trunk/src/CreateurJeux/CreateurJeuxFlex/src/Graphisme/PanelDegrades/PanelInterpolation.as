package Graphisme.PanelDegrades
{
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.RadioButton;
	import mx.controls.RadioButtonGroup;

	public class PanelInterpolation extends Panel
	{
		private var groupe_btn:RadioButtonGroup;
		private var btn_classic:RadioButton;
		private var btn_rgb:RadioButton;
		
		public function PanelInterpolation()
		{
			super();
			this.width = 100;
			this.height = 95;
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
			
			btn_classic.label = "Classique";
			btn_rgb.label = "RGB";
			
			btn_classic.group = groupe_btn;
			btn_rgb.group = groupe_btn;
			btn_classic.selected=true;
			
			vbox.addChild(btn_classic);
			vbox.addChild(btn_rgb);
			this.addChild(vbox);
			
		}
		
		// accesseur :
		public function getBtnClassic():RadioButton {return btn_classic; }
		public function getBtnRGB():RadioButton {return btn_rgb; }
		
	}
}