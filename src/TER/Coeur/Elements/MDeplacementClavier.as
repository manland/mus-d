package Coeur.Elements
{
	import Controleur.MClavier;
	import Controleur.MIEcouteurClavier;
	
	import Graphique.MGraphiqueScene;

	public class MDeplacementClavier extends MDeplacement implements MIEcouteurClavier
	{
		public function MDeplacementClavier(point_vie:int, point_degat:int, scene:MGraphiqueScene)
		{
			super(point_vie, point_degat, scene);
			MClavier.getInstance().ajouterEcouteur(this);
			nom_classe = "MDeplacementClavier";
		}
		
		public function flecheBas():void
		{
			setY(getY()+1);
		}
		
		public function flecheHaut():void
		{
			setY(getY()-1);
		}
		
		public function flecheGauche():void
		{
			setX(getX()-1);
		}
		
		public function flecheDroite():void
		{
			setX(getX()+1);
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
		
	}
}