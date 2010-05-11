package Coeur.Elements {
	import Controleur.MClavier;
	import Controleur.MIEcouteurClavier;
	
	public class MControleClavier extends MElementAEtat implements MIEcouteurClavier {
		private var droite_avancer_de:int=1;
		private var gauche_avancer_de:int=1;
		private var bas_avancer_de:int=1;
		private var haut_avancer_de:int=1;
		public function MControleClavier(point_vie:int, point_degat:int) {
			super(point_vie, point_degat);
			MClavier.getInstance().ajouterEcouteur(this);
			nom_classe = "MControleClavier";
		}
		
		public function flecheBas():void {
			setY(getY()+bas_avancer_de);
		}
		
		public function flecheHaut():void {
			setY(getY()-haut_avancer_de);
		}
		
		public function flecheGauche():void {
			setX(getX()-gauche_avancer_de);
		}
		
		public function flecheDroite():void {
			setX(getX()+droite_avancer_de);
		}
		
		public function entree():void {}
		
		public function espace():void {}
		
		public function touche(touche:uint):void {}
	}
}