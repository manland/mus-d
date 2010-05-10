package Controleur
{
	import Utilitaires.MErreur;
	
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.core.Application; 
	
	/**
	 * Classe qui prévient les écouteurs de Clavier lorsque le clavier est appuyé en appellant leur fonction correspondante
	 * Cette classe est un singleton, elle n'a qu'une instance: ne pas utiliser le constructeur mais getInstance pour l'implémenter!!
	 * @see Controleur.MIEcouteurClavier
 	 */
	public class MClavier
	{
		/**
		 * liste des écouteurs de clavier
	 	 */
		protected var ecouteurs:Array;
		
		/**
		 * unique instance de MClavier
		 */
		static private var instance:MClavier = null;
		
		/**
		 * si il n'y a pas déjà d'instance crée: Crée un objet MClavier et l'inscrit comme écouteur de l'application pour être prévenu lorsque le clavier est appuyé
		 * sinon génère une erreur
	 	 */
		public function MClavier() {
			if(instance == null){
				instance = this;
				Application.application.addEventListener(KeyboardEvent.KEY_DOWN, appui);
				ecouteurs = new Array();
			}
			else {
				throw new MErreur("MClavier", "MClavier()", "Utiliser getInstance pour obtenir une instance de MClavier!!");
			}
		}
		
		/**
		 * Crée l'unique instance de MClavier si elle n'existe pas déjà et la renvoie
		 * @return l'unique instance de MClavier
		 */
		 public static function getInstance():MClavier{
		 	if(instance == null)
		 		instance = new MClavier();
		 	return instance;
		 }
		
		/**
		 * ajoute un écouteur à la liste des écouteurs de clavier
		 * @param m: nouvel écouteur de clavier
	 	 */
		public function ajouterEcouteur(m:MIEcouteurClavier):void {
			ecouteurs.push(m);
		}
		/**
		 * enlève un écouteur à la liste des écouteurs de clavier
		 * @param m: écouteur de clavier à enlever
	 	 */
		public function enleverEcouteur(m:MIEcouteurClavier):void {
			ecouteurs.slice(ecouteurs.indexOf(m), 1);
		}
		
		/**
		 * fonction appelée lorsque le clavier est appuyé
		 * @param evt: évenement clavier indiquant quelle touche est appuyée
	 	 */
		private function appui(evt:KeyboardEvent):void {
			switch(evt.keyCode)
			{
				// appui sur la fleche gauche
				case Keyboard.LEFT:
					appuiFlecheGauche();
					break;
				// appui sur la fleche haut
				case Keyboard.UP:
					appuiFlecheHaut();
					break;
				// appui sur la fleche droite
				case Keyboard.RIGHT:
					appuiFlecheDroite();
					break;
				// appui sur la fleche bas
				case Keyboard.DOWN:
					appuiFlecheBas();
					break;   
					
				// appui sur entree
				case Keyboard.ENTER:
					appuiEntree();
					break;
				
				// appui sur espace
				case Keyboard.SPACE:
					appuiEspace();
					break; 
				
				default:
                    appuiTouche(evt.keyCode);
                    break;                                 
			}
		}
		
		/**
		 * fonction appelée lorsque la flèche gauche est appuyée
		 * <p> appelle la fonction flecheGauche des écouteurs de clavier </p>
		 * @see Controleur.MIEcouteurClavier.flecheGauche
	 	 */
		private function appuiFlecheGauche():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).flecheGauche();
			}
		}
		
		/**
		 * fonction appelée lorsque la flèche droite est appuyée
		 * <p> appelle la fonction flecheDroite des écouteurs de clavier </p>
		 * @see Controleur.MIEcouteurClavier.flecheDroite
	 	 */
		private function appuiFlecheDroite():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).flecheDroite();
			}
		}
		
		/**
		 * fonction appelée lorsque la flèche haut est appuyée
		 * <p> appelle la fonction flecheHaut des écouteurs de clavier </p>
		 * @see Controleur.MIEcouteurClavier.flecheHaut
	 	 */
		private function appuiFlecheHaut():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).flecheHaut();
			}
		}
		
		/**
		 * fonction appelée lorsque la flèche bas est appuyée
		 * <p> appelle la fonction flecheBas des écouteurs de clavier </p>
		 * @see Controleur.MIEcouteurClavier.flecheBas
	 	 */
		private function appuiFlecheBas():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).flecheBas();
			}
		}
		
		/**
		 * fonction appelée lorsque la touche Entrée est appuyée
		 * <p> appelle la fonction entree des écouteurs de clavier </p>
		 * @see Controleur.MIEcouteurClavier.entree
	 	 */
		private function appuiEntree():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).entree();
			}
		}
		
		/**
		 * fonction appelée lorsque la touche Espace est appuyée
		 * <p> appelle la fonction espace des écouteurs de clavier </p>
		 * @see Controleur.MIEcouteurClavier.espace
	 	 */
		private function appuiEspace():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).espace();
			}
		}
		
		/**
		 * fonction appelée lorsque une touche autre que celle repérée est appuyée
		 * <p> appelle la fonction touche des écouteurs de clavier </p>
		 * @param touche: code de la touche appuyée
		 * @see Controleur.MIEcouteurClavier.touche
	 	 */
		private function appuiTouche(touche:uint):void {
            for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
                    (ecouteurs[i] as MIEcouteurClavier).touche(touche);
            }
        }


	}
}