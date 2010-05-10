package Coeur.Elements {
	import flash.events.MouseEvent;
	import Controleur.MSouris;
	import Controleur.MIEcouteurSouris;
	
	
	public class MControleSouris extends MElementAEtat implements MIEcouteurSouris {
		
		public function MControleSouris(point_vie:int, point_degat:int) {
			super(point_vie, point_degat);
			MSouris.getInstance().ajouterEcouteur(this);
			nom_classe = "MControleSouris";
		}
		
		public function clic(e:MouseEvent):void {
			
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