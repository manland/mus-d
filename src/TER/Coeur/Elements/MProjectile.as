package Coeur.Elements {
	import Controleur.MMouvementPerpetuel;
	import Coeur.MIObjet;
	import Utilitaires.MErreur;
	
	public class MProjectile extends MElementAEtat {
		private var mouvement:MMouvementPerpetuel;
		private var tireur:MIObjet;
		private var direction:String;
		private var angle:Number;
		private var vitesse:Number;
		
		public function MProjectile(tireur:MIObjet, direction:String, vitesse:Number=200, point_degat:Number=1) {
			this.tireur = tireur;
			this.direction = direction;
			this.vitesse = vitesse;
			angle = 180;//direction == "est"
			if(direction == "nord") {
				angle = 90;
			}
			else if(direction == "sud") {
				angle = 270;
			}
			else if(direction == "ouest") {
				angle = 0;
			}
			mouvement = new MMouvementPerpetuel();
			setPointVie(0);
			setPointDegat(point_degat);
			
			setEtatDestructible(new MEtatDestructibleProjectile(this));
			
			setEtatDeplacable(new MEtatDeplacable(this));
			nom_classe = "MProjectile";
		}
		
		public function lancer():void {
			if(direction == "nord") {
				setX(tireur.getX()+(tireur.getLargeur()/2));
				setY(tireur.getY());
			}
			else if(direction == "sud") {
				setX(tireur.getX()+(tireur.getLargeur()/2));
				setY(tireur.getY()+tireur.getHauteur());
			}
			else if(direction == "ouest") {
				setX(tireur.getX()+tireur.getLargeur()+5);
				setY(tireur.getY()+(tireur.getHauteur()/2));
			}
			else {//est
				setX(tireur.getX()+tireur.getLargeur()+5);
				setY(tireur.getY()+(tireur.getHauteur()/2));
			}
			mouvement.instancieAvecAngleEtVitesse(this, angle, vitesse);
			mouvement.lancer();
		}
	}
}