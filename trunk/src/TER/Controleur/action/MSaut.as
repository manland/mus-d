package Controleur.action
{
	import Coeur.MIObjet;
	
	import Controleur.MIEffet;
	import Controleur.MMouvementFini;
	
	import flash.events.TimerEvent;
	/**
	 * fait effectuer un saut vertical à un objet
	 */
	public class MSaut extends MMouvementFini
	{
		/**
		 * hauteur de départ de l'objet
		 */
		protected var y_depart:Number;
		/**
		 * hauteur du saut en pixel
		 */	
		protected var hauteur_saut_px:Number;
		/**
		 * durée total du saut en milliseconde
		 */
		protected var duree_saut_ms:Number;
		
		/**
		 * crée un instance de saut de hauteur, et de durée passées en paramètre pour l'objet passé en paramètre
		 * @param objet: objet sur lequel s'applique le saut
		 * @param hauteur_saut_px: hauteur du saut en pixel
		 * @param duree_saut_ms: durée total du saut en milliseconde
		 */
		public function MSaut(objet:MIObjet, hauteur_saut_px:Number = 20, duree_saut_ms:Number = 1000)
		{
			this.hauteur_saut_px = hauteur_saut_px;
			this.duree_saut_ms = duree_saut_ms;
			super(objet, objet.getX(), objet.getY()-hauteur_saut_px, duree_saut_ms/2);
		}
		/**
		 * effectue les calculs nécessaire et lance la montée du saut grâce à un mouvement fini
		 * @see Controleur.MMouvementFini
		 */
		public override function lancer():void{
			this.y_depart = objet.getY();
			this.x_arrivee = objet.getX();
			this.y_arrivee = y_depart - hauteur_saut_px;
			super.lancer();
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,redescendre);						
		}
		/**
		 * fonction appelée lorsque la monté est finie, effectue les calculs nécessaires et lance la redescente grâce à un mouvement fini
		 * @see Controleur.MMouvementFini
		 */
		private function redescendre(e:TimerEvent):void{
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,redescendre);
			this.x_arrivee = objet.getX();
			this.y_arrivee = y_depart;
			super.lancer();
		}
		
		/**
		 * renvoie une nouvelle instance clone du saut receveur
		 * @return une nouvelle instance clone du saut receveur
		 */
		public override function clone():MIEffet{
			var saut:MSaut = new MSaut(getObjet(),new Number(hauteur_saut_px), new Number(duree_saut_ms));
			return saut;
		}
	}
}