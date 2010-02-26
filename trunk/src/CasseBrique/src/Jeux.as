package
{
	import Graphique.GuiBalle;
	import Graphique.GuiBar;
	import Graphique.GuiBrique;
	import Graphique.GuiScene;
	import mx.controls.Text;
	import Model.IModelSceneListener;
	import Model.IModelObjet;
	import Model.MouvementBalle;
	
	public class Jeux implements IModelSceneListener
	{
		private var sysout:Text;//Pour débuggage
		
		private var balle:GuiBalle;
		private var barre:GuiBar;
		private var brique:GuiBrique;
		private var scene:GuiScene;
		
		public function Jeux(sysout:Text)
		{
			this.sysout = sysout;
			
			scene = new GuiScene();
			scene.getObjet().addModelSceneListener(this);
			
			balle = new GuiBalle(20, 0, 15, 15);
			brique = new GuiBrique(36, 25);
			barre = new GuiBar(150, 300, 100, 20);
			
			scene.addEnfant(balle);
			scene.addEnfant(brique);
			scene.addEnfant(barre);
		}
		
		public function run():void {
			//Mouvement balle
			var move:MouvementBalle = new MouvementBalle(balle.getObjet());
			move.avance(50, 100, 2000);
		}
		
		public function collision(objet1:IModelObjet, objet2:IModelObjet):void {
			sysout.text += "COLLISION\n";
		}
		
		public function collisionBord(objet:IModelObjet):void {
			
		}
		
		public function getScene():GuiScene {
			return scene;
		}

	}
}