package Fabrique {
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Coeur.Elements.MElementAEtat;
	import Graphique.MIObjetGraphique;
	import Coeur.Elements.MProjectile;
	
	
	public class MFabriqueProjectileRond extends MFabriqueAbstraiteProjectile implements MIFabriqueProjectile {
		
		public function MFabriqueProjectileRond(point_vie:int, point_degat:int, angle:Number, vitesse:Number, scene:MGraphiqueScene) {
			super(point_vie, point_degat, angle, vitesse, scene);
		}
		
		public function creer(tireur:MElementAEtat):MIObjetGraphique {
			var res:MIObjetGraphique = new MGraphiqueRond(0, 0, 10, 10);
			res.setObjet(new MProjectile(point_vie, point_degat, tireur, angle, vitesse, res, scene));
			return res;
		}
	}
}