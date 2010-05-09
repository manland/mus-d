package Vaisseaux {
	import Graphique.MGraphiqueTriangle;
	import Utilitaires.MCoordonnee;
	import Coeur.Elements.MTireurClavier;
	import Graphique.MGraphiqueScene;
	import Controleur.MMouvementCirculairePerpetuel;
	import Controleur.MMouvementCirculaireFini;
	import Controleur.MRotationPerpetuelle;
	import Graphique.MGraphiqueEtoile;
	import Coeur.Elements.MTireurSouris;
	import Graphique.MGraphiqueRectangle;
	
	
	public class Hero extends MGraphiqueRectangle {
		
		public function Hero() {
//			super(new MCoordonnee(0, 0), new MCoordonnee(0, 40), new MCoordonnee(40, 20));
			setFocus();
			x=200;
			y=200;
		}
		
		public function set scene(s:MGraphiqueScene):void {
			setObjet(new MTireurSouris(100, 5, 5, "est", 200, s));
			y = 300;
			x = 10;
		}
	}
}