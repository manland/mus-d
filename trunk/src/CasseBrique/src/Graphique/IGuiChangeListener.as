package Graphique
{
	public interface IGuiChangeListener
	{
		function guiNait(objet:IGuiObjet):void;
		function guiMeurt(objet:IGuiObjet):void;
	}
}