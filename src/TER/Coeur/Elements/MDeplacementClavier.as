package Coeur.Elements
{
	import Controleur.MClavier;
	import Controleur.MIEcouteurClavier;
	
	import Graphique.MGraphiqueScene;

	public class MDeplacementClavier extends MDeplacement implements MIEcouteurClavier
	{
		private var valeur:Number;
		private var derniere_action:String;
		public function MDeplacementClavier(point_vie:int, point_degat:int, scene:MGraphiqueScene)
		{
			super(point_vie, point_degat, scene);
			MClavier.getInstance().ajouterEcouteur(this);
			nom_classe = "MDeplacementClavier";
			this.valeur = 5;
		}
		
		public function flecheBas():void
		{
			this.derniere_action = "flecheBas";
			setY(getY()+valeur);
		}
		
		public function flecheHaut():void
		{
			this.derniere_action = "flecheHaut";
			setY(getY()-valeur);
		}
		
		public function flecheGauche():void
		{
			this.derniere_action = "flecheGauche";
			setX(getX()-valeur);
		}
		
		public function flecheDroite():void
		{
			this.derniere_action = "flecheDroite";
			setX(getX()+valeur);
		}
		
		public function entree():void
		{
		}
		
		public function espace():void
		{
		}
		
		public function touche(touche:uint):void
		{
		}
		
		public function annuler():void{
			if(derniere_action == "flecheBas"){
				this.flecheHaut();
			}
			else if(derniere_action == "flecheHaut"){
				this.flecheBas();
			}
			else if(derniere_action == "flecheGauche"){
				this.flecheDroite();
			}
			else if(derniere_action == "flecheDroite"){
				this.flecheGauche();
			}
			
			
		}
		
	}
}