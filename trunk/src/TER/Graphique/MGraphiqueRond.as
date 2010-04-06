package Graphique
{
	import Coeur.Forme.MFormeRond;
	import flash.display.Graphics;
	import Graphique.Textures.MBordure;
	import Graphique.Textures.MITexture;
	
	public class MGraphiqueRond extends MGraphiqueAbstrait
	{
		
		public function MGraphiqueRond(x:int=0, y:int=0, largeur:int=30, hauteur:int=30)
		{
			forme = new MFormeRond();
			(forme as MFormeRond).instancie(x, y, largeur, hauteur);
			objet.setForme(forme);
			nom_classe = "MGraphiqueRond";
		}
		
		override protected function dessiner():void {
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			graphics.moveTo(x, y);
			graphics.drawEllipse(x, y, width, height);
			graphics.endFill();
		}

	}
}