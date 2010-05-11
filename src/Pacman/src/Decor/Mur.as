package Decor
{
	import Graphique.MGraphiqueRectangle;
	import Graphique.MGraphiqueScene;
	import Graphique.Textures.MCouleur;
	
	public class Mur extends MGraphiqueRectangle
	{
		protected var scene:MGraphiqueScene;
		public function Mur(scene:MGraphiqueScene, x:Number, y:Number, taille:Number, couleur:Number=0xBD8D46)
		{
			super(x,y, taille,taille);
			this.scene = scene;
			this.nom_classe = "Mur";
			super.setTexture(new MCouleur(couleur));
		}
	}
}