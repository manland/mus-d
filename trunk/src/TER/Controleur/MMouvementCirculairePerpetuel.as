package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.*;
	
	import flash.events.TimerEvent;
	
	import mx.controls.Text;
	
	/**
	 * Sert à appliquer un Mouvement circulaire infini a un objet
	 */
	public class MMouvementCirculairePerpetuel extends MEffet implements MIEffet
	{
		/**
		 * vitesse en degre par seconde du mouvement circulaire
		 */
		protected var vitesse_degre_seconde:Number;
		/**
		 * angle selon lequel doit tourner l'objet toutes les unités de temps
		 */
		protected var unite_angle_degre:Number;
		/**
		 * centre du mouvement circulaire
		 */
		 protected var centre:MCoordonnee;
		 
		/**
		 * construit un mouvement circulaire perpétuel de centre passé en paramètre ayant comme angle celui passé en paramètre
		 * et comme vitesse celle passée en paramètre
		 * @param objet: objet sur lequel doit s'appliquer le mouvement
		 * @param centre: centre du mouvement circulaire
		 * @param vitesse_degre_seconde: vitesse en degre par seconde du mouvement circulaire
		 */
		public function MMouvementCirculairePerpetuel(objet:MIObjet, centre:MCoordonnee, vitesse_degre_seconde:Number)
		{
			this.nom_classe = "MMouvementCirculairePerpetuel";
			this.objet = objet;
			this.vitesse_degre_seconde = vitesse_degre_seconde;
			this.centre = centre;
		}
		/**
		 * @inheritDoc
		 */
		public function lancer():void{
			//calcul du déplacement à faire en une unité de temps
			unite_angle_degre = vitesse_degre_seconde * 0.02;
			
			//on lance le timer toutes les 20 ms indéfiniment
			lancerTimer(20, 0);
		}
		/**
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * <p> fait se déplacer l'objet selon le mouvement circulaire d'angle unite_angle_degre  </p>
		 * @param e: evenement du timer qui annonce la fin d'un compte à rebours		 
		 */		
		public function appliqueUnite(e:TimerEvent):void{
			objet.deplacementCirculaire(centre, unite_angle_degre );			
		}
		/**
		 * @inheritDoc
		 */
		public function clone():MIEffet{
			var mouv:MMouvementCirculairePerpetuel =  new MMouvementCirculairePerpetuel(getObjet(),centre.clone(),this.vitesse_degre_seconde);
			return mouv;			
		}

	}
}