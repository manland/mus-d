package Fabrique {
	import Graphique.MIObjetGraphique;
	import Graphique.MGraphiqueRectangle;
	import Coeur.Elements.MElementAEtat;
	
	
	public class MFabriqueElementAEtatRectangle extends MFabriqueAbstraiteElementAEtat implements MIFabrique {
		
		public function MFabriqueElementAEtatRectangle(point_vie:int, point_degat) {
			super(point_vie, point_degat);
		}
		
		public function creer():MIObjetGraphique {
			var res:MIObjetGraphique = new MGraphiqueRectangle();
			res.setObjet(new MElementAEtat(point_vie, point_degat));
			return res;
		}

	}
}