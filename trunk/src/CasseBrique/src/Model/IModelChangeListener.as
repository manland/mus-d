package Model
{
	public interface IModelChangeListener
	{
		function modelChangeX(o:IModelObjet):void;
		function modelChangeY(o:IModelObjet):void;
		function modelChangeLargeur(o:IModelObjet):void;
		function modelChangeHauteur(o:IModelObjet):void;
		function modelMeurt(o:IModelObjet):void;
		function modelNait(o:IModelObjet):void;
	}
}