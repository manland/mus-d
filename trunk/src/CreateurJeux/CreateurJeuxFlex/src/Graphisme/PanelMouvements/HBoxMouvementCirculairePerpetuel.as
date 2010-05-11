package Graphisme.PanelMouvements
{
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.Label;
	import mx.controls.TextInput;
	
	public class HBoxMouvementCirculairePerpetuel extends HBox
	{
		private var centre_x:TextInput;
		private var centre_y:TextInput;
		private var tour_par_seconde:TextInput;

		public function HBoxMouvementCirculairePerpetuel()
		{
			super();
			initialisation();
		}
	
		public function initialisation():void
		{
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
			
			tour_par_seconde = new TextInput();
			tour_par_seconde.width = 30;
			tour_par_seconde.height = 20;
			var label_tour:Label = new Label();
			label_tour.text = "tours par secondes :";
			var hbox_tour:HBox = new HBox();
			hbox_tour.addChild(label_tour);
			hbox_tour.addChild(tour_par_seconde);
			
			this.addChild(hbox_x);
			this.addChild(hbox_y);
			this.addChild(hbox_tour);
		}
		
		
		// accesseurs : 
		public function getCentreX():String {return centre_x.text;}
		public function getCentreY():String {return centre_y.text;}
		public function getTourParSeconde():String {return tour_par_seconde.text;}
		
		public function setCentreX(s:String):void {centre_x.text = s;}
		public function setCentreY(s:String):void {centre_y.text = s;}
		public function setTourParSeconde(s:String):void {tour_par_seconde.text = s;}
	}
}