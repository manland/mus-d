package Fabrique {
	import Graphique.MIObjetGraphique;
	import Utilitaires.MErreur;
	import Graphique.MGraphiqueScene;
	import Coeur.Elements.MProjectile;
	import Coeur.Elements.ElementsAActions.MTireur;
	import Coeur.Elements.MElementAEtat;
	
	
	public class MFabriqueAbstraiteProjectile {
		protected var point_vie:int;
		protected var point_degat:int;
		protected var angle:Number;
		protected var vitesse:Number;
		protected var scene:MGraphiqueScene;
		
		public function MFabriqueAbstraiteProjectile(point_vie:int, point_degat:int, angle:Number, vitesse:Number, scene:MGraphiqueScene) {
			//rendre abstraite avec MIFabrique --> function creer:MIObjetGraphique
			this.point_vie = point_vie;
			this.point_degat = point_degat;
			this.angle = angle;
			this.vitesse = vitesse;
			this.scene = scene;
		}
		
		public function creer(tireur:MElementAEtat):MIObjetGraphique {
			throw new MErreur("MFabriqueAbstraiteProjectile", "creer", "fonction abstraite");
			return null;
		}

	}
}