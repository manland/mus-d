package Controleur
{
	import Coeur.MIObjet;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	;
	public class MMouvement implements MIEffet
	{
		private var objet:MIObjet;
		private var timer:Timer;
		private var unite_x:Number;
		private var unite_y:Number;
		
		public function MMouvement(objet : MIObjet){
			this.objet = objet;
		}
		
		public function lancer(x_arrivee:Number, y_arrivee:Number, temps_ms:Number):void{
			if (temps_ms < 20)//temps trop court
				return;
			//remise a zéro si ce n'est pas fait
			if(timer != null) {
				stopper();
			}
			//calcul du nombre d'unité de temps pour le mouvement pour avoir 50 images/sec => 1 image / 20 ms
			var nb_unite_tp:int = temps_ms /20;
			//calcul du déplacement à faire en une unité de temps
			unite_x = (x_arrivee - objet.getX())/ nb_unite_tp;
			unite_y = (y_arrivee - objet.getY())/ nb_unite_tp;
			
			timer = new Timer(20, nb_unite_tp);
			timer.addEventListener(TimerEvent.TIMER, avanceUneUnite);
			timer.start();
		}
				
		private function avanceUneUnite(e:TimerEvent):void{
			objet.setX(objet.getX() + unite_x);
			objet.setY(objet.getY() + unite_y);
		}
		
		public function stopper():void{
			timer.stop();
		}
	}
}