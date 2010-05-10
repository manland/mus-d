package Controleur.action
{
	import Coeur.MIObjet;
	
	import Controleur.MMouvementFini;
	
	import flash.events.TimerEvent;

	public class MSaut extends MMouvementFini
	{
		protected var y_depart:Number;
		
		protected var hauteur_saut_px:Number;
		protected var duree_saut_ms:Number;
		
		
		public function MSaut(objet:MIObjet, hauteur_saut_px:Number, duree_saut_ms:Number)
		{
			this.hauteur_saut_px = hauteur_saut_px;
			this.duree_saut_ms = duree_saut_ms;
			super(objet, objet.getX(), objet.getY()-hauteur_saut_px, duree_saut_ms/2);
		}
		
		public override function lancer():void{
			this.y_depart = objet.getY();
			this.x_arrivee = objet.getX();
			this.y_arrivee = y_depart - hauteur_saut_px;
			super.lancer();
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,redescendre);						
		}
		
		private function redescendre(e:TimerEvent):void{
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,redescendre);
			this.x_arrivee = objet.getX();
			this.y_arrivee = y_depart;
			super.lancer();
		}
		
	}
}