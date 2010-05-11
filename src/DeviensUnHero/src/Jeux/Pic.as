package Jeux {
	import Graphique.MGraphiqueTriangle;
	import Controleur.MMouvementPerpetuel;
	import Graphique.MGraphiqueScene;
	import Coeur.MObjet;
	import Coeur.Elements.MObstacle;
	import Coeur.Elements.MEtatDeplacable;
	import Graphique.MIObjetGraphiqueEcouteur;
	import Utilitaires.MAxe;
	import Graphique.MIObjetGraphique;
	import Utilitaires.MCoordonnee;
	import Utilitaires.MErreur;
	import Coeur.Elements.MElementAEtat;
	import Controleur.MEffet;
	import Controleur.MIEffet;
	import Coeur.Elements.MEtatIndestructible;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import Graphique.Textures.Degrades.MDegrade;
	import Coeur.Elements.MControleMouvementPerpetuel;
	
	
	public class Pic extends MGraphiqueTriangle implements MIObjetGraphiqueEcouteur {
		protected var est_premier:Boolean = true;
		protected var scene:MGraphiqueScene;
		private var mouvement_pic:MMouvementPerpetuel;
		public function Pic(scene:MGraphiqueScene, point1:MCoordonnee, point2:MCoordonnee, point3:MCoordonnee) {
			super(point1, point2, point3);
			this.scene = scene;
			x = 800;
			y = 0;
			width = Math.round(Math.random() * (80 - 50)) + 50;
			height = Math.round(Math.random() * (150 - 50)) + 50;
			mouvement_pic = new MMouvementPerpetuel();
			mouvement_pic.instancieAvecAngleEtVitesse(getObjet(), 180, 500);
			var obstacle:MControleMouvementPerpetuel = new MControleMouvementPerpetuel(100, 1000, 180, 50);
			obstacle.setEtatDestructible(new MEtatIndestructible(obstacle));
			setObjet(obstacle);
			obstacle.lancer();
			ajouterEcouteur(this);
			texture = new MDegrade([0x663300,0xFF6600,0x0],[1,1,1],[100,150,255],SpreadMethod.PAD,InterpolationMethod.LINEAR_RGB,0,GradientType.LINEAR,1.5835670286387575);
		}
		
		public function getMouvement():MIEffet {
			return mouvement_pic;
		}
		
		public function graphiqueSeDessine(graphique:MIObjetGraphique):void {
			
		}
		
		public function graphiqueMeurt(graphique:MIObjetGraphique):void {
			
		}
		
		public function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void {
			
		}
		
		public function graphiqueSeDeplace(graphique:MIObjetGraphique):void {
			if(est_premier) {
				if(x+width < 800) {
					est_premier = false;
					scene.addChild(new Pic(scene, new MCoordonnee(0, 0), new MCoordonnee(20, 0), new MCoordonnee(10, 20)));
				}
			}
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