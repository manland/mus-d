package Coeur.Elements {
	import Controleur.MIEcouteurClavier;
	import Controleur.MClavier;
	import Graphique.MGraphiqueScene;
	import Utilitaires.MErreur;
	
	public class MTireurClavier extends MTireur implements MIEcouteurClavier {
		private var direction_projectile:String;
		private var vitesse_projectile:int;
		
		public function MTireurClavier(point_vie:int, point_degat:int, degat_projectile:int=0, direction_projectile:String="est", vitesse_projectile:int=200, scene:MGraphiqueScene=null) {
			super(point_vie, point_degat, degat_projectile, scene);
			this.direction_projectile = direction_projectile;
			this.vitesse_projectile = vitesse_projectile;
			MClavier.getInstance().ajouterEcouteur(this);
			nom_classe = "MTireurClavier";
		}
		
		public function flecheBas():void {
			setY(getY()+1);
		}
		
		public function flecheHaut():void {
			setY(getY()-1);
		}
		
		public function flecheGauche():void {
			setX(getX()-1);
		}
		
		public function flecheDroite():void {
			tirer(direction_projectile, vitesse_projectile);
//			setX(getX()+1);
		}
		
		public function entree():void {
			
		}
		
		public function espace():void {
			
		}
		
		public function touche(touche:uint):void {
			
		}

	}
}