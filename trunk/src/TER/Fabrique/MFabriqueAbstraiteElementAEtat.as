package Fabrique {
	import Utilitaires.MErreur;
	import Graphique.MIObjetGraphique;
	
	
	public class MFabriqueAbstraiteElementAEtat {
		protected var point_vie:int;
		protected var point_degat:int;
		
		public function MFabriqueAbstraiteElementAEtat(point_vie:int, point_degat:int) {
			if((this as MIFabrique) == null) {
				throw new MErreur("MFabriqueAbstraiteProjectile", "constructeur", "Classe abstraite. Merci d'utiliser une sous classe.");
			}
			this.point_vie = point_vie;
			this.point_degat = point_degat;
		}
	}
}