package PanelOptions
{
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.controls.Label;
	import mx.controls.TextArea;

	public class OptionsObjetDynamique extends Panel
	{
		private var hBox_position:HBox;
		private var label_x:Label;
		private var label_y:Label;
		private var text_aera_x:TextArea;
		private var text_aera_y:TextArea;
		
		public function OptionsObjetDynamique()
		{
			super();
			this.layout="vertical";
			this.title="Options Objet Dynamique";
			initialisation();
		}
		
		public function initialisation():void
		{
			hBox_position=new HBox();
			label_x= new Label();
			label_y=new Label();
			text_aera_x=new TextArea();
			text_aera_y=new TextArea();
			
			label_x.text="x :";
			label_y.text="y :";
			
			text_aera_x.id="xPos";
			text_aera_x.id="yPos";
			
			hBox_position.addChild(label_x);
			hBox_position.addChild(text_aera_x);
			hBox_position.addChild(label_y);
			hBox_position.addChild(text_aera_y);
			
			
			
		}
		
	}
}