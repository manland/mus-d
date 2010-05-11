package Coeur.Elements
{
	import Graphique.MGraphiqueScene;
	
	public class MDeplacement extends MElementAEtat
	{
		private var scene:MGraphiqueScene;
		public function MDeplacement(point_vie:int, point_degat:int, scene:MGraphiqueScene)
		{
			this.scene = scene;
			setEtatDestructible(new MEtatDestructible(this));
			setEtatDeplacable(new MEtatDeplacable(this));
			setPointVie(point_vie);
			setPointDegat(point_degat);
			nom_classe = "MTireur";
		}
		
	}
}