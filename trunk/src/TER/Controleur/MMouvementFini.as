package Controleur
{
	import Coeur.MIObjet;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/*
	 * Sert à appliquer un Mouvement Fini sur un objet
	 */
	public class MMouvementFini implements MIEffet
	{
		/*
		 * nom de la classe
		 */
		private var nom_classe:String 
		/*
		 * objet sur lequel s'applique le Mouvement Fini courant
		 */
		private var objet:MIObjet;
		/*
		 * Timer utilisé pour mesurer les unités de temps
		 */
		private var timer:Timer;
		/*
		 * valeur en pixel ajoutée à l'abscisse de l'objet à chaque unité de temps
		 */
		private var unite_x:Number;
		/*
		 * valeur en pixel ajoutée à l'ordonnée de l'objet à chaque unité de temps
		 */
		private var unite_y:Number;
		/*
		 * abscisse en pixel de l'abscisse jusqu'ou doit se déplacer l'objet
		 */
		private var x_arrivee:Number;
		/*
		 * ordonnée en pixel de l'ordonnée jusqu'ou doit se déplacer l'objet
		 */
		private var y_arrivee:Number;
		/*
		 * temps en milliseconde que doit durer le mouvement
		 */
		private var temps_ms:Number;
		
		/*
		 * crée et instancie le Mouvement Fini receveur
		 * @param objet: objet sur lequel s'applique le Mouvement Fini receveur
		 * @param x_arrive: abscisse (en pixel) jusqu'ou doit se déplacer l'objet
		 * @param y_arrivee: ordonnée (en pixel) jusqu'ou doit se déplacer l'objet
		 * @param temps_ms: temps (en milliseconde) que doit durer le mouvement
		 */
		public function MMouvementFini(objet : MIObjet, x_arrivee:Number, y_arrivee:Number, temps_ms:Number){
			this.nom_classe = "MMouvementFini";
			this.objet = objet;
			unite_x = 0;
			unite_y = 0;
			this.x_arrivee = x_arrivee;
			this.y_arrivee = y_arrivee;
			this.temps_ms = temps_ms;
		}
		
		/*
		 * effectue les calculs nécessaires et lance le Mouvement Fini receveur
		 */
		public function lancer():void{
			if (temps_ms < 20)//temps trop court
				return;
			//remise a zéro si ce n'est pas fait
			if(timer != null) {
				stopper();
			}
			//calcul du nombre d'unité de temps pour le Mouvement pour avoir 50 images/sec => 1 image / 20 ms
			var nb_unite_tp:int = temps_ms /20;
			//calcul du déplacement à faire en une unité de temps
			unite_x = (x_arrivee - objet.getX())/ nb_unite_tp;
			unite_y = (y_arrivee - objet.getY())/ nb_unite_tp;
			
			lancerTimer(20, nb_unite_tp);
		}
		
		/*
		 * crée pour l'attribut "timer" de l'objet receveur un nouveau Timer qui appelle la fonction avanceUneUnite lorsqu'il finit et le lance
		 * @param temps: temps de durée du Timer
		 * @param repetition: nombre de fois ou le Timer va recommencer
		 */	
		protected function lancerTimer(temps:Number, repetition:Number):void{
			setTimer(new Timer(temps, repetition));
			getTimer().addEventListener(TimerEvent.TIMER, avanceUneUnite);
			getTimer().start();
		}
		
		/*
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * <p> Fait avancer l'objet sur lequel s'applique le Mouvement Fini receveur ( + unite_x sur l'abscisse et + unite_y sur l'ordonnée ) </p>		 
		 */
		protected function avanceUneUnite(e:TimerEvent):void{
			getObjet().avance(unite_x, unite_y);	
		}
		
		/*
		 * stoppe le Mouvement Fini receveur
		 */
		public function stopper():void{
			getTimer().stop();
		}
		
		/*
		 * renvoie un clone du Mouvement Fini receveur
		 */
		public function clone():MIEffet{
			var mouv:MMouvementFini = new MMouvementFini(this.objet,new Number(this.x_arrivee),new Number(this.y_arrivee),new Number(this.temps_ms));
			
			return mouv;
		}
		
		// getteurs setteurs //
				
		/*
		 * renvoie le timer du Mouvement Fini receveur
		 * @return le timer du Mouvement Fini receveur
		 */
		public function getTimer():Timer{
			return this.timer;
		}
		/*
		 * remplace le timer du Mouvement Fini receveur par celui passé en paramètre
		 * @param le nouveau timer du Mouvement Fini receveur
		 */	
		public function setTimer(timer:Timer):void{
			this.timer = timer;
		}	
		
		/*
		 * renvoie l'objet sur lequel s'applique le Mouvement Fini receveur
		 * @return l'objet sur lequel s'applique le Mouvement Fini receveur
		 */
		public function getObjet():MIObjet{
			return this.objet;
		}	
		/*
		 * remplace l'objet sur lequel s'applique le Mouvement Fini receveur par celui passé en paramètre
		 * @param le nouvel objet sur lequel on veut que s'applique le Mouvement Fini receveur
		 */
		public function setObjet(objet:MIObjet):void{
			this.objet = objet;
		}
			
		/*
		 * renvoie la chaine qui représente le nom de la classe du Mouvement Fini receveur
		 * @return la chaine qui représente le nom de la classe du Mouvement Fini receveur
		 */
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
	}
}