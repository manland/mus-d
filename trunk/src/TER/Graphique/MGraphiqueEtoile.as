package Graphique {
	import Coeur.Forme.MFormeEtoile;
	import Utilitaires.MArete;
	import Controleur.MIEffet;
	import Controleur.MMouvementFini;
	import Controleur.MRedimensionnement;
	import Graphique.Textures.MBordure;
	import Graphique.Textures.MITexture;
	import Coeur.Forme.MFormeEtoilePleine;
	import flash.display.Graphics;
	import Coeur.Forme.MIForme;
	
	public class MGraphiqueEtoile extends MGraphiqueAbstrait implements MIObjetGraphique {

		public function MGraphiqueEtoile(x:int=0, y:int=0, largeur:int=50, tourne:int=0) {
			forme = new MFormeEtoile();
			(forme as MFormeEtoile).instancie(x, y, largeur, rotation);
			objet.setForme(forme);
			this.largeur = largeur;
			nom_classe = "MGraphiqueEtoile";
		}
		
		public function set tourne(rotation:int):void {
			(forme as MFormeEtoile).setRotation(rotation);
			redessiner();
		}
		
		public function get tourne():int {
			return (forme as MFormeEtoile).getRotation();
		}

		override protected function dessiner():void {
			fireSeDessine();
			var aretes:Array = null;
			var o:MFormeEtoile = objet.getForme() as MFormeEtoile;
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
			var o:MFormeEtoile = forme as MFormeEtoile;
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
			var graphique_temp:MGraphiqueEtoile = new MGraphiqueEtoile(x, y, largeur, rotation);
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