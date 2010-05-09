package Coeur.Elements {
	
	public class MEtatRedimensionnable extends MEtatAbstrait implements MIEtatRedimensionnable {
		
		public function MEtatRedimensionnable(element:MElementAEtat) {
			super(element);
		}
		
		public function setHauteur(hauteur:Number):void {
			if(element.getForme() != null) {
				element.getForme().setHauteur(hauteur);
				element.fireChangementTaille();
			}
		}
		
		public function setLargeur(largeur:Number):void {
			if(element.getForme() != null) {
				element.getForme().setLargeur(largeur);
				element.fireChangementTaille();
			}
		}
	}
}