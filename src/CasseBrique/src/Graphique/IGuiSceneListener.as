package Graphique
{
	import Graphique.IGuiObjet;
	
	public interface IGuiSceneListener
	{
		function collision(objet1:IGuiObjet, objet2:IGuiObjet):void;
		function collisionBord(objet:IGuiObjet):void;
	}
}