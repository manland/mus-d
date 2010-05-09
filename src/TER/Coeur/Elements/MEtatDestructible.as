package Coeur.Elements {
	import Coeur.MIObjet;
	import Utilitaires.MAxe;
	import Coeur.MJeu;
	import Utilitaires.MErreur;
	
	
	public class MEtatDestructible extends MEtatAbstrait implements MIEtatDestructible {
		
		public function MEtatDestructible(element:MElementAEtat) {
			super(element);
		}
		
		public function actionCollision(objet_collisionne:MIObjet,axe:MAxe):void {
			if(MJeu.getInstance().getEstCommence()) {
				var element_a_etat_collisionne:MElementAEtat = (objet_collisionne as MElementAEtat);
				if(element_a_etat_collisionne != null) {
					element.setPointVie(element.getPointVie()-element_a_etat_collisionne.getPointDegat());
					element.fireCollision(axe);
					if(element.getPointVie() <= 0) {
						element.mourir();
					}
				}
			}
		}
		
		public function mourir():void {
			element.fireMourir();
		}
	}
}