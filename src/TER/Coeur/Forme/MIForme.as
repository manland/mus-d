package Coeur.Forme
{
	public interface MIForme
	{
		function getAire():Number;
		function getNomClasse():String;
		function getPerimetre():Number;
		function deplacement(x:Number, y:Number):void;
		function affiche():void;
	}
}