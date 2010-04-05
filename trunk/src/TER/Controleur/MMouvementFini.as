package Controleur
{
	import Coeur.MIObjet;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class MMouvementFini implements MIEffet
	{
		private var objet:MIObjet;
		private var timer:Timer;
		private var unite_x:Number;
		private var unite_y:Number;
		private var x_arrivee:Number;
		private var y_arrivee:Number;
		private var temps_ms:Number;
		
		public function MMouvementFini(){}
		
		public function instancie(objet : MIObjet, x_arrivee:Number, y_arrivee:Number, temps_ms:Number):void{
			this.objet = objet;
			unite_x = 0;
			unite_y = 0;
			this.x_arrivee = x_arrivee;
			this.y_arrivee = y_arrivee;
			this.temps_ms = temps_ms;
		}
		
		public function lancer():void{
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
			
			lancerTimer(20, nb_unite_tp);
		}
		
		protected function lancerTimer(temps:Number, repetition:Number):void{
			setTimer(new Timer(temps, repetition));
			getTimer().addEventListener(TimerEvent.TIMER, avanceUneUnite);
			getTimer().start();
		}
		
		protected function avanceUneUnite(e:TimerEvent):void{
			getObjet().setX(getObjet().getX() + unite_x);
			getObjet().setY(getObjet().getY() + unite_y);
		}
		
		public function stopper():void{
			getTimer().stop();
		}
		
		/* getteurs setteurs */
		public function getUnite_x():Number{
			return this.unite_x;
		}
		public function setUnite_x(unite_x:Number):void{
			this.unite_x = unite_x; 
		}
		
		public function getUnite_y():Number{
			return this.unite_y;
		}		
		public function setUnite_y(unite_y:Number):void{
			this.unite_y = unite_y; 
		}
		
		public function getTimer():Timer{
			return this.timer;
		}	
		public function setTimer(timer:Timer):void{
			this.timer = timer;
		}	
		
		public function getObjet():MIObjet{
			return this.objet;
		}	
		public function setObjet(objet:MIObjet):void{
			this.objet = objet;
		}	
	}
}