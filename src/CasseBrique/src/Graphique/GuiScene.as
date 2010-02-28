package Graphique
{
	import mx.containers.Canvas;
	import Model.Scene;
	import mx.core.UIComponent;
	import Model.IModelSceneListener;
	import Model.IModelObjet;
	import mx.controls.Text;
	
	public class GuiScene extends Canvas implements IGuiChangeListener
	{
		private var scene:Scene;
		private var enfants:Array;
		private var ecouteurs:Array;
		
		public function GuiScene(largeur:Number, hauteur:Number)
		{
			width = largeur;
			height = hauteur;
			scene = new Scene(width, height);
			enfants = new Array();
			ecouteurs = new Array();
		}
		
		public function addSceneListener(o:IGuiSceneListener):void {
			ecouteurs.push(o);
		}
		
		public function addEnfant(objet:IGuiObjet):void {
			enfants.push(objet);
			addChild(objet.getComponent());
			scene.addEnfant(objet.getObjet());
			objet.addGuiChangeListener(this);
		}
		public function rmEnfant(objet:IGuiObjet):void {
			removeChild(objet.getComponent());
			scene.rmEnfant(objet.getObjet());
			enfants.splice(enfants.indexOf(objet), 1);
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
		
		public function guiNait(objet:IGuiObjet):void {
			
		}
		
		public function guiMeurt(objet:IGuiObjet):void {
			rmEnfant(objet);
		}

	}
}