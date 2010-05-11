package Vaisseaux {
	import Graphique.MGraphiqueTriangle;
	import Utilitaires.MCoordonnee;
	import Graphique.MGraphiqueScene;
	import Controleur.MMouvementCirculairePerpetuel;
	import Controleur.MMouvementCirculaireFini;
	import Controleur.MRotationPerpetuelle;
	import Graphique.MGraphiqueEtoile;
	import Graphique.MGraphiqueRectangle;
	import Graphique.Textures.MImage;
	import Graphique.Textures.Degrades.MDegradeVertical;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import Graphique.Textures.Degrades.MDegrade;
	import Coeur.Elements.MControleClavier;
	import Coeur.Elements.ElementsAActions.MTireur;
	import Fabrique.MFabriqueProjectileRectangle;
	import Controleur.MIEcouteurClavier;
	import Controleur.MClavier;
	import Controleur.action.MSaut;
	import Coeur.Elements.ElementsAActions.MSauteur;
	import Fabrique.MFabriqueProjectileRond;
	import Graphique.MGraphiqueRond;
	import Fabrique.MFabriqueProjectileEtoile;
	import Coeur.Elements.ElementsAActions.MElementAccroupi;
	
	
	public class Hero extends MGraphiqueTriangle implements MIEcouteurClavier {
		private var mouv:MRotationPerpetuelle;
		private var controle_clavier:MControleClavier;
		public function Hero() {
			super(new MCoordonnee(0, 0), new MCoordonnee(0, 40), new MCoordonnee(40, 20));
			setFocus();
			texture=new MDegrade([0xFFCC,0x66CC,0xCC],[1,1,1],[100,150,255],SpreadMethod.PAD,InterpolationMethod.LINEAR_RGB,0,GradientType.LINEAR,0);
			x=10;
			y=300;
			MClavier.getInstance().ajouterEcouteur(this);
		}
		
		public function set scene(s:MGraphiqueScene):void {
			controle_clavier = new MControleClavier(100, 5);
			controle_clavier.ajouterElementAAction(new MTireur(controle_clavier, "tirer", new MFabriqueProjectileEtoile(1, 5, 0, 200, s))); 
			controle_clavier.ajouterElementAAction(new MSauteur(controle_clavier, "saut", 30, 1000)); 
			setObjet(controle_clavier);
		}
		
		public function flecheBas():void {
			y = (y+5);
		}
		
		public function flecheHaut():void {
			y = (y-5);
		}
		
		public function flecheGauche():void {
			x = (x-5);
		}
		
		public function flecheDroite():void {
			x = (x+5);
		}
		public function entree():void {controle_clavier.lancerAction("saut")}
		public function espace():void {controle_clavier.lancerAction("tirer")}
		public function touche(touche:uint):void {}
	}
}