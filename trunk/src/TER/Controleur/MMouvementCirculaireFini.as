package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MCoordonnee;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Text;
	
	/**
	 * Sert à appliquer un Mouvement circulaire fini a un objet, l'objet fera un mouvement circulaire d'un angle donné et s'arrêtera
	 */
	public class MMouvementCirculaireFini extends MEffet implements MIEffet
	{
		/**
		 * temps en milliseconde que doit durer le mouvement
		 */
		protected var temps_ms:Number;		
		/**
		 * angle selon lequel doit tourner l'objet toutes les unités de temps
		 */
		protected var unite_angle_degre:Number;
		/**
		 * angle en degre de la rotation que doit effectuer l'objet
		 */
		protected var angle_degre:Number;
		/**
		 * centre de la rotation
		 */
		 protected var centre:MCoordonnee;
		
		/**
		 * construit un mouvement circulaire fini autour du point passé en paramètre, ayant comme angle celui passé en paramètre s'appliquant sur l'objet passé en paramètre
		 * et durant le temps passé en paramètre
		 * @param objet: objet sur lequel s'apllique le mouvement
		 * @param centre: centre du mouvement circulaire
		 * @param angle_degre: angle en degré du mouvement rotatif
		 * @param temps_s: temps en milliseconde que doit durer le mouvement
		 */
		public function MMouvementCirculaireFini(objet:MIObjet, centre:MCoordonnee, angle_degre:Number, temps_ms:Number){
			this.nom_classe = "MMouvementCirculaireFini";
			if (temps_ms < 20)//temps trop court
				this.temps_ms = 20;
			else
				this.temps_ms = temps_ms;
			this.objet = objet;
			this.centre = centre;
			this.angle_degre = angle_degre;
		}
		
		/**
		 * @inheritDoc
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
		 * <p> fait se déplacer l'objet selon le mouvement circulaire d'angle unite_angle_degre  </p>
		 * @param e: evenement du timer qui annonce la fin d'un compte à rebours		 
		 */		
		public function appliqueUnite(e:TimerEvent):void{
			objet.deplacementCirculaire(centre, unite_angle_degre );			
		}
		
		/**
		 * @inheritDoc
		 */
		public function clone():MIEffet{
			var rot:MMouvementCirculaireFini = new MMouvementCirculaireFini(this.objet,centre.clone(),new Number(this.angle_degre),new Number(this.temps_ms));
			return rot;
		}
	}
}