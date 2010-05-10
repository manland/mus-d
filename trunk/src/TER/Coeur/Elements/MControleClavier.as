package Coeur.Elements {
	import Controleur.MClavier;
	import Controleur.MIEcouteurClavier;
	
	
	public class MControleClavier extends MElementAEtat implements MIEcouteurClavier {
		
		public function MControleClavier(point_vie:int, point_degat:int) {
			super(point_vie, point_degat);
			MClavier.getInstance().ajouterEcouteur(this);
			nom_classe = "MControleClavier";
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
			setX(getX()+1);
		}
		
		public function entree():void {}
		
		public function espace():void {}
		
		public function touche(touche:uint):void {}
	}
}