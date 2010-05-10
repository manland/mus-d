package Coeur.Elements {
	import Coeur.MIObjet;
	import Utilitaires.MAxe;
	import Utilitaires.MErreur;
	
	
	public class MEtatIndestructible extends MEtatAbstrait implements MIEtatDestructible {
		
		public function MEtatIndestructible(element:MElementAEtat) {
			super(element);
		}
		
		public function actionCollision(objet:MIObjet,axe:MAxe):void {
			element.fireCollision(objet, axe);
			return;
		}
		
		public function mourir():void {
			return;
		}
	}
}