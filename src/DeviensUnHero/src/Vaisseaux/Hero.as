package Vaisseaux {
	import Graphique.MGraphiqueTriangle;
	import Utilitaires.MCoordonnee;
	import Coeur.Elements.MTireurClavier;
	import Graphique.MGraphiqueScene;
	
	
	public class Hero extends MGraphiqueTriangle {
		
		public function Hero() {
			super(new MCoordonnee(0, 0), new MCoordonnee(0, 40), new MCoordonnee(40, 20));
			setFocus();
		}
		
		public function set scene(s:MGraphiqueScene):void {
			setObjet(new MTireurClavier(100, 5, 5, "ouest", 200, s));
			y = 300;
			x = 10;
		}
	}
}