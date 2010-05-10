package Coeur.Elements.ElementsAActions {
	import Coeur.Elements.MElementAEtat;
	
	
	public class MElementAActionAbstrait {
		protected var element:MElementAEtat;
		protected var sous_element_decorateur:MIElementAAction;
		protected var nom:String;
		protected var active:Boolean = true;
		
		public function MElementAActionAbstrait(element:MElementAEtat, nom:String) {
			//mettre en abstrait
			this.element = element;
			this.nom = nom;
		}
		
		public function ajouterElementAAction(element:MIElementAAction):void {
			sous_element_decorateur = element;
		}
		
		public function activerAction(nom:String):void {
			if(this.nom == nom) {
				active = true;
			}
		}
		
		public function desactiverAction(nom:String):void {
			if(this.nom == nom) {
				active = false;
			}
		}
		
		public function getElementAEtat():MElementAEtat {
			return element;
		}
		
	}
}