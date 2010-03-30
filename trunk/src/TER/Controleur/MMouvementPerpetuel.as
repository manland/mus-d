package Controleur
{
	import Coeur.MIObjet;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class MMouvementPerpetuel implements MIEffet
	{
		private var objet:MIObjet;
		private var timer:Timer;
		private var unite_x:Number;
		private var unite_y:Number;
		private var vitesse_px_s_X:Number;
		private var vitesse_px_s_Y:Number;
		
		public function MMouvementPerpetuel(objet:MIObjet,vitesse_px_s_X:Number, vitesse_px_s_Y:Number)
		{
			this.objet = objet;
			this.vitesse_px_s_X = vitesse_px_s_X;
			this.vitesse_px_s_Y = vitesse_px_s_Y;
		}
		
		public function lancer():void{
			//remise a zéro si ce n'est pas fait
			if(timer != null) {
				stopper();
			}
			//calcul du déplacement à faire en une unité de temps
			var unite_x:Number = vitesse_px_s_X * 0.02;
			var unite_y:Number = vitesse_px_s_Y * 0.02;
			
			//on lance le timer toutes les 20 ms indéfiniment
			lancerTimer(20, 0);
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
		
		//axe_obstacle est égale à 
		// 0 si l'axe de l'obstacle est parallèle à celui des x
		// 1 si il est parallèle à celui des y
		// 2 si il est parallèle à y = x
		// 3 si il est parallèle à y = -x
		public function rebondir(axe_obstacle:int ){
			if(axe_obstacle == 0){ //x
				setUnite_y( - getUnite_y());
			}
			else if(axe_obstacle == 1){ //y
				setUnite_x( - getUnite_x());
			}	
			else if(axe_obstacle == 2){// y = x
				var i:Number = getUnite_x();	
				setUnite_x( getUnite_y());
				setUnite_y(i);
			}
			else if(axe_obstacle == 3){// y = -x
				var i:Number = getUnite_x();	
				setUnite_x( - getUnite_y());
				setUnite_y(- i);
			}
		}
		
		/* getteurs et setteurs */
		public function getObjet():MIObjet{
			return this.objet;
		}	
		public function setObjet(objet:MIObjet):void{
			this.objet = objet;
		}	
		
		public function getTimer():Timer{
			return this.timer;
		}	
		public function setTimer(timer:Timer):void{
			this.timer = timer;
		}	
		
		public function getUnite_x():Number{
			return this.unite_x;
		}
		public function setUnite_x(unite_x:Number){
			this.unite_x = unite_x; 
		}
		
		public function getUnite_y():Number{
			return this.unite_y;
		}		
		public function setUnite_y(unite_y:Number){
			this.unite_y = unite_y; 
		}
		
		
	}
}