package Coeur.Forme
{
	public interface MIForme
	{
		function getX():Number;
		function getY():Number;
		function getLargeur():Number;
		function getHauteur():Number;
		function setLargeur(largeur:Number):void;
		
		function getAire():Number;
		function getNomClasse():String;
		function getPerimetre():Number;
		function deplacement(x:Number, y:Number):void;
		function affiche():void;
		function contient(x:Number, y:Number):Boolean;
	
	}
}