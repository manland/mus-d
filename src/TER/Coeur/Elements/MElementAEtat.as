package Coeur.Elements {
	import flash.geom.Point;
	import Coeur.MElement;
	import Coeur.MIObjet;
	import Utilitaires.MAxe;
	
	
	public class MElementAEtat extends MElement {
		
		private var point_degat:int;
		private var point_vie:int;
		private var etat_destruction:MIEtatDestructible;
		private var etat_deplacable:MIEtatDeplacable;
		private var etat_redimensionnable:MIEtatRedimensionnable;
		
		public function MElementAEtat() {
			point_degat = 0;
			point_vie = 1;
			etat_destruction = new MEtatDestructible(this);
			etat_deplacable = new MEtatDeplacable(this);
			etat_redimensionnable = null;
			nom_classe = "MElementAEtat";
		}
		
		public function getPointDegat():int {
			return point_degat;
		}
		
		public function setPointDegat(point_degat:int):void {
			this.point_degat = point_degat;
		}
		
		public function getPointVie():int {
			return point_vie;
		}
		
		public function setPointVie(point_vie:int):void {
			this.point_vie = point_vie;
		}
		
		public function estDestructible():Boolean {
			return (etat_destruction as MEtatDestructible) != null;
		}
		
		public function setEstDestructible(est_destructible:Boolean):void {
			if(est_destructible) {
				etat_destruction = new MEtatDestructible(this);
			}
			else {
				etat_destruction = new MEtatIndestructible(this);
			}
		}
		
		public function getEtatDestructible():MIEtatDestructible {
			return etat_destruction;
		}
		
		public function setEtatDestructible(etat_destructible:MIEtatDestructible):void {
			this.etat_destruction = etat_destructible;
		}
		
		public function estDeplacable():Boolean {
			return (etat_deplacable as MEtatDeplacable) != null;
		}
		
		public function setEstDeplacable(est_deplacable:Boolean):void {
			if(est_deplacable) {
				etat_deplacable = new MEtatDeplacable(this);
			}
			else {
				etat_deplacable = new MEtatIndeplacable(this);
			}
		}
		
		public function getEtatDeplacable():MIEtatDeplacable {
			return etat_deplacable;
		}
		
		public function setEtatDeplacable(etat_deplacable:MIEtatDeplacable):void {
			this.etat_deplacable = etat_deplacable;
		}
		
		public function estRedimensionnable():Boolean {
			return (etat_redimensionnable as MEtatRedimensionnable) != null;
		}
		
		public function setEstRedimensionnable(est_redimensionnable:Boolean):void {
			if(est_redimensionnable) {
				etat_redimensionnable = new MEtatRedimensionnable(this);
			}
			else {
				etat_redimensionnable = new MEtatNonRedimensionnable(this);
			}
		}
		
		public function getEtatRedimensionnable():MIEtatRedimensionnable {
			return etat_redimensionnable;
		}
		
		public function setEtatRedimensionnable(etat_redimensionnable:MIEtatRedimensionnable):void {
			this.etat_redimensionnable = etat_redimensionnable;
		}
		
		override public function deplacement(x:Number, y:Number):void {
			etat_deplacable.deplacement(x, y);
		}
		
		override public function setX(x:Number):void {
			etat_deplacable.setX(x);
		}
		
		override public function setY(y:Number):void {
			etat_deplacable.setY(y);
		}
		
		override public function redimensionnement(l:Number, h:Number):void {
			etat_redimensionnable.redimensionnement(l, h);
		}
		
		override public function setHauteur(hauteur:Number):void {
			etat_redimensionnable.setHauteur(hauteur);
		}
		
		override public function setLargeur(largeur:Number):void {
			etat_redimensionnable.setLargeur(largeur);
		}
		
		override public function mourir():void {
			etat_destruction.mourir();
		}
		
		override public function actionCollision(objet_collisionne:MIObjet,axe:MAxe):void {
			etat_destruction.actionCollision(objet_collisionne,axe);
		}

	}
}