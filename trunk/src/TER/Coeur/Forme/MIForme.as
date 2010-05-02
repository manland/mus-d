package Coeur.Forme
{
	import Utilitaires.*;
	
	public interface MIForme
	{
		function setX(x:Number):void;
		function getX():Number;
		function setY(y:Number):void;
		function getY():Number;
		function getLargeur():Number;
		function setHauteur(hauteur:Number):void;
		function getHauteur():Number;
		function setLargeur(largeur:Number):void;
		
		function getAire():Number;
		function getNomClasse():String;
		function setNomClasse(nom_classe:String):void;
		function getPerimetre():Number;
		function deplacement(x:Number, y:Number):void;
		function affiche():void;
		function getAxesSeparateurs(obj:MIForme):Array;
 		function getPointsProjection(vect:MVecteur):Array;
 		function seProjeteSur(vecteur:MVecteur):Array;
		
		function clone():MIForme;
		
		function calculMinX():Number;
		function calculMinY():Number;
		function calculMaxX():Number;
		function calculMaxY():Number;
		function getDecalage():MCoordonnee;
		function setDecalage(decalage:MCoordonnee):void;
	
	}
}