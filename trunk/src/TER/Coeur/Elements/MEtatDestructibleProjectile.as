package Coeur.Elements {
	import Coeur.MScene;
	import Coeur.MIObjet;
	import Utilitaires.MAxe;
	import Utilitaires.MErreur;
	
	
	public class MEtatDestructibleProjectile extends MEtatDestructible {
		
		public function MEtatDestructibleProjectile(element:MElementAEtat) {
			super(element);
		}
		
		override public function actionCollision(objet:MIObjet, axe:MAxe):void {
			var this_projectile:MProjectile = (element as MProjectile);
			if(this_projectile != null) {
				var projectile:MProjectile = (objet as MProjectile);
				if(projectile != null) {
					return;
				}
				var element_a_etat_collisionne:MElementAEtat = (objet as MElementAEtat);
				if(element_a_etat_collisionne != null) {
					element.setPointVie(element.getPointVie()-element_a_etat_collisionne.getPointDegat());
					if(element.getPointVie() <= 0) {
						this_projectile.stopper();
						element.mourir();
					}
				}
				else {
					var scene:MScene = (objet as MScene);
					if(scene != null) {
						element.setPointVie(element.getPointVie()-1);
						if(element.getPointVie() <= 0) {
							this_projectile.stopper();
							element.mourir();
						}
					}
				}
				element.fireCollision(objet, axe);
			}
			else {
				throw new MErreur("MEtatDestructibleProjectile", "actionCollision", "Vous ne pouvez mettre dans l'état MEtatDestructibleProjectile un objet qui n'est pas un MProjectile");
			}
		}
	}
}