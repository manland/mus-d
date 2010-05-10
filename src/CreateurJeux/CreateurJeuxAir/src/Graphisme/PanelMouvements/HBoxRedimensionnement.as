package Graphisme.PanelMouvements
{
	import Graphique.MIObjetGraphique;
	
	import mx.containers.HBox;
	import mx.controls.Label;
	import mx.controls.TextInput;

	public class HBoxRedimensionnement extends HBox
	{
		
		private var largeur_finale:TextInput;
		private var hauteur_finale:TextInput;
		private var temps:TextInput;
		
		public function HBoxRedimensionnement()
		{
			super();
			initialisation();
		}
		
		public function initialisation():void
		{
			// largeur finale : 
			largeur_finale = new TextInput();
			largeur_finale.width = 40;
			largeur_finale.height = 20;
			var label_largeur1:Label = new Label();
			label_largeur1.text = "largeur finale :";
			var hbox_largeur_finale:HBox = new HBox();
			hbox_largeur_finale.addChild(label_largeur1);
			hbox_largeur_finale.addChild(largeur_finale);
			
			hauteur_finale = new TextInput();
			hauteur_finale.width = 40;
			hauteur_finale.height = 20;
			var label_hauteur_finale:Label = new Label();
			label_hauteur_finale.text = "hauteur finale :";
			var hbox_hauteur_finale:HBox = new HBox();
			hbox_hauteur_finale.addChild(label_hauteur_finale);
			hbox_hauteur_finale.addChild(hauteur_finale);
			
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
			
			this.addChild(hbox_largeur_finale);
			this.addChild(hbox_hauteur_finale);
			this.addChild(hbox_temps);
		}
	
		
		
		
		// accesseurs : 
		public function getLargeur():String {return largeur_finale.text;}
		public function getHauteur():String {return hauteur_finale.text;}
		public function getTemps():String {return temps.text;}
		
		public function setLargeur(s:String):void  {largeur_finale.text = s;}
		public function setHauteur(s:String):void  {hauteur_finale.text = s;}
		public function setTemps(s:String):void  {temps.text = s;}
	}
}