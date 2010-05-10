package Coeur.Elements {
	import Controleur.MMouvementPerpetuel;
	
	
	public class MControleMouvementPerpetuel extends MElementAEtat {
		private var mouvement:MMouvementPerpetuel;
		
		public function MControleMouvementPerpetuel(point_vie:int, point_degat:int, angle_depart_mouvement:Number, vitesse_deplacement:Number) {
			super(point_vie, point_degat);
			setEtatDestructible(new MEtatDestructibleTireurMouvementPerpetuel(this));
			mouvement = new MMouvementPerpetuel();
			mouvement.instancieAvecAngleEtVitesse(this, angle_depart_mouvement, vitesse_deplacement);
			nom_classe = "MControleMouvementPerpetuel";
		}
		
		public function lancer():void {
			mouvement.lancer();
		}
		
		public function stop():void {
			mouvement.stopper();
		}
	}
}