package Graphique
{
	import flash.display.Graphics;
	import Coeur.MIObjet;
	import mx.core.UIComponent;
	import flash.display.Shape;
	
	public interface MIObjetGraphique
	{
		function getObjet():MIObjet;
		function getGraphique():UIComponent;
	}
}