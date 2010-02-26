package Model
{
	public interface IModelSceneListener
	{
		function collision(objet1:IModelObjet, objet2:IModelObjet):void;
		function collisionBord(objet:IModelObjet):void;
	}
}