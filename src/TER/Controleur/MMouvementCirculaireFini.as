package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MCoordonnee;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Text;
	
	public class MMouvementCirculaireFini extends MEffet implements MIEffet
	{
		public var sysout:Text;
		/**
		 * temps en milliseconde que doit durer le mouvement
		 */
		private var temps_ms:Number;		
		/**
		 * angle selon lequel doit tourner l'objet toutes les unités de temps
		 */
		private var unite_angle_degre:Number;
		/**
		 * angle en degre de la rotation que doit effectuer l'objet
		 */
		private var angle_degre:Number;
		/**
		 * centre de la rotation
		 */
		 private var centre:MCoordonnee;
		
		public function MMouvementCirculaireFini(objet:MIObjet, centre:MCoordonnee, angle_degre:Number, temps_ms:Number){
			if (temps_ms < 20)//temps trop court
				this.temps_ms = 20;
			else
				this.temps_ms = temps_ms;
			this.objet = objet;
			this.centre = centre;
			this.angle_degre = angle_degre;
		}
		
		/**
		 * 
		 */
		 public function lancer():void{
		 	//calcul du nombre d'unité de temps pour le mouvement pour avoir 50 images/sec => 1 image / 20 ms
			var nb_unite_tp:int = temps_ms /20;
			//calcul de la rotation à faire en une unité de temps
			unite_angle_degre = angle_degre / nb_unite_tp;	
			
		 	lancerTimer(20,nb_unite_tp);
		 }
		 
		/**
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * <p>  </p>		 
		 */		
		public function appliqueUnite(e:TimerEvent):void{
			objet.deplacementCirculaire(centre, unite_angle_degre );			
		}
		
		public function clone():MIEffet{
			var rot:MMouvementCirculaireFini = new MMouvementCirculaireFini(this.objet,centre.clone(),new Number(this.angle_degre),new Number(this.temps_ms));
			return rot;
		}
	}
}