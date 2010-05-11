package Coeur
{
	import Utilitaires.MAxe;
	/**
	 * interface introduisant les méthodes à un 'écouteur d'un objet coté modèle. Les méthodes sont celles appelée 
	 * lorsqu'un évenement particulier arrive à cet objet
	 */
	public interface MIObjetEcouteur
	{
		/**
		 * fonction appelée lorsque l'objet écouté se déplace
		 */
		function deplacementObjet(objet:MIObjet):void;
		/**
		 * fonction appelée lorsque l'objet écouté change de taille
		 */
		function changementTaille(objet:MIObjet):void;
		/**
		 * fonction appelée lorsque l'objet écouté meurt
		 */
		function objetMeurt(objet:MIObjet):void;
		/**
		 * fonction appelée lorsque l'objet écouté nait
		 */
		function objetNait(objet:MIObjet):void;
		/**
		 * fonction appelée lorsque l'objet écouté est en collision
		 */
		function objetCollision(objet:MIObjet, axe:MAxe):void;
		/**
		 * fonction appelée lorsque le jeu débute
		 */
		function debutDuJeu(objet:MIObjet):void;
		/**
		 * fonction appelée lorsque le jeu termine
		 */
		function finDuJeu(objet:MIObjet):void;
	}
}