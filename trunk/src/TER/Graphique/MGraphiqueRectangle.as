package Graphique {
	import Coeur.MIObjet;
	import Utilitaires.MCoordonnee;
	import Coeur.Forme.MFormeRectangle;
	import flash.display.Graphics;
	import Graphique.Textures.MBordure;
	import Graphique.Textures.MITexture;
	import Coeur.Forme.MIForme;
	import Utilitaires.MArete;
	
	public class MGraphiqueRectangle extends MGraphiqueAbstrait implements MIObjetGraphique {
		
		public function MGraphiqueRectangle(x:int=0, y:int=0, largeur:int=30, hauteur:int=10) {
			forme = new MFormeRectangle();
			(forme as MFormeRectangle).instancie(x, y, largeur, hauteur);
			objet.setForme(forme);
			nom_classe = "MGraphiqueRectangle";
		}
		
		override protected function dessiner():void {
			var aretes:Array = null;
			var o:MFormeRectangle = forme as MFormeRectangle;
			aretes = o.getAretes();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			var elem:MArete = aretes[0] as MArete;
			graphics.moveTo(elem.getDepart().getX()-forme.getX(), elem.getDepart().getY()-forme.getY());
			for(var i:Number=0; i<aretes.length; i++) {
				elem = aretes[i] as MArete;
				graphics.lineTo(elem.getArrivee().getX()-forme.getX(), elem.getArrivee().getY()-forme.getY());
			}
			graphics.endFill();
		}
		
		static public function dessiner(graphics:Graphics, forme:MIForme, ma_texture:MITexture, ma_bordure:MBordure = null):void {
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			graphics.drawRect(forme.getX()-forme.getX(), forme.getY()-forme.getY(), forme.getLargeur(), forme.getHauteur());
			graphics.endFill();
		}

		override public function clone():MIObjetGraphique {
			var graphique_temp:MGraphiqueRectangle = new MGraphiqueRectangle();
			graphique_temp.setObjet(objet.clone());
			graphique_temp.width = objet.getLargeur();
			graphique_temp.height = objet.getHauteur();
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