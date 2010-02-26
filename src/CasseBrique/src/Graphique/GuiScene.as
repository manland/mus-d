package Graphique
{
	import mx.containers.Canvas;
	import Model.Scene;
	import mx.core.UIComponent;
	import Model.IModelSceneListener;
	import Model.IModelObjet;
	
	public class GuiScene extends Canvas
	{
		private var scene:Scene;
		
		public function GuiScene()
		{
			scene = new Scene();
			percentWidth = 100;
			percentHeight = 100;
		}
		
		public function addEnfant(objet:IGuiObjet):void {
			addChild(objet.getComponent());
			scene.addEnfant(objet.getObjet());
		}
		
		public function getHauteur():Number {
			return height;
		}
		public function getLargeur():Number {
			return width;
		}
		
		public function getComponent():UIComponent {
			return this;
		}
		public function getObjet():Scene {
			return scene;
		}

	}
}