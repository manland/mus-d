package Vaisseaux {
	import Graphique.MGraphiqueTriangle;
	import Utilitaires.MCoordonnee;
	import Controleur.MMouvementCirculairePerpetuel;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphiqueEcouteur;
	import Graphique.MIObjetGraphique;
	import Utilitaires.MAxe;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import Graphique.Textures.Degrades.MDegrade;
	import Coeur.MJeu;
	import Graphique.Textures.MTexte;
	import Coeur.MScore;
	import Coeur.Elements.MControleMouvementPerpetuel;
	import Coeur.Elements.ElementsAActions.MTireur;
	import Fabrique.MFabriqueProjectileRectangle;
	import Utilitaires.MErreur;
	
	
	public class Ennemis extends MGraphiqueTriangle implements MIObjetGraphiqueEcouteur {
		private var scene:MGraphiqueScene;
		
		public function Ennemis(scene:MGraphiqueScene) {
			super(new MCoordonnee(40, 40), new MCoordonnee(40, 0), new MCoordonnee(0, 20));
			this.scene = scene;
			texture = new MDegrade([0xFF0000,0xFF6600,0xFFFF00],[1,1,1],[100,150,255],SpreadMethod.PAD,InterpolationMethod.LINEAR_RGB,0,GradientType.LINEAR,0);
			var ennemis:MControleMouvementPerpetuel = new MControleMouvementPerpetuel(10, 5, 180, 100);
			ennemis.ajouterElementAAction(new MTireur(ennemis, "tirer", new MFabriqueProjectileRectangle(1, 5, 180, 200, scene)));
			setObjet(ennemis);
			x = 800;
			y = Math.round(Math.random() * (550 - 50)) + 50;
			ennemis.lancer();
			ajouterEcouteur(this);
		}
		
		public function graphiqueSeDessine(graphique:MIObjetGraphique):void {
			
		}
		
		public function graphiqueMeurt(graphique:MIObjetGraphique):void {
			scene.addChild(new Ennemis(scene));
			MJeu.getInstance().augmenterScore(0, 1);
			(scene.getTexture().getADecorer() as MTexte).getLabel().text = "Score : "+(MJeu.getInstance().getScores()[0] as MScore).getTotal();
		}
		
		public function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void {
			
		}
		
		public function graphiqueSeDeplace(graphique:MIObjetGraphique):void {
			if(x+width < 0) {
				mourir();
			}
		}
		
		public function graphiqueChangeTaille(graphique:MIObjetGraphique):void {
			
		}
		
		public function debutDuJeuGraphique(graphique:MIObjetGraphique):void {
			
		}
		
		public function finDuJeuGraphique(graphique:MIObjetGraphique):void {
			
		}

	}
}