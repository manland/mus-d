package Controleur
{
	import Coeur.MIObjet;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * Sert à appliquer un Mouvement Fini sur un objet, aller de là ou il se trouve jusqu'à un point donné
	 */
	public class MMouvementFini extends MEffet implements MIEffet
	{
		/**
		 * valeur en pixel ajoutée à l'abscisse de l'objet à chaque unité de temps
		 */
		private var unite_x:Number;
		/**
		 * valeur en pixel ajoutée à l'ordonnée de l'objet à chaque unité de temps
		 */
		private var unite_y:Number;
		/**
		 * abscisse en pixel de l'abscisse jusqu'ou doit se déplacer l'objet
		 */
		private var x_arrivee:Number;
		/**
		 * ordonnée en pixel de l'ordonnée jusqu'ou doit se déplacer l'objet
		 */
		private var y_arrivee:Number;
		/**
		 * temps en milliseconde que doit durer le mouvement
		 */
		private var temps_ms:Number;
		
		/**
		 * crée et instancie le Mouvement Fini receveur
		 * @param objet: objet sur lequel s'applique le Mouvement Fini receveur
		 * @param x_arrive: abscisse (en pixel) jusqu'ou doit se déplacer l'objet
		 * @param y_arrivee: ordonnée (en pixel) jusqu'ou doit se déplacer l'objet
		 * @param temps_ms: temps (en milliseconde) que doit durer le mouvement doit être supérieur à 20 ms
		 */
		public function MMouvementFini(objet : MIObjet, x_arrivee:Number, y_arrivee:Number, temps_ms:Number){
			this.nom_classe = "MMouvementFini";
			if (temps_ms < 20)//temps trop court
				this.temps_ms = 20;
			else
				this.temps_ms = temps_ms;
			this.objet = objet;
			this.x_arrivee = x_arrivee;
			this.y_arrivee = y_arrivee;
		}
		
		/**
		 * effectue les calculs nécessaires et lance le Mouvement Fini receveur
		 */
		public function lancer():void{
			//calcul du nombre d'unité de temps pour le Mouvement pour avoir 50 images/sec => 1 image / 20 ms
			var nb_unite_tp:int = temps_ms /20;
			//calcul du déplacement à faire en une unité de temps
			unite_x = (x_arrivee - objet.getX())/ nb_unite_tp;
			unite_y = (y_arrivee - objet.getY())/ nb_unite_tp;
			
			lancerTimer(20, nb_unite_tp);
		}
		
		/**
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * <p> Fait avancer l'objet sur lequel s'applique le Mouvement Fini receveur ( + unite_x sur l'abscisse et + unite_y sur l'ordonnée ) </p>		 
		 */
		public function appliqueUnite(e:TimerEvent):void{
			getObjet().deplacement(unite_x, unite_y);	
		}
		
		/**
		 * renvoie un clone du Mouvement Fini receveur
		 */
		public function clone():MIEffet{
			var mouv:MMouvementFini = new MMouvementFini(this.objet,new Number(this.x_arrivee),new Number(this.y_arrivee),new Number(this.temps_ms));
			
			return mouv;
		}			
	}
}