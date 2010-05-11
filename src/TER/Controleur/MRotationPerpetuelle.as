package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MCoordonnee;
	
	import flash.events.TimerEvent;
	
	/**
	 * applique une rotation perpétuelle à un objet
	 */
	public class MRotationPerpetuelle extends MEffet implements MIEffet
	{
		/**
		 * coordonnée du centre de la rotation
		 */
		protected var centre:MCoordonnee;
		/**
		 * vitesse de la rotation en degré par seconde
		 */
		protected var vitesse_degre_seconde:Number;
		/**
		 * angle dont doit tourner l'objet toutes les unités de temps
		 */
		protected var unite_angle_degre:Number;
		
		/**
		 * crée une instance de rotation perpétuelle pour l'objet passé en paramètre, de centre et de vitesse passée en paramètre
		 * @param objet: objet sur lequelle s'applique la rotation
		 * @param centre: coordonnée du centre de la rotation
		 * @param vitesse_degre_seconde: vitesse en degré par seconde de la rotation
		 */
		public function MRotationPerpetuelle(objet:MIObjet, centre:MCoordonnee, vitesse_degre_seconde:Number)
		{
			this.objet = objet;
			this.centre = centre;
			this.vitesse_degre_seconde = vitesse_degre_seconde;			
		}
		
		/**
		 * effectue les calculs nécessaires et lance la rotation perpétuelle
		 */
		public function lancer():void
		{
			//calcul du déplacement à faire en une unité de temps
			unite_angle_degre = vitesse_degre_seconde * 0.02;
			
			//on lance le timer toutes les 20 ms indéfiniment
			lancerTimer(20, 0);
		}
		
		/**
		 * renvoie une nouvelle instance clone de la rotation perpétuelle receveuse
		 * @return une nouvelle instance clone de la rotation perpétuelle receveuse
		 */
		public function clone():MIEffet
		{
			var rot:MRotationPerpetuelle = new MRotationPerpetuelle(getObjet(),centre,new Number(vitesse_degre_seconde));
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