package Graphique
{
	import mx.containers.Canvas;
	import Model.Scene;
	import mx.core.UIComponent;
	import Model.IModelSceneListener;
	import Model.IModelObjet;
	import mx.controls.Text;
	
	public class GuiScene extends Canvas implements IModelSceneListener
	{
		private var sysout:Text;
		
		private var scene:Scene;
		private var enfants:Array;
		private var ecouteurs:Array;
		
		public function GuiScene(t:Text)
		{
			sysout = t;
			
			scene = new Scene(sysout);
			scene.addModelSceneListener(this);
			percentWidth = 100;
			percentHeight = 100;
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
		
		public function collision(objet1:IModelObjet, objet2:IModelObjet):void {
			var objet_gui:IGuiObjet = null;
			var objet_gui2:IGuiObjet = null;
			for(var i:int = 0; i < enfants.length && objet_gui == null && objet_gui2 == null; i = i + 1) {
				if((enfants[i] as IGuiObjet).getObjet() == objet1) {
					objet_gui = (enfants[i] as IGuiObjet);
				}
				if((enfants[i] as IGuiObjet).getObjet() == objet2) {
					objet_gui2 = (enfants[i] as IGuiObjet);
				}
			}
			sysout.text += "GuiScene:Collision:taille écouteur:"+ecouteurs.length+"\n";
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IGuiSceneListener).collision(objet_gui, objet_gui2);
			}
		}
		
		public function collisionBord(objet:IModelObjet):void {
			var objet_gui:IGuiObjet = null;
			for(var i:int = 0; i < enfants.length && objet_gui == null; i = i + 1) {
				if((enfants[i] as IGuiObjet).getObjet() == objet) {
					objet_gui = (enfants[i] as IGuiObjet);
				}
			}
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IGuiSceneListener).collisionBord(objet_gui);
			}
		}

	}
}