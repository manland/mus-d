package Graphique {
	import Coeur.Forme.MForme;
	import Coeur.Forme.MFormeSegment;
	import Utilitaires.MCoordonnee;
	import flash.display.Graphics;
	import Coeur.Forme.MIForme;
	import Graphique.Textures.MITexture;
	import Graphique.Textures.MBordure;
	
	public class MGraphiqueSegment extends MGraphiqueAbstrait implements MIObjetGraphique {
		
		public function MGraphiqueSegment(depart:MCoordonnee=null, arrivee:MCoordonnee=null) {
			forme = new MFormeSegment();
			if(depart == null) {
				depart = new MCoordonnee(0, 0);
			}
			if(arrivee == null) {
				arrivee = new MCoordonnee(20, 20);
			}
			(forme as MFormeSegment).instancie(depart, arrivee);
			objet.setForme(forme);
			nom_classe = "MGraphiqueSegment";
			bordure = new MBordure();
		}
		
		public function get depart():MCoordonnee {
			return (forme as MFormeSegment).getDepart();
		}
		
		public function set depart(depart:MCoordonnee):void {
			(forme as MFormeSegment).setDepart(depart);
			redessiner();
		}
		
		public function get arrivee():MCoordonnee {
			return (forme as MFormeSegment).getArrivee();
		}
		
		public function set arrivee(arrivee:MCoordonnee):void {
			(forme as MFormeSegment).setArrivee(arrivee);
			redessiner();
		}
		
		override protected function dessiner():void {
			fireSeDessine();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			var f:MFormeSegment = forme as MFormeSegment;
			graphics.moveTo(f.getDepart().getX()-objet.getX(), f.getDepart().getY()-objet.getY());
			graphics.lineTo(f.getArrivee().getX()-objet.getX(), f.getArrivee().getY()-objet.getY());
			graphics.endFill();
		}
		
		static public function dessiner(graphics:Graphics, forme:MIForme, ma_texture:MITexture, ma_bordure:MBordure = null):void {
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			var f:MFormeSegment = forme as MFormeSegment;
			graphics.moveTo(f.getDepart().getX()-f.getX(), f.getDepart().getY()-f.getY());
			graphics.lineTo(f.getArrivee().getX()-f.getX(), f.getArrivee().getY()-f.getY());
			graphics.endFill();
		}
		
		override public function clone():MIObjetGraphique {
			var graphique_temp:MGraphiqueSegment = new MGraphiqueSegment(depart.clone(), arrivee.clone());
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