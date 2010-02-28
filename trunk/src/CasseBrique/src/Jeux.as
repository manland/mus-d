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
	import Model.Balle;
	import flash.ui.Mouse;
	import Controleur.MSouris;
	import Controleur.MIEcouteurSouris;
	
	public class Jeux
	{
		private static var sysout:Text;//Pour débuggage
		
		private var balle:GuiBalle;
		private var barre:GuiBar;
		private var brique:GuiBrique;
		private var scene:GuiScene;
		
		public function Jeux(s:Text)
		{
			sysout = s;
			
			balle = new GuiBalle(20, 1, 15, 15);
			brique = new GuiBrique(50, 100);
			barre = new GuiBar(150, 350, 100, 20);

			scene = new GuiScene(800, 400);			
			scene.addEnfant(balle);
			scene.addEnfant(brique);
			scene.addEnfant(barre);
		}
		
		public function run():void {
			Mouse.hide();
			var souris:MSouris = new MSouris(scene, Jeux.getSysout());
			souris.ajouterEcouteur(barre.getObjet() as MIEcouteurSouris);
			(balle.getObjet() as Balle).run();
		}
		
		public function getScene():GuiScene {
			return scene;
		}
		
		public static function getSysout():Text {
			return sysout;
		}

	}
}