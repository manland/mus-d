package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MCoordonnee;
	
	import flash.events.TimerEvent;

	/**
	 * Fait effectuer une rotation finie à un objet
	 */
	public class MRotationFinie extends MEffet implements MIEffet
	{
		/**
		 * coordonnée du centre de la rotation
		 */
		protected var centre:MCoordonnee;
		/**
		 * angle de la rotation en degré
		 */
		protected var angle_degre:Number;
		/**
		 * temps de la rotation en ms
		 */
		protected var temps_ms:Number
		/**
		 * nombre de degré dont doit tourner l'objet toutes les unités de temps
		 */
		protected var unite_angle_degre:Number;
		
		/**
		 * crée une instance de rotation fini de centre, d'angle et de durée passés en paramètre
		 * @param objet: objet sur lequel doit s'appliquer la rotation
		 * @param centre: coordonnée du centre de la rotation
		 * @param angle_degré: angle en degré de la rotation
		 * @param temps_ms: temps en milliseconde que doit durer la rotation
		 */
		public function MRotationFinie(objet:MIObjet, centre:MCoordonnee, angle_degre:Number, temps_ms:Number)
		{
			this.nom_classe = "MRotationFinie";
			this.objet = objet;
			this.centre = centre;
			this.angle_degre = angle_degre;
			this.temps_ms = temps_ms		
		}
		/**
		 * effectue les calculs nécessaire et lance la rotation finie
		 */
		public function lancer():void
		{
			//calcul du nombre d'unité de temps pour le Mouvement pour avoir 50 images/sec => 1 image / 20 ms
			var nb_unite_tp:int = temps_ms /20;
			//calcul du déplacement à faire en une unité de temps
			unite_angle_degre = angle_degre/ nb_unite_tp;
			
			lancerTimer(20, nb_unite_tp);
		}
		/**
		 * renvoie une nouvelle instance clone de la rotation finie receveuse
		 * @return une nouvelle instance clone de la rotation finie receveuse
		 */
		public function clone():MIEffet
		{
			var rot:MRotationFinie = new MRotationFinie(getObjet(),this.centre,new Number(angle_degre),new Number(temps_ms));
			return rot;
		}
		/**
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * <p> fait se tourner l'objet selon la rotation d'angle unite_angle_degre  </p>
		 * @param e: evenement du timer qui annonce la fin d'un compte à rebours		 
		 */	
		public function appliqueUnite(e:TimerEvent):void
		{
			objet.tourne(centre, unite_angle_degre);
		}
		
	}
}