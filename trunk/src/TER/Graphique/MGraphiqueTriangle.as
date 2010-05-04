package Graphique {
	import Coeur.Forme.MFormeTriangle;
	import flash.display.Shape;
	import Coeur.MIObjet;
	import mx.core.UIComponent;
	import Utilitaires.MArete;
	import Coeur.MElement;
	import Coeur.Forme.MIForme;
	import Utilitaires.MCoordonnee;
	import mx.core.IUIComponent;
	import mx.controls.Alert;
	import mx.controls.Text;
	import flash.display.Loader;
	import flash.utils.getTimer;
	import Graphique.Textures.MITexture;
	import Graphique.Textures.Degrades.MDegrade;
	import Graphique.Textures.Degrades.MDegradeHorizontal;
	import Graphique.Textures.Degrades.MDegradeObliqueDroite;
	import Graphique.Textures.MCouleur;
	import Graphique.Textures.Degrades.MDegradeObliqueGauche;
	import Graphique.Textures.Degrades.MDegradeRadial;
	import Graphique.Textures.Degrades.MDegradeVertical;
	import Coeur.MIObjetEcouteur;
	import mx.events.MoveEvent;
	import Coeur.MDynamique;
	import Controleur.MMouvementFini;
	import Controleur.MRedimensionnement;
	import Controleur.MMouvementPerpetuel;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import Controleur.MIEffet;
	import Graphique.Textures.MBordure;
	import flash.display.Graphics;
	import Utilitaires.MErreur;
	
	public class MGraphiqueTriangle extends MGraphiqueAbstrait implements MIObjetGraphique {
		private var mon_pt1:MCoordonnee;
		private var mon_pt2:MCoordonnee;
		private var mon_pt3:MCoordonnee;
		
		public function MGraphiqueTriangle(point1:MCoordonnee=null, point2:MCoordonnee=null, point3:MCoordonnee=null) {
			if(point1 != null && point2 != null && point3 != null) {
				mon_pt1 = point1;
				mon_pt2 = point2;
				mon_pt3 = point3;
			}
			else {
				mon_pt1 = new MCoordonnee(20, 0);
				mon_pt2 = new MCoordonnee(0, 20);
				mon_pt3 = new MCoordonnee(40, 20);
			}
			forme = new MFormeTriangle();
			(forme as MFormeTriangle).instancie(mon_pt1, mon_pt2, mon_pt3);
			objet.setForme(forme);
			nom_classe = "MGraphiqueTriangle";
		}
		
		public function get point1():MCoordonnee {
			return mon_pt1;
		}
		public function set point1(point1:MCoordonnee):void {
			mon_pt1 = point1;
			(forme as MFormeTriangle).instancie(mon_pt1, mon_pt2, mon_pt3);
			objet.setForme(forme);
		}
		
		public function get point2():MCoordonnee {
			return mon_pt2;
		}
		public function set point2(point2:MCoordonnee):void {
			mon_pt2 = point2;
			(forme as MFormeTriangle).instancie(mon_pt1, mon_pt2, mon_pt3);
			objet.setForme(forme);
		}
		
		public function get point3():MCoordonnee {
			return mon_pt3;
		}
		public function set point3(point3:MCoordonnee):void {
			mon_pt3 = point3;
			(forme as MFormeTriangle).instancie(mon_pt1, mon_pt2, mon_pt3);
			objet.setForme(forme);
		}
		
		override public function deplacementObjet(objet:MIObjet):void {
			super.deplacementObjet(objet);
			var aretes:Array = (objet.getForme() as MFormeTriangle).getAretes();
			mon_pt1 = (aretes[0] as MArete).getDepart();
			mon_pt2 = (aretes[1] as MArete).getDepart();
			mon_pt3 = (aretes[2] as MArete).getDepart();
		}
		
		override public function changementTaille(objet:MIObjet):void {
			super.changementTaille(objet);
			var aretes:Array = (objet.getForme() as MFormeTriangle).getAretes();
			mon_pt1 = (aretes[0] as MArete).getDepart();
			mon_pt2 = (aretes[1] as MArete).getDepart();
			mon_pt3 = (aretes[2] as MArete).getDepart();
		}
		
		override protected function dessiner():void {
			fireSeDessine();
			var o:MFormeTriangle = objet.getForme() as MFormeTriangle;
			var sommets:Array = o.getSommet();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			var elem:MCoordonnee = sommets[0] as MCoordonnee;
			graphics.moveTo(0, 0);
			for(var i:Number=0; i<o.getSommet().length; i++) {
				elem = sommets[i] as MCoordonnee;
				graphics.lineTo(elem.getX()-objet.getX(), elem.getY()-objet.getY());
			}
			graphics.endFill();
		}
		
		static public function dessiner(graphics:Graphics, forme:MIForme, ma_texture:MITexture, ma_bordure:MBordure = null):void {
			var o:MFormeTriangle = forme as MFormeTriangle;
			var sommets:Array = o.getSommet();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			var elem:MCoordonnee = sommets[0] as MCoordonnee;
			graphics.moveTo(0, 0);
			for(var i:Number=0; i<o.getSommet().length; i++) {
				elem = sommets[i] as MCoordonnee;
				graphics.lineTo(elem.getX()-forme.getX(), elem.getY()-forme.getY());
			}
			graphics.endFill();
		}
		
		override public function clone():MIObjetGraphique {
			var graphique_temp:MGraphiqueTriangle = new MGraphiqueTriangle();
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