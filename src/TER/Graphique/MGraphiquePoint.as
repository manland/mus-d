package Graphique {
	import Coeur.Forme.MFormePoint;
	import flash.display.Graphics;
	import Coeur.Forme.MIForme;
	import Graphique.Textures.MITexture;
	import Graphique.Textures.MBordure;
	import Coeur.MIObjet;
	
	public class MGraphiquePoint extends MGraphiqueAbstrait implements MIObjetGraphique {
		
		public function MGraphiquePoint(x:int=0, y:int=0, taille:Number=1) {
			forme = new MFormePoint();
			objet.setForme(forme);
			objet.setX(x);
			objet.setY(y);
			objet.setHauteur(taille);
			objet.setLargeur(taille);
			nom_classe = "MGraphiquePoint";
		}
		
		override protected function dessiner():void {
			fireSeDessine();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			graphics.drawRect(0, 0, forme.getLargeur(), forme.getHauteur());
			graphics.endFill();
		}
		
		static public function dessiner(graphics:Graphics, forme:MIForme, ma_texture:MITexture, ma_bordure:MBordure = null):void {
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			graphics.drawRect(0, 0, forme.getLargeur(), forme.getHauteur());
			graphics.endFill();
		}
		
		override public function clone():MIObjetGraphique {
			var graphique_temp:MGraphiquePoint = new MGraphiquePoint(objet.getX(), objet.getY());
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