package Fabrique {
	import Graphique.MIObjetGraphique;
	import Graphique.MGraphiqueRectangle;
	import Coeur.Elements.MObstacle;
	
	
	public class MFabriqueObstacleRectangle extends MFabriqueAbstraiteObstacle implements MIFabrique {
		
		public function MFabriqueObstacleRectangle(point_degat:int) {
			super(point_degat);
		}
		
		public function creer():MIObjetGraphique {
			var res:MGraphiqueRectangle = new MGraphiqueRectangle();
			res.setObjet(new MObstacle(point_degat));
			return res;
		}

	}
}