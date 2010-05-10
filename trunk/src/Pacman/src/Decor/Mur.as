package Decor
{
	import Coeur.Elements.MObstacle;
	
	import Graphique.MGraphiqueRectangle;
	import Graphique.MGraphiqueScene;
	import Graphique.Textures.MCouleur;
	
	public class Mur extends MGraphiqueRectangle
	{
		
		protected var scene:MGraphiqueScene;
		public function Mur(scene:MGraphiqueScene, x:Number, y:Number)
		{
			super(x,y, 20,20);
			this.scene = scene;
			this.nom_classe = "Mur";
			super.setTexture(new MCouleur(0xff0000));
		}
	}
}