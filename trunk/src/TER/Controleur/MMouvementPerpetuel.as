package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MAxe;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	/**
	 * Sert à appliquer un Mouvement Perpétuel sur un objet
	 */
	public class MMouvementPerpetuel extends MEffet implements MIEffet
	{
		/**
		 * valeur en pixel ajoutée sur l'abscisse à chaque unité de temps
		 */
		protected var unite_x:Number;
		/**
		 * valeur en pixel ajoutée sur l'ordonnée à chaque unité de temps
		 */
		protected var unite_y:Number;
		/**
		 * vitesse sur l'abscisse en pixel par seconde
		 */
		protected var vitesse_px_s_X:Number;
		/**
		 * vitesse sur l'ordonnée en pixel par seconde
		 */
		protected var vitesse_px_s_Y:Number;
		
		/**
		 * crée le Mouvement Perpétuel receveur
		 */
		public function MMouvementPerpetuel(){
			this.nom_classe = "MMouvementPerpetuel";
		}
		
		/**
		 * instancie le Mouvement Perpétuel receveur
		 * @param objet: objet sur lequel s'applique le Mouvement Perpétuel receveur
		 * @param vitesse_px_s_X : vitesse de déplacement (en pixel par seconde) sur l'abscisse
		 * @param vitesse_px_s_Y : vitesse de déplacement (en pixel par seconde) sur l'ordonnée
		 */
		public function instancieAvecVitesse(objet:MIObjet,vitesse_px_s_X:Number, vitesse_px_s_Y:Number):void
		{
			this.objet = objet;
			this.vitesse_px_s_X = vitesse_px_s_X;
			this.vitesse_px_s_Y = vitesse_px_s_Y;
		}
		
		 /**
		 * instancie le Mouvement Perpétuel receveur
		 * @param objet: objet sur lequel s'applique le Mouvement Perpétuel receveur
		 * @param angle: angle de la trajectoire (en degré) par rapport à l'horizontal (rappel: les angles se mesurent dans le sens contraire des aiguilles d'une montre ex: 30° => 30° au dessus de l'horizontale)
		 * @param vitesse: vitesse de déplacement (en pixel par seconde)
		 */
		public function instancieAvecAngleEtVitesse(objet:MIObjet, angle:Number, vitesse:Number):void
		{
			var x:Number;
			var y:Number;
			var radian:Number;
			
			radian = angle * Math.PI / 180;
			x = vitesse * Math.cos(radian);
			y = vitesse * Math.sin(radian);
			
			this.instancieAvecVitesse(objet, x, y);
		}
		
		/**
		 * effectue les calculs nécessaires et lance le Mouvement Perpétuel receveur
		 */
		public function lancer():void{
			//calcul du déplacement à faire en une unité de temps
			unite_x = vitesse_px_s_X * 0.02;
			unite_y = vitesse_px_s_Y * 0.02;
			
			//on lance le timer toutes les 20 ms indéfiniment
			lancerTimer(20, 0);
		}
		
		/**
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * <p> Fait avancer l'objet sur lequel s'applique le Mouvement Perpétuel receveur ( + unite_x sur l'abscisse et + unite_y sur l'ordonnée ) </p>		 
		 */
		public function appliqueUnite(e:TimerEvent):void{
			getObjet().deplacement(unite_x, unite_y);			
		}
		
		/**
		 * modifie le Mouvement de manière à faire rebondir l'objet selon l'axe passé en paramètre
		 */		
		public function rebondir(axe_obstacle:MAxe, coeff_x:Number = 1, coeff_y:Number = 1):void{
			var i:Number = 0;
			if(axe_obstacle.estHorizontal()){ //rebond sur un axe parallèle à l'abscisse
				unite_y = -1 * unite_y;
			}
			else if(axe_obstacle.estVertical()){ //rebond sur un axe parallèle à l'ordonnée
				unite_x = -1 * unite_x;
			}	
			else if(axe_obstacle.estObliqueMontant()){ //rebond sur un axe formant un angle de 45° avec l'abscisse
				i = unite_x;	
				unite_x = unite_y;
				unite_y = i;
			}
			else if(axe_obstacle.estObliqueDescendant()){//rebond sur un axe formant un angle de -45° avec l'abscisse
				i = unite_x;	
				unite_x = - unite_y;
				unite_y = -i;
			}
			appliqueUnite(null);
			unite_x = unite_x * coeff_x;
			unite_y = unite_y * coeff_y;
		}
		
		/**
		 * renvoie un clone du Mouvement Perpétuel receveur
		 */
		public function clone():MIEffet{
			var mouv:MMouvementPerpetuel = new MMouvementPerpetuel();
			mouv.instancieAvecVitesse(this.objet,new Number(this.vitesse_px_s_X),new Number(this.vitesse_px_s_Y));
			return mouv;
		}
		
		/* accesseurs */
		/**
		 * retourne l'angle en degré entre le vecteur du mouvement et l'axe des abscisses
		 */
		 public function getAngle():Number{
		 	var x:Number = unite_x;
		 	var y:Number = unite_y;
		 	var angle:Number;
		 	
		 	if(x > 0 && y >= 0){
		 		angle = Math.atan(y/x);
		 	}else if(x > 0 && y < 0){
		 		angle = Math.atan(y/x) + 2*Math.PI;
		 	}else if(x < 0){
		 		angle = Math.atan(y/x) + Math.PI;
		 	}else if(x == 0 && y > 0){
		 		angle = Math.atan(y/x) + Math.PI/2;
		 	}else if(x == 0 && y < 0){
		 		angle = Math.atan(y/x) + 3*Math.PI/2;
		 	}else
		 		return 0;
		 		
		 	return angle * 180 / Math.PI;		 	
		 }
		 
		/**
		 * change le mouvement pour que son vecteur forme un angle en degré égal à celui passé en paramètre
		 * @param angle degré: nouvel angle en degré entre le vecteur de ce mouvement et l'axe des abscisses
		 */
		 public function setAngle(angle_degre:Number):void{
		 	var x:Number;
			var y:Number;
			var radian:Number;
			var vitesse:Number;
			
			radian = angle_degre * Math.PI / 180;
			vitesse = Math.sqrt(unite_x * unite_x + unite_y * unite_y);
			x = vitesse * Math.cos(radian);
			y = vitesse * Math.sin(radian);
			
			this.instancieAvecVitesse(objet, x, y);
		 }
	}
}