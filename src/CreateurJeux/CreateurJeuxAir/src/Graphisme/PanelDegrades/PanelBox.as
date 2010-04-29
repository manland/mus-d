package Graphisme.PanelDegrades
{
	import mx.containers.HBox;
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.Label;
	import mx.controls.TextArea;

	public class PanelBox extends Panel
	{
		// point de départ : 
		private var hbox_depart:HBox;
		private var label_point_de_depart:Label;
		private var point_de_depart:TextArea;
		
		// hauteur:
		private var hbox_hauteur:HBox;
		private var label_hauteur:Label;
		private var hauteur:TextArea;
		
		// largeur: 
		private var hbox_largeur:HBox;
		private var label_largeur:Label;
		private var largeur:TextArea;
		
		public function PanelBox()
		{
			super();
			this.styleName = "stylePanelDegrade";
			this.title = "Box";
			this.width = 135;
			this.height = 100;
			initialisation();
		}
		
		public function initialisation():void
		{
			var vBox:VBox;
			vBox = new VBox();
			
			hbox_depart = new HBox();
			label_point_de_depart = new Label();
			point_de_depart = new TextArea();
			label_point_de_depart.text = "Point de départ :"
			point_de_depart.width=30;
			point_de_depart.height=20;
			hbox_depart.addChild(label_point_de_depart);
			hbox_depart.addChild(point_de_depart);
			
			// hauteur : 
			hbox_hauteur = new HBox();
			label_hauteur = new Label();
			label_hauteur.text = "Hauteur :";
			hauteur = new TextArea();
			hauteur.width = 30;
			hauteur.height=20;
			
			hbox_hauteur.addChild(label_hauteur);
			hbox_hauteur.addChild(hauteur);
			
			// largeur : 
			hbox_largeur = new HBox();
			label_largeur = new Label();
			label_largeur.text = "Largeur :";
			largeur = new TextArea();
			largeur.width = 30;
			largeur.height=20;
			
			hbox_largeur.addChild(label_largeur);
			hbox_largeur.addChild(largeur);
			
			vBox.addChild(hbox_depart);
			vBox.addChild(hbox_hauteur);
			vBox.addChild(hbox_largeur);
			this.addChild(vBox);
			
		}
		
		// accesseur : 
		
	}
}