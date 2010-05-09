package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.*;
	
	import flash.events.TimerEvent;
	
	import mx.controls.Text;
	
	public class MMouvementCirculairePerpetuel extends MEffet implements MIEffet
	{
		public var sysout:Text;
		/**
		 * vitesse en degre par seconde du mouvement circulaire
		 */
		private var vitesse_degre_seconde:Number;
		/**
		 * angle selon lequel doit tourner l'objet toutes les unités de temps
		 */
		private var unite_angle_degre:Number;
		/**
		 * centre du mouvement circulaire
		 */
		 private var centre:MCoordonnee;
		 
		public function MMouvementCirculairePerpetuel(objet:MIObjet, centre:MCoordonnee, vitesse_degre_seconde:Number)
		{
			this.objet = objet;
			this.vitesse_degre_seconde = vitesse_degre_seconde;
			this.centre = centre;
		}
		
		public function lancer():void{
			//calcul du déplacement à faire en une unité de temps
			unite_angle_degre = vitesse_degre_seconde * 0.02;
			
			//on lance le timer toutes les 20 ms indéfiniment
			lancerTimer(20, 0);
		}
		
		public function appliqueUnite(e:TimerEvent):void{
			objet.deplacementCirculaire(centre, unite_angle_degre );			
		}
		
		public function clone():MIEffet{
			var mouv:MMouvementCirculairePerpetuel =  new MMouvementCirculairePerpetuel(getObjet(),centre.clone(),this.vitesse_degre_seconde);
			return mouv;			
		}

	}
}