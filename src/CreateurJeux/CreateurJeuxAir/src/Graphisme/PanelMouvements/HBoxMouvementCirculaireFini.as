package Graphisme.PanelMouvements
{
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.HSlider;
	import mx.controls.Label;
	import mx.controls.TextInput;

	public class HBoxMouvementCirculaireFini extends HBox
	{
		
		private var centre_x:TextInput;
		private var centre_y:TextInput;
		private var angle:HSlider;
		private var temps:TextInput;
		
		
		public function HBoxMouvementCirculaireFini()
		{
			super();
			initialisation();
		}
		
		public function initialisation():void
		{
			var vbox_coordonnees:VBox = new VBox();
			centre_x = new TextInput();
			centre_x.width=30;
			centre_x.height=20;
			var label_centre_x:Label = new Label();
			label_centre_x.text = "centre x : ";
			var hbox_x:HBox = new HBox();
			hbox_x.addChild(label_centre_x);
			hbox_x.addChild(centre_x);
			
			centre_y = new TextInput();
			centre_y.width=30;
			centre_y.height=20;
			var label_centre_y:Label = new Label();
			label_centre_y.text = "centre y : ";
			var hbox_y:HBox = new HBox();
			hbox_y.addChild(label_centre_y);
			hbox_y.addChild(centre_y);
			
			vbox_coordonnees.addChild(hbox_x);
			vbox_coordonnees.addChild(hbox_y);
			
			// angle : 
			angle = new HSlider();
			angle.minimum= 0;
			angle.maximum= 360;
			angle.width = 100;
			angle.height = 20;
			angle.labels =  ['0','360'];
			angle.showDataTip = true;
			angle.tickInterval=100;
			angle.styleName = "hSliderAngle";		
			var label_angle:Label = new Label();
			label_angle.text = "angle";
			var hbox_angle:HBox = new HBox();
			hbox_angle.addChild(label_angle);
			hbox_angle.addChild(angle);

			// temps			
			temps = new TextInput();
			temps.width = 30;
			temps.height = 20;
			var label_temps:Label = new Label();
			label_temps.text = "temps :";
			var hbox_temps:HBox = new HBox();
			var label_unite_temps:Label = new Label();
			label_unite_temps.text = "ms";
			hbox_temps.addChild(label_temps);
			hbox_temps.addChild(temps);
			hbox_temps.addChild(label_unite_temps);
			
			
			this.addChild(vbox_coordonnees);
			this.addChild(hbox_angle);
			this.addChild(hbox_temps);
		}
		
		
		// accesseur : 
		public function getAngle():Number {return angle.value;}
		public function getCentreX():String {return centre_x.text;}
		public function getCentreY():String {return centre_y.text;}
		public function getTemps():String {return temps.text;}
		
		public function setAngle(s:Number):void { angle.value=s;}
		public function setCentreX(s:String):void {centre_x.text = s;}
		public function setCentreY(s:String):void {centre_y.text = s;}
		public function setTemps(s:String):void {temps.text = s;}
		
	}
}