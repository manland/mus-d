package Coeur.Elements {
	import Controleur.MMouvementPerpetuel;
	import Graphique.MGraphiqueScene;
	
	public class MTireurMouvementPerpetuel extends MTireur {
		private var direction_projectile:String;
		private var vitesse_projectile:int;
		private var mouvement:MMouvementPerpetuel;
		
		public function MTireurMouvementPerpetuel(point_vie:int, point_degat:int, angle_depart_mouvement:int, vitesse_deplacement:int, degat_projectile:int=0, scene:MGraphiqueScene=null) {
			super(point_vie, point_degat, degat_projectile, scene);
			setEtatDestructible(new MEtatDestructibleTireurMouvementPerpetuel(this));
			mouvement = new MMouvementPerpetuel();
			mouvement.instancieAvecAngleEtVitesse(this, angle_depart_mouvement, vitesse_deplacement);
			nom_classe = "MTireurMouvementPerpetuel";
		}
		
		public function lancer():void {
			mouvement.lancer();
		}
		
		public function stop():void {
			mouvement.stopper();
		}

	}
}