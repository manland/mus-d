package Coeur.Elements {
	import Coeur.Forme.MIForme;
	import Utilitaires.MErreur;
	
	
	public class MEtatDeplacable extends MEtatAbstrait implements MIEtatDeplacable {
		
		public function MEtatDeplacable(element:MElementAEtat) {
			super(element);
		}
		
		public function setX(x:Number):void {
			if(element.getForme() != null){
				element.getForme().setX(x);
				element.fireDeplacementObjet();
			}
		}
		
		public function setY(y:Number):void {
			if(element.getForme() != null){
				element.getForme().setY(y);
				element.fireDeplacementObjet();
			}
		}
	}
}