package Decor
{
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Graphique.Textures.MCouleur;

	public class Ennemi extends MGraphiqueRond
	{
		protected var scene:MGraphiqueScene;
		public function Ennemi(scene:MGraphiqueScene, x:int=0, y:int=0)
		{
			super(x, y,10,10);
			this.scene = scene;
			super.setTexture(new MCouleur(0x0055ff));
		}
		
	}
}