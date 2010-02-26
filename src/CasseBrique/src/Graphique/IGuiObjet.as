package Graphique
{
	import mx.core.UIComponent;
	import Model.IModelObjet;
	
	public interface IGuiObjet
	{
		function getComponent():UIComponent;
		function getObjet():IModelObjet;
	}
}