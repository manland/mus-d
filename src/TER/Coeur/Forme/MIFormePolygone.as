package Coeur.Forme
{
	public interface MIFormePolygone extends MIForme
	{
		/**
		 * Représentation des cotés et des angles ?
		 * créer une classe coté ayant 2 points chaque point ayant des coordonnées ?
		 * */
		 
		
		
		function getAretes():Array;
		function setAretes(aretes:Array):void;
		function getSommeAngles():Number;
		function getNombreArete():Number;
		function setNombreArete(nombre_arete:Number):void;
	}
}