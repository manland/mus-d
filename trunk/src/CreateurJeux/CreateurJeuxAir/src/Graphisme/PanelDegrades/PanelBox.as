package Graphisme.PanelDegrades
{
	import Graphique.MIObjetGraphique;
	import Graphique.Textures.Degrades.MDegrade;
	
	import flash.events.Event;
	
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.HSlider;
	import mx.controls.Label;
	import mx.controls.Spacer;

	public class PanelBox extends Panel
	{
		// point de départ : 
		private var hbox_depart:HBox;
		private var label_point_de_fuite:Label;
		private var point_de_fuite:HSlider;
		
		// angle : 
		private var label_angle:Label;
		private var angle:HSlider;
		
		private var fenetre_degrade:FenetreDegrade;
		
		public function PanelBox(fenetre_degrade:FenetreDegrade)
		{
			super();
			this.fenetre_degrade=fenetre_degrade;
			this.styleName = "stylePanelDegrade";
			this.title = "Box";
			this.width = 145;
			this.height = 105;
			initialisation();
		}
		
		public function initialisation():void
		{
			var vBox:VBox;
			vBox = new VBox();
			
			hbox_depart = new HBox();
			label_point_de_fuite = new Label();
			point_de_fuite = new HSlider();
			label_point_de_fuite.text = "Point de fuite :"
			point_de_fuite.width=50;
			point_de_fuite.height=20;
			point_de_fuite.maximum=1;
			point_de_fuite.minimum = -1;
			point_de_fuite.value=0;
			point_de_fuite.snapInterval = 1;
			point_de_fuite.labels = ['-1','1'];
			point_de_fuite.styleName = "pointDeFuite";
			point_de_fuite.showDataTip=false;
			point_de_fuite.tickInterval=1;
			point_de_fuite.addEventListener(Event.CHANGE,changerPointDeFuite);
			hbox_depart.addChild(label_point_de_fuite);
			hbox_depart.addChild(point_de_fuite);
						
			
			// angle : 
			var vbox_angle:VBox;
			vbox_angle = new VBox();
			label_angle = new Label();
			label_angle.text = "Orientation :";
			angle = new HSlider();
			angle.styleName = "angle";
			angle.width = 135;
			angle.labels = ['0','2π'];
			angle.minimum = 0;
			angle.maximum = 2*Math.PI;
			angle.addEventListener(Event.CHANGE,changerAngle);
			vbox_angle.addChild(label_angle);
			vbox_angle.addChild(angle);
			
			var space:Spacer;
			space = new Spacer();
			space.height=3;
			vBox.addChild(space);
			vBox.addChild(hbox_depart);
			vBox.addChild(vbox_angle);
			this.addChild(vBox);
			
			
		}
		
		public function mettreAJour(obj:MIObjetGraphique):void
		{
			angle.value = ((MDegrade)(obj.getTexture())).getBoxRotation();
			point_de_fuite.value =  ((MDegrade)(obj.getTexture())).getFocalPtRatio();
			fenetre_degrade.getRendu().redessiner();
		}
		
		public function changerAngle(event:Event):void
		{
			fenetre_degrade.getDegrade().setBoxRotation(angle.value);
			fenetre_degrade.getRendu().redessiner();
			
		}
		
		public function changerPointDeFuite(event:Event):void
		{
			fenetre_degrade.getDegrade().setFocalPtRatio(point_de_fuite.value);
			fenetre_degrade.getRendu().redessiner();
		}
		
	}
}