package Fabrique {
	import Graphique.MIObjetGraphique;
	import Graphique.MGraphiqueRectangle;
	import Graphique.MGraphiqueScene;
	import Coeur.Elements.MProjectile;
	import Coeur.Elements.ElementsAActions.MTireur;
	import mx.effects.easing.Elastic;
	import Coeur.Elements.MElementAEtat;
	
	
	public class MFabriqueProjectileRectangle extends MFabriqueAbstraiteProjectile implements MIFabriqueProjectile {
		
		public function MFabriqueProjectileRectangle(point_vie:int, point_degat:int, angle:Number, vitesse:Number, scene:MGraphiqueScene) {
			super(point_vie, point_degat, angle, vitesse, scene);
		}
		
		public function creer(tireur:MElementAEtat):MIObjetGraphique {
			var res:MIObjetGraphique = new MGraphiqueRectangle();
			res.setObjet(new MProjectile(point_vie, point_degat, tireur, angle, vitesse, res, scene));
			return res;
		}
	}
}