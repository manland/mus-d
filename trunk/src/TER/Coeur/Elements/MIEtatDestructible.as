package Coeur.Elements {
	import Coeur.MIObjet;
	import Utilitaires.MAxe;
	
	public interface MIEtatDestructible {
		function actionCollision(objet_collisionne:MIObjet,axe:MAxe):void;
		function mourir():void;
	}
}