package Coeur.Elements.ElementsAActions {
	import Fabrique.MFabriqueAbstraiteProjectile;
	import Coeur.Elements.ElementsAActions.MElementAActionAbstrait;
	import Coeur.Elements.ElementsAActions.MIElementAAction;
	import Coeur.Elements.MElementAEtat;
	import Coeur.Elements.MProjectile;
	import Graphique.MIObjetGraphique;
	import Fabrique.MIFabriqueProjectile;
	
	public class MTireur extends MElementAActionAbstrait implements MIElementAAction {
		private var fabrique_projectile:MIFabriqueProjectile;
		
		public function MTireur(element_tireur:MElementAEtat, nom:String, fabrique_projectile:MIFabriqueProjectile) {
			super(element_tireur, nom);
			this.fabrique_projectile = fabrique_projectile;
		}
		
		public function action(nom:String):void {
			if(this.nom == nom && active) {
				var projectile:MIObjetGraphique = fabrique_projectile.creer(element);
				var r:Number = 10+Math.sqrt(Math.pow(element.getLargeur()/2, 2) + Math.pow(element.getHauteur()/2, 2));
				var angle:Number = (projectile.getObjet() as MProjectile).getAngle();
				var x_projectile:Number = Math.cos((Math.PI*angle)/180) * r;
				var y_projectile:Number = Math.sin((Math.PI*angle)/180) * r;
				projectile.x = x_projectile + element.getX();
				projectile.y = y_projectile + element.getY();
				(projectile.getObjet() as MProjectile).lancer();
			}
			if(sous_element_decorateur != null) {
				sous_element_decorateur.action(nom);
			}
		}
	}
}