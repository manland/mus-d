package Coeur.Elements {
	
	public class MObstacle extends MElementAEtat {
		
		public function MObstacle() {
			setEtatDeplacable(new MEtatIndeplacable(this));
			setEtatDestructible(new MEtatIndestructible(this));
			nom_classe = "MObstacle";
		}
	}
}