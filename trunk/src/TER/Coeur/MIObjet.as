package Coeur
{
	import Coeur.Forme.*;
	
	import Utilitaires.MAxe;
	
	public interface MIObjet
	{	
		/*
		* Méthodes des getters et setters
		*/
		
		//nom:
		function getNomClasse():String;
		//forme:
		function getForme():MIForme;
		function setForme(forme:MIForme):void;
		//coordonnées:
		function deplacement(x:Number, y:Number):void;
		function getX():Number;
		function setX(x:Number):void;
		function getY():Number;
		function setY(y:Number):void;
		//taille:
		function redimensionnement(l:Number,h:Number):void;
		function getLargeur():Number;
		function setLargeur(largeur:Number):void;
		function getHauteur():Number;
		function setHauteur(hauteur:Number):void;
		//écouteurs:
		function getEcouteurs():Array;
		function ajoutObjetEcouteur(m:MIObjetEcouteur):void;
		function supprimeObjetEcouteur(m:MIObjetEcouteur):void;

		//fonction de débeuggage
		function affiche():void;
		
		/**
		 * Vrais méthodes
		 **/
		function mourir():void;
		function naitre():void;
		function actionCollision(objet:MIObjet,axe:MAxe):void;
		function clone():MIObjet;
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
		 
	}
}