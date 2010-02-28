package Graphique
{
	import mx.core.UIComponent;
	import Model.IModelObjet;
	
	public interface IGuiObjet
	{
		function getComponent():UIComponent;
		function getObjet():IModelObjet;
		function addGuiChangeListener(m:IGuiChangeListener):void;
		function mourir():void;
		function naitre():void;
	}
}