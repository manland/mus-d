package Coeur
{
	import Coeur.Forme.*;
	
	import Graphique.MIObjetGraphique;
	
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	
	/**
	 * interface introduisant les méthodes d'un objet du jeu coté modèle.
	 */
	public interface MIObjet
	{	
		/*
		* Méthodes des getters et setters
		*/
		
		//nom:
		/**
		 * retourne le nom de la classe de l'objet receveur
		 */
		function getNomClasse():String;
		
		//forme:
		/**
		 * retourne la forme de l'objet receveur
		 * @return la forme de type MIForme de l'objet receveur
		 */
		function getForme():MIForme;
		/**
		 * remplace la forme de l'objet receveur par celle passée en paramètre
		 * @param forme: nouvelle forme de l'objet receveur
		 */
		function setForme(forme:MIForme):void;
		
		//objet graphique
		/**
		 * retourne l'objet graphique qui lui est associé coté vue et qui écoute l'objet receveur
		 */
		function getObjetGraphique():MIObjetGraphique;
		/**
		 * remplace l'objet graphique qui lui est associé coté vue et qui écoute l'objet receveur par celui passé en paramètre
		 * @param objet_graphique: nouvel objet graphique qui écoute celui ci
		 */
		function setObjetGraphique(objet_graphique:MIObjetGraphique):void ;
		
		
		//coordonnées:
		/**
		 * déplace l'objet receveur en ajoutant à ses coordonnées les valeurs passées en paramètre
		 * @param x: valeur en pixel que l'on doit ajouter à l'abscisse de l'objet receveur
		 * @param y: valeur en pixel que l'on doit ajouter à l'ordonnée de l'objet receveur
		 */
		function deplacement(x:Number, y:Number):void;
		/**
		 * déplace l'objet receveur selon le mouvement circulaire de centre et d'angle passés en paramètre
		 * @param centre: coordonnées du centre du mouvement circulaire que l'on veut faire effectuer à l'objet receveur
		 * @param angle_degre: angle en degré de l'angle du mouvement circulaire que l'on veut faire effectuer à l'objet receveur
		 */
		function deplacementCirculaire(centre:MCoordonnee, angle_degre:Number):void;
		/**
		 * fait effectuer la rotation de centre et d'angle passés en paramètre à l'objet receveur
		 * @param centre: coordonnées du centre de la rotation que l'on veut faire effectuer à l'objet receveur
		 * @param angle_degre: angle en degré de la rotation que l'on veut faire effectuer à l'objet receveur
		 */
		function tourne(centre:MCoordonnee,angle_degre:Number):void;
		/**
		 * retourne la valeur d'abscisse de l'objet receveur
		 * @return valeur d'abscisse en pixel de l'objet receveur
		 */
		function getX():Number;
		/**
		 * remplace la valeur d'abscisse de l'objet receveur par celle passée en paramètre
		 * @param x: nouvelle valeur d'abscisse en pixel de l'objet receveur
		 */
		function setX(x:Number):void;
		/**
		 * retourne la valeur d'ordonnée de l'objet receveur
		 * @return valeur d'ordonnée en pixel de l'objet receveur
		 */
		function getY():Number;
		/**
		 * remplace la valeur d'ordonnée de l'objet receveur par celle passée en paramètre
		 * @param x: nouvelle valeur d'ordonnée en pixel de l'objet receveur
		 */
		function setY(y:Number):void;
		/**
		 * fonction à appeler lorsque l'objet receveur de se déplace, elle prévient les écouteurs de celui ci qu'il s'est déplacé
		 */
		function fireDeplacementObjet():void;
		
		//taille:
		/**
		 * redimensionne l'objet receveur en ajoutant à sa hauteur et largeur les valeurs passées en paramètre
		 * @param l: valeur en pixel à ajouter à la largeur de l'objet receveur
		 * @param h: valeur en pixel à ajouter à la hauteur de l'objet receveur
		 */
		function redimensionnement(l:Number,h:Number):void;
		/**
		 * retourne la largeur de l'objet receveur
		 * @return largeur en pixel de l'objet receveur en pixel
		 */
		function getLargeur():Number;
		/**
		 * remplace la largeur de l'objet receveur par celle passée en paramètre
		 * @param largeur: nouvelle largeur en pixel de l'objet receveur
		 */
		function setLargeur(largeur:Number):void;
		/**
		 * retourne la hauteur de l'objet receveur
		 * @return hauteur en pixel de l'objet receveur en pixel
		 */
		function getHauteur():Number;
		/**
		 * remplace la hauteur de l'objet receveur par celle passée en paramètre
		 * @param hauteur: nouvelle hauteur en pixel de l'objet receveur
		 */
		function setHauteur(hauteur:Number):void;
		/**
		 * fonction à appeler lorsque la taille de l'objet receveur change, elle prévient les écouteurs de celui ci qu'il a changé de taille
		 */
		function fireChangementTaille():void;
		
		//écouteurs:
		/**
		 * retourne la liste d'écouteurs de l'objet receveur
		 * @return array contenant les écouteurs de type MIObjetEcouteur de l'objet receveur
		 */
		function getEcouteurs():Array;
		/**
		 * ajoute l'objet écouteur passé en paramètre aux écouteurs de l'objet receveur
		 * @param m: objet écouteur que l'on veut ajouter aux écouteurs de l'objet receveur
		 */
		function ajoutObjetEcouteur(m:MIObjetEcouteur):void;
		/**
		 * enlève l'objet écouteur passé en paramètre des écouteurs de l'objet receveur
		 * @param m: objet écouteur que l'on veut enlever des écouteurs de l'objet receveur
		 */
		function supprimeObjetEcouteur(m:MIObjetEcouteur):void;

		// Vrais méthodes
		/**
		 * fonction à appeler lorsque l'on veut détruire l'objet receveur
		 */
		function mourir():void;
		/**
		 * fonction appelé lorsque l'objer nait
		 */
		function naitre():void;
		/**
		 * renvoie une nouvelle instance clone de l'objet receveur
		 * @return une nouvelle instance clone de l'objet receveur
		 */
		function clone():MIObjet;
		
		//collision
		/**
		 * fonction appelée lorsqu'une collision est detectée sur l'objet
		 * @param objet: objet avec lequel la collision a lieu
		 */
		function actionCollision(objet:MIObjet,axe:MAxe):void;
		/**
 		 * retourne l'axe selon lequel collisionne l'objet receveur et celui passé en paramètre ou null si ils ne collisionnent pas
 		 * <p> cette fonction appelle la fonction d'axeCollision de sa forme</p>
 		 * @see Coeur.MForme.axeCollision
 		 * @param objet: objet pour lequel on cherche l'axe de collision
 		 * @return axe selon lequelle a lieu la collision entre l'objet receveur et celui passé en paramètre ou null s'il n'y a pas collision
 		 */	
		function axeCollision(objet:MIObjet):MAxe;
		/**
		 * vérifie si l'objet passé en paramètre est proche de l'objet receveur
		 * <p>retourne vrai si les coordonnés de l'enveloppe rectangulaire de l'objet receveur chevauchent celles de l'objet passé en paramètre </p>
		 * @param objet: objet dont on veut savoir s'il est près de l'objet receveur
		 * @return vrai si l'objet passé en paramètre est proche de l'objet receveur
		 */
		function estProcheDe(objet:MIObjet):Boolean;
		
		//début et fin du jeu
		/**
		 * fonction à appeler au début du jeu. Appelle fireDebutJeu
		 * @see Coeur.MIObjet.fireDebutJeu
		 */
		function debut():void;
		/**
		 * fonction à appeler à la fin du jeu. Appelle fireDebutJeu
		 * * @see Coeur.MIObjet.fireFinJeu
		 */
		function fin():void;
		/**
		 * Fonction à appeler lorsque le jeu débute. Préviens les écouteurs de l'objet receveur que le jeu a commencé.
		 */
		function fireDebutJeu():void;
		/**
		 * Fonction à appeler lorsque le jeu termine. Préviens les écouteurs de l'objet receveur que le jeu est terminé.
		 */
		function fireFinJeu():void;
		
	}
}