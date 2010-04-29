package Graphisme.PanelDegrades
{
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.RadioButton;
	import mx.controls.RadioButtonGroup;

	public class PanelType extends Panel
	{
		private var groupe_btn:RadioButtonGroup;
		private var btn_normal:RadioButton;
		private var btn_radial:RadioButton;
		
		public function PanelType()
		{
			super();
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
			
			btn_normal.selected = true;
			
			btn_normal.group = groupe_btn;
			btn_radial.group = groupe_btn;
			vbox.addChild(btn_normal);
			vbox.addChild(btn_radial);
			
			this.addChild(vbox);
		}
		
		
		// accesseur : 
		public function getBtnNormal():RadioButton {return btn_normal; }
		public function getBtnRadial():RadioButton {return btn_radial; }
		
	}
}