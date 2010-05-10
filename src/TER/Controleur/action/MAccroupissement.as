package Controleur.action
{
	import Coeur.MIObjet;
	
	import Controleur.MRedimensionnement;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Text;

	public class MAccroupissement extends MRedimensionnement
	{
		protected var taille_initial:Number;
		protected var pourcentage:Number;
		protected var temps_redim:Number;
		protected var temps_accroupi:Number;
		
		public function MAccroupissement(objet:MIObjet,pourcentage_accroupissement:Number = 0.5,temps_accroupis_ms:Number = 500, temps_descente_monte_ms:Number = 500)
		{
			this.pourcentage = pourcentage_accroupissement;
			this.temps_accroupi = temps_accroupis_ms;
			this.temps_redim = temps_descente_monte_ms;
			super(objet, objet.getHauteur(), objet.getLargeur(), temps_redim);
		}
		
		public override function lancer():void{
			this.taille_initial = objet.getHauteur();
			this.hauteur_arrivee = taille_initial - (taille_initial * pourcentage);
			this.largeur_arrivee = objet.getLargeur();
			super.lancer();
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,resterAccroupi);						
		}
		
		private function resterAccroupi(e:TimerEvent):void{
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,resterAccroupi);
			timer = new Timer(temps_accroupi,1);
			timer.addEventListener(TimerEvent.TIMER,seRelever);
			timer.start();
		}
		
		private function seRelever(e:TimerEvent):void{
			timer.removeEventListener(TimerEvent.TIMER,seRelever);
			this.hauteur_arrivee = taille_initial;
			this.largeur_arrivee = objet.getLargeur();
			super.lancer();
		}
		
	}
}