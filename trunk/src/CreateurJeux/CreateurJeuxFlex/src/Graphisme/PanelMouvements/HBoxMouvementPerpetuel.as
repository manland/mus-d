package Graphisme.PanelMouvements
{
	import mx.containers.HBox;
	import mx.controls.HSlider;
	import mx.controls.Label;
	import mx.controls.TextInput;

	public class HBoxMouvementPerpetuel extends HBox
	{
		private var angle:HSlider;
		private var vitesse:TextInput;
		
		public function HBoxMouvementPerpetuel()
		{
			super();
			initialisation();
		}
		
		public function initialisation():void
		{
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
			
			vitesse = new TextInput();
			vitesse.width = 40;
			vitesse.height = 20;
			var label_vitesse:Label = new Label();
			label_vitesse.text = "vitesse";
			var hbox_vitesse:HBox = new HBox();
			hbox_vitesse.addChild(label_vitesse);
			hbox_vitesse.addChild(vitesse);
			
			this.addChild(hbox_angle);
			this.addChild(hbox_vitesse);
		}
		
		// accesseur : 
		public function getAngle():String {
		var str:String = angle.value.toString();
		var new_str:String = str.substr(0,6);
		return new_str;}
		
		public function getVitesse():String {return vitesse.text;}
		
		public function setAngle(n:Number):void {angle.value = n;}
		public function setVitesse(s:String):void {vitesse.text = s;}
		
	}
}