package Fabrique {
	import Graphique.MIObjetGraphique;
	import Utilitaires.MErreur;
	
	
	public class MFabriqueAbstraiteObstacle {
		protected var point_degat:int;
		
		public function MFabriqueAbstraiteObstacle(point_degat:int=0) {
			if((this as MIFabrique) == null) {
				throw new MErreur("MFabriqueAbstraiteProjectile", "constructeur", "Classe abstraite. Merci d'utiliser une sous classe.");
			}
			this.point_degat = point_degat;
		}
	}
}