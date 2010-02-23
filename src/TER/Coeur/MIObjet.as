package Coeur
{
	import flash.display.Graphics;
	import Graphique.MIGraphique;
	
	public interface MIObjet
	{	
		function dessiner(graphisme:MIGraphique):void;
		function getX():Number;
		function getY():Number;
		function getLargeur():Number;
		function getHauteur():Number;
		function getGraphics():Graphics;
	}
}