package Coeur.Elements {
	import Coeur.MIObjet;
	import Utilitaires.MAxe;
	import Utilitaires.MErreur;
	
	
	public class MEtatIndestructible extends MEtatAbstrait implements MIEtatDestructible {
		
		public function MEtatIndestructible(element:MElementAEtat) {
			super(element);
		}
		
		public function actionCollision(objet_collisionne:MIObjet,axe:MAxe):void {
			element.fireCollision(axe);
			return;
		}
		
		public function mourir():void {
			return;
		}
	}
}