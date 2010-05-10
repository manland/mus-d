package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MCoordonnee;
	
	import flash.events.TimerEvent;

	public class MRotationFinie extends MEffet implements MIEffet
	{
		protected var centre:MCoordonnee;
		protected var angle_degre:Number;
		protected var temps_ms:Number
		protected var unite_angle_degre:Number;
		
		public function MRotationFinie(objet:MIObjet, centre:MCoordonnee, angle_degre:Number, temps_ms:Number)
		{
			this.objet = objet;
			this.centre = centre;
			this.angle_degre = angle_degre;
			this.temps_ms = temps_ms		
		}
		
		public function lancer():void
		{
			//calcul du nombre d'unité de temps pour le Mouvement pour avoir 50 images/sec => 1 image / 20 ms
			var nb_unite_tp:int = temps_ms /20;
			//calcul du déplacement à faire en une unité de temps
			unite_angle_degre = angle_degre/ nb_unite_tp;
			
			lancerTimer(20, nb_unite_tp);
		}
		
		public function clone():MIEffet
		{
			return null;
		}
		
		public function appliqueUnite(e:TimerEvent):void
		{
			objet.tourne(centre, unite_angle_degre);
		}
		
	}
}