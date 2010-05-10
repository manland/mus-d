package Coeur.Elements {
	import flash.geom.Point;
	import Coeur.MElement;
	import Coeur.MIObjet;
	import Utilitaires.MAxe;
	import Coeur.Elements.ElementsAActions.MElementAActionAbstrait;
	import Coeur.Elements.ElementsAActions.MIElementAAction;
	
	
	public class MElementAEtat extends MElement {
		
		private var point_vie:int;
		private var point_degat:int;
		private var etat_destruction:MIEtatDestructible;
		private var etat_deplacable:MIEtatDeplacable;
		private var etat_redimensionnable:MIEtatRedimensionnable;
		protected var element_a_action:MIElementAAction;
		
		public function MElementAEtat(point_vie:int=1, point_degat:int=0) {
			this.point_vie = point_vie;
			this.point_degat = point_degat;
			etat_destruction = new MEtatDestructible(this);
			etat_deplacable = new MEtatDeplacable(this);
			etat_redimensionnable = new MEtatRedimensionnable(this);
			nom_classe = "MElementAEtat";
		}
		
		public function ajouterElementAAction(element:MIElementAAction):void {
			if(element_a_action == null) {
				element_a_action = element;
			}
			else {
				element_a_action.ajouterElementAAction(element);
			}
		}
		
		public function lancerAction(nom:String):void {
			if(element_a_action != null) {
				element_a_action.action(nom);
			}
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
				
		public function getEtatDestructible():MIEtatDestructible {
			return etat_destruction;
		}
		
		public function setEtatDestructible(etat_destructible:MIEtatDestructible):void {
			this.etat_destruction = etat_destructible;
		}
		
		public function getEtatDeplacable():MIEtatDeplacable {
			return etat_deplacable;
		}
		
		public function setEtatDeplacable(etat_deplacable:MIEtatDeplacable):void {
			this.etat_deplacable = etat_deplacable;
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
		
		override public function actionCollision(objet:MIObjet,axe:MAxe):void {
			etat_destruction.actionCollision(objet,axe);
		}

	}
}