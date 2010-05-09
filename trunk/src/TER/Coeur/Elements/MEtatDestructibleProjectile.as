package Coeur.Elements {
	import Coeur.MScene;
	import Coeur.MIObjet;
	import Utilitaires.MAxe;
	import Utilitaires.MErreur;
	
	
	public class MEtatDestructibleProjectile extends MEtatDestructible {
		
		public function MEtatDestructibleProjectile(element:MElementAEtat) {
			super(element);
		}
		
		override public function actionCollision(objet_collisionne:MIObjet, axe:MAxe):void {
			var this_projectile:MProjectile = (element as MProjectile);
			if(this_projectile != null) {
				var projectile:MProjectile = (objet_collisionne as MProjectile);
				if(projectile != null) {
					return;
				}
				var element_a_etat_collisionne:MElementAEtat = (objet_collisionne as MElementAEtat);
				if(element_a_etat_collisionne != null) {
					element.setPointVie(element.getPointVie()-element_a_etat_collisionne.getPointDegat());
					element.fireCollision(axe);
					if(element.getPointVie() <= 0) {
						this_projectile.stopper();
						element.mourir();
					}
				}
				else {
					var scene:MScene = (objet_collisionne as MScene);
					if(scene != null) {
						element.setPointVie(element.getPointVie()-1);
						element.fireCollision(axe);
						if(element.getPointVie() <= 0) {
							this_projectile.stopper();
							element.mourir();
						}
					}
				}
			}
			else {
				throw new MErreur("MEtatDestructibleProjectile", "actionCollision", "Vous ne pouvez mettre dans l'état MEtatDestructibleProjectile un objet qui n'est pas un MProjectile");
			}
		}
	}
}