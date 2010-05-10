package Jeux {
	import Utilitaires.MCoordonnee;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	
	
	public class PicBas extends Pic {
		
		public function PicBas(scene:MGraphiqueScene) {
			super(scene, new MCoordonnee(10, 0), new MCoordonnee(0, 20), new MCoordonnee(20, 20));
			y = 600-height;
		}
		
		override public function graphiqueSeDeplace(graphique:MIObjetGraphique):void {
			if(est_premier) {
				if(x+width < 800) {
					est_premier = false;
					scene.addChild(new PicBas(scene));
				}
			}
			if(x+width < 0) {
				mourir();
			}
		}

	}
}