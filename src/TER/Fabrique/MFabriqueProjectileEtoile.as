package Fabrique {
	import Graphique.MGraphiqueEtoile;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Coeur.Elements.MElementAEtat;
	import Coeur.Elements.MProjectile;
	
	
	public class MFabriqueProjectileEtoile extends MFabriqueAbstraiteProjectile implements MIFabriqueProjectile {
		
		public function MFabriqueProjectileEtoile(point_vie:int, point_degat:int, angle:Number, vitesse:Number, scene:MGraphiqueScene) {
			super(point_vie, point_degat, angle, vitesse, scene);
		}
		
		public function creer(tireur:MElementAEtat):MIObjetGraphique {
			var res:MIObjetGraphique = new MGraphiqueEtoile(0, 0, 20, 20);
			res.setObjet(new MProjectile(point_vie, point_degat, tireur, angle, vitesse, res, scene));
			return res;
		}

	}
}