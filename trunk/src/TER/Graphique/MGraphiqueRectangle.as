package Graphique
{
	import Coeur.MIObjet;
	import Utilitaires.MCoordonnee;
	import Coeur.Forme.MFormeRectangle;
	import flash.display.Graphics;
	import Graphique.Textures.MBordure;
	import Graphique.Textures.MITexture;
	
	public class MGraphiqueRectangle extends MGraphiqueAbstrait
	{
		
		public function MGraphiqueRectangle(x:int=0, y:int=0, largeur:int=30, hauteur:int=10)
		{
			forme = new MFormeRectangle();
			(forme as MFormeRectangle).instancie(x, y, largeur, hauteur);
			objet.setForme(forme);
			nom_classe = "MGraphiqueRectangle";
		}
		
		override protected function dessiner():void {
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			graphics.moveTo(x, y);
			graphics.drawRect(x, y, width, height);
			graphics.endFill();
		}
	}
}