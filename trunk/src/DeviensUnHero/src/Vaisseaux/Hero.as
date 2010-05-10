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
	import Graphique.Textures.MImage;
	import Graphique.Textures.Degrades.MDegradeVertical;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import Graphique.Textures.Degrades.MDegrade;
	
	
	public class Hero extends MGraphiqueTriangle {
		
		public function Hero() {
			super(new MCoordonnee(0, 0), new MCoordonnee(0, 40), new MCoordonnee(40, 20));
			setFocus();
			texture=new MDegrade([0xFFCC,0x66CC,0xCC],[1,1,1],[100,150,255],SpreadMethod.PAD,InterpolationMethod.LINEAR_RGB,0,GradientType.LINEAR,0);
			x=200;
			y=200;
		}
		
		public function set scene(s:MGraphiqueScene):void {
			setObjet(new MTireurClavier(100, 5, 5, "est", 200, s));
			y = 300;
			x = 10;
		}
	}
}