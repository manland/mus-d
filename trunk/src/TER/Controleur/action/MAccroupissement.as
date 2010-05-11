package Controleur.action
{
	import Coeur.MIObjet;
	
	import Controleur.MRedimensionnement;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * simule l'accroupisement d'un objet en diminuant puis remontant sa hauteur
	 */
	public class MAccroupissement extends MRedimensionnement
	{
		/**
		 * taille initiale de l'objet avant accroupissement
		 */
		protected var taille_initial:Number;
		/**
		 * pourcentage de la hauteur de l'objet qui doit s'enlever lorsqu'il est accroupi
		 */
		protected var pourcentage:Number;
		/**
		 * temps que doit durer la phase de descente pour aller s'accroupir et de montée pour se relever
		 */
		protected var temps_redim:Number;
		/**
		 * temps que l'objet reste accroupi
		 */
		protected var temps_accroupi:Number;
		
		/**
		 * crée une instance de accroupissement pour l'objet passé en paramètre, de pourcentage et de durée passés en paramètre
		 */
		public function MAccroupissement(objet:MIObjet,pourcentage_accroupissement:Number = 0.5,temps_accroupis_ms:Number = 500, temps_descente_monte_ms:Number = 500)
		{
			this.pourcentage = pourcentage_accroupissement;
			this.temps_accroupi = temps_accroupis_ms;
			this.temps_redim = temps_descente_monte_ms;
			super(objet, objet.getHauteur(), objet.getLargeur(), temps_redim);
		}
		/**
		 * effectue les calculs nécessaires et lance la descente de l'objet en position accroupie grâce à un redimensionnement 
		 */
		public override function lancer():void{
			this.taille_initial = objet.getHauteur();
			this.hauteur_arrivee = taille_initial - (taille_initial * pourcentage);
			this.largeur_arrivee = objet.getLargeur();
			super.lancer();
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,resterAccroupi);						
		}
		/**
		 * fonction appelé une fois que l'objet est en poition accroupie pour compte le temps à rester accroupi
		 * @param e: evenement du timer qui indique que l'objet a fini de s'accroupir
		 */
		private function resterAccroupi(e:TimerEvent):void{
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,resterAccroupi);
			timer = new Timer(temps_accroupi,1);
			timer.addEventListener(TimerEvent.TIMER,seRelever);
			timer.start();
		}
		/**
		 * fonction appelée lorsque l'objet a fini de rester accroupi pour lancer sa remonté grâce à un redimensionnement
		 * @param e: evenement du tier indiquant que le temps à rester accroupi est épuisé
		 */
		private function seRelever(e:TimerEvent):void{
			timer.removeEventListener(TimerEvent.TIMER,seRelever);
			this.hauteur_arrivee = taille_initial;
			this.largeur_arrivee = objet.getLargeur();
			super.lancer();
		}
		
		/**
		 * renvoie une nouvelle instance clone de l'accroupissement receveur
		 * @return une nouvelle instance clone de l'accroupissement receveur
		 */
		public override function clone():MIEffet{
			var acc:MAccroupissement = new MAccroupissement(getObjet(),new Number(pourcentage),new Number(temps_accroupi),new Number(temps_redim));
			return acc;
		}
		
	}
}