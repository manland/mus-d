package Vaisseaux {
	import Graphique.MGraphiqueTriangle;
	import Utilitaires.MCoordonnee;
	import Coeur.Elements.MTireurMouvementPerpetuel;
	
	
	public class Ennemis extends MGraphiqueTriangle {
		
		public function Ennemis() {
			super(new MCoordonnee(40, 40), new MCoordonnee(40, 0), new MCoordonnee(0, 20));
			setObjet(new MTireurMouvementPerpetuel(10, 5, 180, 100, 5));
			x = 700;
			y = Math.round(Math.random() * (600 - 0)) + 0;
//			(getObjet() as MTireurMouvementPerpetuel).lancer();
		}

	}
}