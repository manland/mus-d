package Decor
{
	import Coeur.MIObjet;
	
	import Graphique.MGraphiqueScene;
	
	import Utilitaires.MAxe;

	public class MaGraphiqueScene extends MGraphiqueScene
	{
		public function MaGraphiqueScene(x:int=0, y:int=0, largeur:int=30, hauteur:int=10)
		{
			super(x, y, largeur, hauteur);
			this.objet = new MaScene();
		}
		
		public override function objetCollision(objet:MIObjet, axe:MAxe):void {
			super.objetCollision(objet,axe);
		}
		
		
	}
}