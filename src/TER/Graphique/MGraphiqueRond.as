package Graphique
{
	import Coeur.Forme.MFormeRond;
	import flash.display.Graphics;
	import Graphique.Textures.MBordure;
	import Graphique.Textures.MITexture;
	import Coeur.Forme.MIForme;
	
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
			fireSeDessine();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			graphics.moveTo(x, y);
			graphics.drawEllipse(x, y, width, height);
			graphics.endFill();
		}
		
		static public function dessiner(graphics:Graphics, forme:MIForme, ma_texture:MITexture, ma_bordure:MBordure = null):void {
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			graphics.moveTo(forme.getX(), forme.getY());
			graphics.drawRect(forme.getX(), forme.getY(), forme.getLargeur(), forme.getHauteur());
			graphics.endFill();
		}
		
		override public function clone():MIObjetGraphique {
			var graphique_temp:MGraphiqueRond = new MGraphiqueRond();
			graphique_temp.setObjet(objet.clone());
			if(ma_bordure != null) {
				graphique_temp.setBordure(ma_bordure.clone() as MBordure);
			}
			if(ma_texture != null) {
				var texture_temp:MITexture = ma_texture.clone();
				graphique_temp.setTexture(texture_temp);
				graphique_temp.redessiner();
			}
			return graphique_temp;
		}

	}
}