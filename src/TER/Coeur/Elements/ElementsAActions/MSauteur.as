package Coeur.Elements.ElementsAActions {
	import Controleur.action.MSaut;
	import Coeur.Elements.MElementAEtat;
	
	public class MSauteur extends MElementAActionAbstrait implements MIElementAAction {
		private var hauteur_saut_px:Number;
		private var duree_saut_mx:Number;
		
		public function MSauteur(element_sauteur:MElementAEtat, nom:String, hauteur_saut_px:Number, duree_saut_mx:Number) {
			super(element_sauteur, nom);
			this.hauteur_saut_px = hauteur_saut_px;
			this.duree_saut_mx = duree_saut_mx;
		}
		
		public function action(nom:String):void {
			if(this.nom == nom && active) {
				var saut:MSaut = new MSaut(element, hauteur_saut_px, duree_saut_mx);
				saut.lancer();
			}
			if(sous_element_decorateur != null) {
				sous_element_decorateur.action(nom);
			}
		}

	}
}