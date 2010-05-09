package Coeur.Elements {
	import Coeur.MJeu;
	
	
	public class MEtatIndeplacable extends MEtatAbstrait implements MIEtatDeplacable {
		
		public function MEtatIndeplacable(element:MElementAEtat) {
			super(element);
		}
		
		public function deplacement(x:Number, y:Number):void {
			//si le jeux n'a pas commencé alors on fait comme si c'était déplaçable pour pouvoir positionner les objets ;)
			if(!MJeu.getInstance().getEstCommence()) {
				if(element.getForme() != null){
					element.getForme().deplacement(x, y);
					element.fireDeplacementObjet();
				}
			}
		}
		
		public function setX(x:Number):void {
			//si le jeux n'a pas commencé alors on fait comme si c'était déplaçable pour pouvoir positionner les objets ;)
			if(!MJeu.getInstance().getEstCommence()) {
				if(element.getForme() != null){
					element.getForme().setX(x);
					element.fireDeplacementObjet();
				}
			}
		}
		
		public function setY(y:Number):void {
			//si le jeux n'a pas commencé alors on fait comme si c'était déplaçable pour pouvoir positionner les objets ;)
			if(!MJeu.getInstance().getEstCommence()) {
				if(element.getForme() != null){
					element.getForme().setY(y);
					element.fireDeplacementObjet();
				}
			}
		}
	}
}