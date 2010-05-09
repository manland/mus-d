package Coeur.Elements {
	import Controleur.MIEcouteurSouris;
	import Controleur.MSouris;
	import flash.events.MouseEvent;
	import Graphique.MGraphiqueScene;
	
	
	public class MTireurSouris extends MTireur implements MIEcouteurSouris {
		private var direction_projectile:String;
		private var vitesse_projectile:int;
		
		public function MTireurSouris(point_vie:int, point_degat:int, degat_projectile:int=0, direction_projectile:String="est", vitesse_projectile:int=200, scene:MGraphiqueScene=null) {
			super(point_vie, point_degat, degat_projectile, scene);
			this.direction_projectile = direction_projectile;
			this.vitesse_projectile = vitesse_projectile;
			MSouris.getInstance().ajouterEcouteur(this);
			nom_classe = "MTireurSouris";
		}
		
		public function clic(e:MouseEvent):void {
			tirer(direction_projectile, vitesse_projectile);
		}
		
		public function doubleClic(e:MouseEvent):void {
			
		}
		
		public function bougeDroite():void {
			setX(getX()+1);
		}
		
		public function bougeGauche():void {
			setX(getX()-1);
		}
		
		public function bougeHaut():void {
			setY(getY()-1);
		}
		
		public function bougeBas():void {
			setY(getY()+1);
		}
	}
}