package Coeur
{
	import Coeur.Forme.*;
	
	public interface MIObjet
	{	
		/**
		 * Il faut représenter l'objet graphique egalement :)
		 * 
		 * **/
		
		
		/**
		* Méthodes des getters et setters
		**/
		function deplacement(x:Number, y:Number):void;
		function getX():Number;
		function setX(x:Number):void;
		function getY():Number;
		function setY(y:Number):void;
		function getLargeur():Number;
		function setLargeur(largeur:Number):void;
		function getHauteur():Number;
		function setHauteur(hauteur:Number):void;
		function ajoutObjetEcouteur(m:MIObjetEcouteur):void;
		function supprimeObjetEcouteur(m:MIObjetEcouteur):void;
		function getNomClasse():String; 
		function setNomClasse(nom_classe:String):void;
		function getEcouteurs():Array;
		function setEcouteurs(ecouteurs:Array):void;
		function getForme():MIForme;
		function setForme(forme:MIForme):void;
		function affiche():void;
		
		/**
		 * Vrais méthodes
		 **/
		function estTouchePar(tx:Number, ty:Number):Boolean;
		function mourir():void;
		function naitre():void;
		function actionCollision(objet:MIObjet):void;
		function actionCollisionBord():void;
		function drag():void;
		 
	}
}