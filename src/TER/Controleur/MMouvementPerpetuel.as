package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MAxe;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	/**
	 * Sert à appliquer un Mouvement Perpétuel sur un objet
	 */
	public class MMouvementPerpetuel implements MIEffet
	{
		/**
		 * nom de la classe
		 */
		private var nom_classe:String 
		/**
		 * objet sur lequel s'applique le Mouvement Perpétuel courant
		 */
		private var objet:MIObjet;
		/**
		 * Timer utilisé pour mesurer les unités de temps
		 */
		private var timer:Timer;
		/**
		 * valeur en pixel ajoutée sur l'abscisse à chaque unité de temps
		 */
		private var unite_x:Number;
		/**
		 * valeur en pixel ajoutée sur l'ordonnée à chaque unité de temps
		 */
		private var unite_y:Number;
		/**
		 * vitesse sur l'abscisse en pixel par seconde
		 */
		private var vitesse_px_s_X:Number;
		/**
		 * vitesse sur l'ordonnée en pixel par seconde
		 */
		private var vitesse_px_s_Y:Number;
		
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
			//remise a zéro si ce n'est pas fait
			if(timer != null) {
				stopper();
			}
			//calcul du déplacement à faire en une unité de temps
			unite_x = vitesse_px_s_X * 0.02;
			unite_y = vitesse_px_s_Y * 0.02;
			
			//on lance le timer toutes les 20 ms indéfiniment
			lancerTimer(20, 0);
		}
		
		/**
		 * crée pour l'attribut "timer" de l'objet receveur un nouveau Timer qui appelle la fonction avanceUneUnite lorsqu'il finit et le lance
		 * @param temps: temps de durée du Timer
		 * @param repetition: nombre de fois ou le Timer va recommencer
		 */	
		protected function lancerTimer(temps:Number, repetition:Number):void{
			setTimer(new Timer(temps, repetition));
			getTimer().addEventListener(TimerEvent.TIMER, avanceUneUnite);
			getTimer().start();
		}
		
		/**
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * <p> Fait avancer l'objet sur lequel s'applique le Mouvement Perpétuel receveur ( + unite_x sur l'abscisse et + unite_y sur l'ordonnée ) </p>		 
		 */
		protected function avanceUneUnite(e:TimerEvent):void{
			getObjet().avance(unite_x, unite_y);			
		}
		
		/**
		 * stoppe le Mouvement Perpétuel receveur
		 */		
		public function stopper():void{
			getTimer().stop();
		}
		
		/**
		 * modifie le Mouvement de manière à faire rebondir l'objet selon l'axe passé en paramètre
		 * <p> les coefficients servent à obtenir un angle de rebond plus ouvert ou plus fermé que l'habituel
		 * exemple : si on rebondie selon un axe horizontal, en mettant un coeff_x supérieur à 1 on agrandit l'angle de rebond, s'il est inférieur à un on le diminue
		 * </p>
		 * @param axe: axe selon lequel doit rebondir l'objet
		 * @param coeff_x: coefficient à appliquer sur la vitesse sur l'abscisse
		 * @param coeff_y: coefficient à appliquer sur la vitesse sur l'abscisse
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
		
		/** getteurs et setteurs */
		/**
		 * renvoie le timer du Mouvement Perpétuel receveur
		 * @return le timer du Mouvement Perpétuel receveur
		 */
		public function getTimer():Timer{
			return this.timer;
		}
		/**
		 * remplace le timer du Mouvement Perpétuel receveur par celui passé en paramètre
		 * @param le nouveau timer du Mouvement Perpétuel receveur
		 */	
		public function setTimer(timer:Timer):void{
			this.timer = timer;
		}	
		
		/**
		 * renvoie l'objet sur lequel s'applique le Mouvement Perpétuel receveur
		 * @return l'objet sur lequel s'applique le Mouvement Perpétuel receveur
		 */
		public function getObjet():MIObjet{
			return this.objet;
		}	
		/**
		 * remplace l'objet sur lequel s'applique le Mouvement Perpétuel receveur par celui passé en paramètre
		 * @param le nouvel objet sur lequel on veut que s'applique le Mouvement Perpétuel receveur
		 */
		public function setObjet(objet:MIObjet):void{
			this.objet = objet;
		}
			
		/**
		 * renvoie la chaine qui représente le nom de la classe du Mouvement Perpétuel receveur
		 * @return la chaine qui représente le nom de la classe du Mouvement Perpétuel receveur
		 */
		public function getNomClasse():String
		{
			return this.nom_classe;
		}	
		
		/**
		 * renvoie un nombre compris entre 0 et 360° qui représente la valeur de l'angle entre la trajectoire du mouvement
		 * et l'horizontal (rappel: les angles se mesurent dans le sens contraire des aiguilles d'une montre ex: 30° => 30° au dessus de l'horizontale)
		 * @return valeur de l'angle entre la trajectoire du mouvement et l'horizontal (compris entre 0 et 360 sauf si le mouvement est null, dans ce cas -1)
		 */
		public function getAngle():Number{
			var angle:Number;
			var x:Number = unite_x;
			var y:Number = unite_y;
			if(x > 0 && y >= 0){
				angle = Math.atan(unite_y/unite_x);
			} else if(x > 0 && y < 0){
				angle = Math.atan(unite_y/unite_x) + 2*Math.PI;
			} else if(x < 0){
				angle = Math.atan(unite_y/unite_x) + Math.PI;
			}else if(x == 0 && y > 0){
				angle = Math.PI/2;
			}else if(x == 0 && y < 0){
				angle = 3*Math.PI/2;
			}else{
				return -1;
			}
			return angle * 180 / Math.PI;
		}
	}
}