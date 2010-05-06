package Controleur
{
	import Coeur.MIObjet;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	/**
	 * Sert à effectuer un Redimentionnement progressif sur un objet 
	 */
	public class MRedimensionnement implements MIEffet
	{
		/**
		 * nom de la classe
		 */
		private var nom_classe:String 
		/**
		 * objet sur lequel s'applique le Redimensionnement courant
		 */
		private var objet:MIObjet;
		/**
		 * Timer utilisé pour mesurer les unités de temps
		 */
		private var timer:Timer;
		/**
		 * valeur en pixel ajoutée à la largeur de l'objet à chaque unité de temps
		 */
		private var unite_largeur:Number;
		/**
		 * valeur en pixel ajoutée à la hauteur de l'objet à chaque unité de temps
		 */
		private var unite_hauteur:Number;
		/**
		 * valeur en pixel de la largeur que doit atteindre l'objet à la fin du Redimensionnement
		 */
		private var largeur_arrivee:Number;
		/**
		 * valeur en pixel de la hauteur que doit atteindre l'objet à la fin du Redimensionnement
		 */
		private var hauteur_arrivee:Number;
		/**
		 * temps en milliseconde que doit durer le redimensionnement
		 */
		private var temps_ms:Number;
		
		/**
		 * crée et instancie le Redimensionnement receveur
		 * @param objet: objet sur lequel s'applique le Redimensionnement receveur
		 * @param largeur_arrivee: valeur (en pixel) de la largeur que doit atteindre l'objet à la fin du Redimensionnement
		 * @param hauteur_arrivee: valeur (en pixel) de la hauteur que doit atteindre l'objet à la fin du Redimensionnement
		 * @param temps_ms: temps (en milliseconde) que doit durer le Redimensionnement
		 */
		public function MRedimensionnement(objet:MIObjet,largeur_arrivee:Number, hauteur_arrivee:Number, temps_ms:Number){
			this.nom_classe = "MRedimensionnement";
			this.objet = objet;
			this.largeur_arrivee = largeur_arrivee;
			this.hauteur_arrivee = hauteur_arrivee;
			this.temps_ms = temps_ms;
		}
		
		/**
		 * effectue les calculs nécessaires et lance le Redimensionnement receveur
		 */
		public function lancer():void{
			if (temps_ms < 20)//temps trop court
				return;
			//remise a zéro si ce n'est pas fait
			if(timer != null) {
				stopper();
			}
			//calcul du nombre d'unité de temps pour le mouvement pour avoir 50 images/sec => 1 image / 20 ms
			var nb_unite_tp:int = temps_ms /20;
			//calcul du déplacement à faire en une unité de temps
			unite_largeur = (largeur_arrivee - objet.getLargeur())/ nb_unite_tp;
			unite_hauteur = (hauteur_arrivee - objet.getHauteur())/ nb_unite_tp;
			
			timer = new Timer(20, nb_unite_tp);
			timer.addEventListener(TimerEvent.TIMER, redimentionneUneUnite);
			timer.start();
		}
		
		/**
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * <p> redimensionne l'objet sur lequel s'applique le Redimensionnement receveur ( + unite_largeur en largeur et + unite_hauteur en hauteur ) </p>		 
		 */		
		private function redimentionneUneUnite(e:TimerEvent):void{
			objet.redimensionnement( unite_largeur, unite_hauteur);
		}
		
		/**
		 * stoppe le Redimensionnement receveur
		 */		
		public function stopper():void{
			timer.stop();
		}
		
		/**
		 * renvoie un clone du Redimensionnement receveur
		 */
		public function clone():MIEffet{
			var mouv:MRedimensionnement = new MRedimensionnement(this.objet,new Number(this.largeur_arrivee),new Number(this.hauteur_arrivee),new Number(this.temps_ms));
			return mouv;
		}
		
		// getteurs setteurs //
				
		/**
		 * renvoie le timer du Redimensionnement receveur
		 * @return le timer du Redimensionnement receveur
		 */
		public function getTimer():Timer{
			return this.timer;
		}
		/**
		 * remplace le timer du Redimensionnement receveur par celui passé en paramètre
		 * @param le nouveau timer du Redimensionnement receveur
		 */	
		public function setTimer(timer:Timer):void{
			this.timer = timer;
		}	
		
		/**
		 * renvoie l'objet sur lequel s'applique le Redimensionnement receveur
		 * @return l'objet sur lequel s'applique le Redimensionnement receveur
		 */
		public function getObjet():MIObjet{
			return this.objet;
		}	
		/**
		 * remplace l'objet sur lequel s'applique le Redimensionnement receveur par celui passé en paramètre
		 * @param le nouvel objet sur lequel on veut que s'applique le Redimensionnement receveur
		 */
		public function setObjet(objet:MIObjet):void{
			this.objet = objet;
		}
			
		/**
		 * renvoie la chaine qui représente le nom de la classe du Redimensionnement receveur
		 * @return la chaine qui représente le nom de la classe du Redimensionnement receveur
		 */
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
	}
}