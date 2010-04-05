package Coeur.Forme
{
	import Utilitaires.MAxe;
	
	public interface MIForme
	{
		function getX():Number;
		function getY():Number;
		function getLargeur():Number;
		function setHauteur(hauteur:Number):void;
		function getHauteur():Number;
		function setLargeur(largeur:Number):void;
		
		function getAire():Number;
		function getNomClasse():String;
		function getPerimetre():Number;
		function deplacement(x:Number, y:Number):void;
		function affiche():void;
		function axeCollision(x:Number, y:Number):MAxe;
	
	}
}