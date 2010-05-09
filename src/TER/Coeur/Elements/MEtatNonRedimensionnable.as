package Coeur.Elements {
	import Coeur.MJeu;
	
	
	public class MEtatNonRedimensionnable extends MEtatAbstrait implements MIEtatRedimensionnable {
		
		public function MEtatNonRedimensionnable(element:MElementAEtat) {
			super(element);
		}
		
		public function redimensionnement(l:Number, h:Number):void {
			//si le jeux n'a pas commencé alors on fait comme si c'était redimensionnable pour pouvoir positionner les objets ;)
			if(!MJeu.getInstance().getEstCommence()) {
				if(element.getForme() != null) {
					element.getForme().setLargeur(l);
					element.getForme().setHauteur(h);
					element.fireChangementTaille();
				}
			}
		}
		
		public function setHauteur(hauteur:Number):void {
			//si le jeux n'a pas commencé alors on fait comme si c'était redimensionnable pour pouvoir positionner les objets ;)
			if(!MJeu.getInstance().getEstCommence()) {
				if(element.getForme() != null){
					element.getForme().setHauteur(hauteur);
					element.fireChangementTaille();
				}
			}
		}
		
		public function setLargeur(largeur:Number):void {
			//si le jeux n'a pas commencé alors on fait comme si c'était redimensionnable pour pouvoir positionner les objets ;)
			if(!MJeu.getInstance().getEstCommence()) {
				if(element.getForme() != null){
					element.getForme().setLargeur(largeur);
					element.fireChangementTaille();
				}
			}
		}
	}
}