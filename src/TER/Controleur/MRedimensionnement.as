package Controleur
{
	import Coeur.MIObjet;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	/**
	 * Sert à effectuer un Redimentionnement progressif sur un objet 
	 */
	public class MRedimensionnement extends MEffet implements MIEffet
	{
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
			
			if (temps_ms < 20)//temps trop court
				this.temps_ms = 20;
			else
				this.temps_ms = temps_ms;			
			this.objet = objet;
			this.largeur_arrivee = largeur_arrivee;
			this.hauteur_arrivee = hauteur_arrivee;
		}
		
		/**
		 * effectue les calculs nécessaires et lance le Redimensionnement receveur
		 */
		public function lancer():void{
			//calcul du nombre d'unité de temps pour le mouvement pour avoir 50 images/sec => 1 image / 20 ms
			var nb_unite_tp:int = temps_ms /20;
			//calcul du déplacement à faire en une unité de temps
			unite_largeur = largeur_arrivee/ nb_unite_tp;
			unite_hauteur = hauteur_arrivee/ nb_unite_tp;
			
			lancerTimer(20,nb_unite_tp);
		}
		
		/**
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * <p> redimensionne l'objet sur lequel s'applique le Redimensionnement receveur ( + unite_largeur en largeur et + unite_hauteur en hauteur ) </p>		 
		 */		
		public function appliqueUnite(e:TimerEvent):void{
			objet.redimensionnement( unite_largeur, unite_hauteur);
		}
		
		/**
		 * renvoie un clone du Redimensionnement receveur
		 */
		public function clone():MIEffet{
			var mouv:MRedimensionnement = new MRedimensionnement(this.objet,new Number(this.largeur_arrivee),new Number(this.hauteur_arrivee),new Number(this.temps_ms));
			return mouv;
		}
	
	}
}