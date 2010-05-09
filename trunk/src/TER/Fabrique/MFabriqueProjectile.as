package Fabrique {
	import Graphique.MIObjetGraphique;
	import Graphique.MGraphiqueRectangle;
	import Coeur.Elements.MProjectile;
	import Coeur.MIObjet;
	
	
	public class MFabriqueProjectile {
		
		static public function MFabriqueProjectileRectangle(tireur:MIObjet, direction:String):MIObjetGraphique {
			var res:MIObjetGraphique = new MGraphiqueRectangle(tireur.getX(), tireur.getY());
			res.setObjet(new MProjectile(tireur, direction));
			return res;
		}

	}
}