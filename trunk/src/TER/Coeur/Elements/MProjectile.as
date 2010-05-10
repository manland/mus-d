package Coeur.Elements {
	import Controleur.MMouvementPerpetuel;
	import Coeur.MIObjet;
	import Utilitaires.MErreur;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	
	public class MProjectile extends MElementAEtat {
		protected var mouvement:MMouvementPerpetuel;
		protected var tireur:MIObjet;
		protected var angle:Number;
		protected var vitesse:Number;
		protected var mon_graphique:MIObjetGraphique;
		protected var scene:MGraphiqueScene;
		
		public function MProjectile(point_vie:int, point_degat:Number, tireur:MIObjet, angle:Number, vitesse:Number, mon_graphique:MIObjetGraphique, scene:MGraphiqueScene) {
			super(point_vie, point_degat);
			setEtatDestructible(new MEtatDestructibleProjectile(this));
			setEtatDeplacable(new MEtatDeplacable(this));
			this.tireur = tireur;
			this.angle = angle;
			this.vitesse = vitesse;
			this.mon_graphique = mon_graphique;
			this.scene = scene;
			mouvement = new MMouvementPerpetuel();
			nom_classe = "MProjectile";
		}
		
		public function getAngle():Number {
			return angle;
		}
		
		public function lancer():void {
			mouvement.instancieAvecAngleEtVitesse(this, angle, vitesse);
			scene.addChild(mon_graphique.getGraphique());
			mouvement.lancer();
		}
		
		public function stopper():void {
			mouvement.stopper();
		}
	}
}