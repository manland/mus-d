package Graphisme.PanelMouvements
{
	import mx.containers.HBox;
	import mx.controls.Label;
	import mx.controls.TextInput;
	
	public class HBoxMouvementFini extends HBox
	{
		
		private var x_arrivee:TextInput;
		private var y_arrivee:TextInput;
		private var temps:TextInput;
		
		
		public function HBoxMouvementFini()
		{
			super();
			initialisation();
		}
		
		public function initialisation():void
		{
			// pour le x :
			x_arrivee = new TextInput();
			x_arrivee.width=30;
			x_arrivee.height = 20;
			var label_x:Label = new Label();
			label_x.text = "x d'arrivée :";
			var hbox_x:HBox = new HBox();
			hbox_x.addChild(label_x);
			hbox_x.addChild(x_arrivee);
			
			
			// pour le y :
			y_arrivee = new TextInput();
			y_arrivee.width=30;
			y_arrivee.height = 20;
			var label_y:Label = new Label();
			label_y.text = "y d'arrivée :";
			var hbox_y:HBox = new HBox();
			hbox_y.addChild(label_y);
			hbox_y.addChild(y_arrivee);
			
			// pour le temps  :
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
			
			this.addChild(hbox_x);
			this.addChild(hbox_y);
			this.addChild(hbox_temps);
		}
		
		// accesseurs : 
		public function getXArrivee():String { return x_arrivee.text;}
		public function getYArrivee():String { return y_arrivee.text;}
		public function getTemps():String { return temps.text;}
		
		public function setXArrivee(x:String):void  {x_arrivee.text = x;}
		public function setYArrivee(y:String):void  {y_arrivee.text = y;}
		public function setTemps(t:String):void  {temps.text = t;}
		
		
	}
}