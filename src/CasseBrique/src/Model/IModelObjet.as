package Model
{
	import mx.controls.Text;
	
	public interface IModelObjet
	{
		function getX():Number;
		function setX(x:Number):void;
		function getY():Number;
		function setY(y:Number):void;
		function getLargeur():Number;
		function getHauteur():Number;
		function addModelChangeListener(m:IModelChangeListener):void;
		function rmModelChangeListener(m:IModelChangeListener):void;
		function estTouchePar(tx:Number, ty:Number):Boolean;
		function getNom():String;
		function mourir():void;
		function naitre():void;
		function actionCollision(objet:IModelObjet):void;
		function actionCollisionBord():void;
	}
}