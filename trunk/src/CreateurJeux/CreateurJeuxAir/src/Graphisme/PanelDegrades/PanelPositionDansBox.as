package Graphisme.PanelDegrades
{
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.Label;
	import mx.controls.TextArea;

	public class PanelPositionDansBox extends Panel
	{
		
		// position x :
		private var hbox_posX:HBox;
		private var label_posX:Label;
		private var posX:TextArea;
		
		// position y :
		private var hbox_posY:HBox;
		private var label_posY:Label;
		private var posY:TextArea;
		
		public function PanelPositionDansBox()
		{
			super();
			this.styleName = "stylePanelDegrade";
			this.title="Positionnement";
			this.width = 114;
			this.height = 100;
			initialisation();
		}
		
		public function initialisation():void
		{
			var vBox:VBox;
			vBox = new VBox();
			
			hbox_posX = new HBox();
			label_posX = new Label();
			label_posX.text = "Position X : ";
			posX = new TextArea();
			posX.width = 30;
			posX.height=20;
			hbox_posX.addChild(label_posX);
			hbox_posX.addChild(posX);
			
			hbox_posY = new HBox();
			label_posY = new Label();
			label_posY.text = "Position Y : ";
			posY = new TextArea();
			posY.width = 30;
			posY.height=20;
			hbox_posY.addChild(label_posY);
			hbox_posY.addChild(posY);
			
			vBox.addChild(hbox_posX);
			vBox.addChild(hbox_posY);
			
			this.addChild(vBox);
		}
		
	}
}