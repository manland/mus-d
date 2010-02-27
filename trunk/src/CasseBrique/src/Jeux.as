package
{
	import Graphique.GuiBalle;
	import Graphique.GuiBar;
	import Graphique.GuiBrique;
	import Graphique.GuiScene;
	import Graphique.IGuiSceneListener;
	import Graphique.IGuiObjet;
	import mx.controls.Text;
	import Model.MouvementBalle;
	
	public class Jeux implements IGuiSceneListener
	{
		private var sysout:Text;//Pour débuggage
		
		private var balle:GuiBalle;
		private var barre:GuiBar;
		private var brique:GuiBrique;
		private var scene:GuiScene;
		
		public function Jeux(sysout:Text)
		{
			this.sysout = sysout;
			
			scene = new GuiScene(sysout);
			scene.addSceneListener(this);
			
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
		
		public function collision(objet1:IGuiObjet, objet2:IGuiObjet):void {
			sysout.text = "Collision entre "+objet1.getObjet().getNom()+" et "+objet2.getObjet().getNom()+"\n";
			if(objet1.getObjet().getNom() == "Balle" && objet2.getObjet().getNom() == "Brique") {
				scene.rmEnfant(brique);
			}
			else if (objet1.getObjet().getNom() == "Brique" && objet2.getObjet().getNom() == "Balle") {
				scene.rmEnfant(brique)
			}
		}
		
		public function collisionBord(objet:IGuiObjet):void {
			
		}
		
		public function getScene():GuiScene {
			return scene;
		}

	}
}