package Graphisme.PanelDegrades
{
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
		
		
		public function PanelSpreadMethod()
		{
			super();
			this.title = "SpreadMethod";
			this.width=105;
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
		
	}
}