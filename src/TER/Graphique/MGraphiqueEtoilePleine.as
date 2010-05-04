package Graphique {
	import Coeur.Forme.MFormeEtoilePleine;
	import flash.display.Graphics;
	import Coeur.Forme.MIForme;
	import Graphique.Textures.MITexture;
	import Graphique.Textures.MBordure;
	import Utilitaires.MArete;
	
	public class MGraphiqueEtoilePleine extends MGraphiqueAbstrait implements MIObjetGraphique {
	
		public function MGraphiqueEtoilePleine(x:int=0, y:int=0, largeur:int=50, tourne:int=0, petit_rayon:int=10) {
			this.largeur = largeur;
			forme = new MFormeEtoilePleine();
			(forme as MFormeEtoilePleine).instancie2(x, y, largeur, rotation, petit_rayon);
			objet.setForme(forme);
			nom_classe = "MGraphiqueEtoilePleine";
		}
		
		public function set tourne(rotation:int):void {
			(forme as MFormeEtoilePleine).setRotation(rotation);
			redessiner();
		}
		
		public function get tourne():int {
			return (forme as MFormeEtoilePleine).getRotation();
		}
		
		public function set petit_rayon(petit_rayon:int):void {
			(forme as MFormeEtoilePleine).setPetitRayon(petit_rayon);
			redessiner();
		}
		
		public function get petit_rayon():int {
			return (forme as MFormeEtoilePleine).getPetitRayon();
		}
		
		override protected function dessiner():void {
			fireSeDessine();
			var aretes:Array = null;
			var o:MFormeEtoilePleine = objet.getForme() as MFormeEtoilePleine;
			aretes = o.getAretes();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			var elem:MArete = aretes[0] as MArete;
			graphics.moveTo(elem.getDepart().getX()-objet.getX(), elem.getDepart().getY()-objet.getY());
			for(var i:Number=0; i<aretes.length; i++) {
				elem = aretes[i] as MArete;
				graphics.lineTo(elem.getArrivee().getX()-objet.getX(), elem.getArrivee().getY()-objet.getY());
			}
			graphics.endFill();
		}
		
		static public function dessiner(graphics:Graphics, forme:MIForme, ma_texture:MITexture, est_vide:Boolean, ma_bordure:MBordure = null):void {
			var aretes:Array = null;
			var o:MFormeEtoilePleine = forme as MFormeEtoilePleine;
			aretes = o.getAretes();
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
		
		override public function clone():MIObjetGraphique {
			var graphique_temp:MGraphiqueEtoilePleine = new MGraphiqueEtoilePleine(x, y, largeur, rotation);
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