package Controleur
{
	import Coeur.MIObjet;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class MRedimensionnement implements MIEffet
	{
		private var objet:MIObjet;
		private var timer:Timer;
		private var unite_largeur:Number;
		private var unite_hauteur:Number;
		private var largeur_arrivee:Number;
		private var hauteur_arrivee:Number;
		private var temps_ms:Number;
		
		public function MRedimensionnement(objet:MIObjet,largeur_arrivee:Number, hauteur_arrivee:Number, temps_ms:Number){
			this.objet = objet;
			this.largeur_arrivee = largeur_arrivee;
			this.hauteur_arrivee = hauteur_arrivee;
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
			unite_largeur = (largeur_arrivee - objet.getLargeur())/ nb_unite_tp;
			unite_hauteur = (hauteur_arrivee - objet.getHauteur())/ nb_unite_tp;
			
			timer = new Timer(20, nb_unite_tp);
			timer.addEventListener(TimerEvent.TIMER, redimentionneUneUnite);
			timer.start();
		}
				
		private function redimentionneUneUnite(e:TimerEvent):void{
			objet.setLargeur(objet.getLargeur() + unite_largeur);
			objet.setHauteur(objet.getHauteur() + unite_hauteur);
		}
		
		public function stopper():void{
			timer.stop();
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

	}
}