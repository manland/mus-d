package Controleur
{
	import Utilitaires.*;
	
	import flash.events.MouseEvent;
	
	import mx.core.Application;

	/**
	 * Classe qui prévient les écouteurs de Souris lorsque la souris effectue une action en appelant la fonction correspondante
	 * Cette classe est un singleton, elle n'a qu'une instance: ne pas utiliser le constructeur mais getInstance pour l'implémenter!!
	 * @see Controleur.MIEcouteurSouris
	 */
	public class MSouris
	{
		/**
		 * unique instance de MSouris
	 	 */
		private static var instance:MSouris = null;
		/**
		 * ancienne abscisse de la souris
	 	 */
		private var ancienX:Number;
		/**
		 * ancienne ordonnée de la souris
	 	 */
		private var ancienY:Number;
		
		/**
		 * liste des écouteurs de souris
	 	 */
		protected var ecouteurs:Array;
		
		/**
		 * si il n'y a pas déjà d'instance crée: Crée un objet MSouris et l'inscrit comme écouteur de l'application pour être prévenu lorsque la souris effectue une action
	 	 * sinon génère une erreur
	 	 */
		public function MSouris()
		{
			if(instance == null){
				instance = this;
				ancienX = -1;
				ancienY = -1;
				ecouteurs = new Array();	
				Application.application.addEventListener(MouseEvent.CLICK, clic);
				Application.application.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClic);
				Application.application.addEventListener(MouseEvent.MOUSE_MOVE, bouge);
			}
			else {
				throw new MErreur("MSouris", "MSouris()", "Utiliser getInstance pour obtenir une instance de MSouris!!");
			}			
		}
		
		/**
		 * Crée l'unique instance de MSouris si elle n'existe pas déjà et la renvoie
		 * @return l'unique instance de MSouris
		 */
		 public static function getInstance():MSouris{
		 	if(instance == null)
		 		instance = new MSouris();
		 	return instance;
		 }
		
		/**
		 * ajoute un écouteur à la liste des écouteurs de souris
		 * @param ecouteur: nouvel écouteur de souris
	 	 */
		public function ajouterEcouteur( ecouteur:MIEcouteurSouris):void
		{
			ecouteurs.push(ecouteur);
		}
		/**
		 * enlève un écouteur à la liste des écouteurs de souris
		 * @param ecouteur: écouteur de souris à enlever
	 	 */
		public function enleverEcouteur( ecouteur:MIEcouteurSouris):void
		{
			var temp:Array = MUtilitaire.enlever(ecouteurs,ecouteur);
			ecouteurs = temp;
		}
		
		/**
		 * fonction appelée lorsque la souris est cliquée
		 * @param evt: évenement souris contenant des informations sur le clic
	 	 */
		private function clic(evenement : MouseEvent):void
		{
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				ecouteurs[i].clic(evenement);
			}
		}
		
		/**
		 * fonction appelée lorsque la souris se déplace
		 * @param evt: évenement souris contenant des informations sur le déplacement
	 	 */
		private function bouge(evenement : MouseEvent):void
		{
			// coordonneé de l'évenement
			var x:Number = evenement.stageX;
			var y:Number = evenement.stageY;
			
			if(ancienX != -1 && ancienY != -1){
				if(x -  ancienX < 0){// se déplace vers la gauche
					for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
						ecouteurs[i].bougeGauche();
					}
				}
				if(x -  ancienX > 0){// se déplace vers la droite
						for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
							ecouteurs[i].bougeDroite();
						}
				}
				if(y -  ancienY < 0){ // se déplace vers le haut
					for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
						ecouteurs[i].bougeHaut();
					}
				}
				if(y -  ancienY > 0){ // se déplace vers le bas
					for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
						ecouteurs[i].bougeBas();
					}
				}				
			}
			ancienX = x;
			ancienY = y;		
		}
		
		/***
		 * fonction appelée lorsque la souris est doucble-cliquée
		 * @param evt: évenement souris contenant des informations sur le double-clic
	 	 */
		private function doubleClic(evenement : MouseEvent):void
		{
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				ecouteurs[i].doubleClic(evenement);
			}
		}
		
	}
}