package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MCoordonnee;
	
	import flash.events.TimerEvent;
	
	import mx.controls.Text;

	public class MRotationPerpetuelle extends MEffet implements MIEffet
	{
		public var sysout:Text;
		private var centre:MCoordonnee;
		private var vitesse_degre_seconde:Number;
		private var unite_angle_degre:Number;
		
		public function MRotationPerpetuelle(objet:MIObjet, centre:MCoordonnee, vitesse_degre_seconde:Number)
		{
			this.objet = objet;
			this.centre = centre;
			this.vitesse_degre_seconde = vitesse_degre_seconde;			
		}
		
		public function lancer():void
		{
			//calcul du déplacement à faire en une unité de temps
			unite_angle_degre = vitesse_degre_seconde * 0.02;
			
			//on lance le timer toutes les 20 ms indéfiniment
			lancerTimer(20, 0);
		}
		
		public function clone():MIEffet
		{
			return null;
		}
		
		public function appliqueUnite(e:TimerEvent):void
		{
			//sysout.text +="\n tourne: "+unite_angle_degre;
			objet.tourne(centre, unite_angle_degre);
		}
		
	}
}