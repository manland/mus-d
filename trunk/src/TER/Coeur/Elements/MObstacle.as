package Coeur.Elements {
	
	public class MObstacle extends MElementAEtat {
		
		public function MObstacle(point_degat:int=1) {
			super(100, point_degat);
			setEtatDeplacable(new MEtatIndeplacable(this));
			setEtatDestructible(new MEtatIndestructible(this));
			nom_classe = "MObstacle";
		}
	}
}