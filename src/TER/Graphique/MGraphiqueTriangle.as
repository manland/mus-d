package Graphique
{
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
	
	public class MGraphiqueTriangle extends MGraphiqueAbstrait
	{
		
		public function MGraphiqueTriangle(point1:MCoordonnee=null, point2:MCoordonnee=null, point3:MCoordonnee=null)
		{
			if(point1 != null && point2 != null && point3 != null) {
				forme = new MFormeTriangle();
				(forme as MFormeTriangle).instancie(point1, point2, point3);
				objet.setForme(forme);
			}
			else {
				forme = new MFormeTriangle();
				(forme as MFormeTriangle).instancie(new MCoordonnee(20, 0), new MCoordonnee(0, 20), new MCoordonnee(40, 20));
				objet.setForme(forme);
			}
			nom_classe = "MGraphiqueTriangle";
		}
		
		override protected function dessiner():void {
			fireSeDessine();
			var o:MFormeTriangle = objet.getForme() as MFormeTriangle;
			var aretes:Array = o.getAretes();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			var elem:MArete = aretes[0] as MArete;
			graphics.moveTo(elem.getDepart().getX(), elem.getDepart().getY());
			for(var i:Number=0; i<o.getNombreArete(); i++) {
				elem = aretes[i] as MArete;
				graphics.lineTo(elem.getArrivee().getX(), elem.getArrivee().getY());
			}
			graphics.endFill();
		}
		
		static public function dessiner(graphics:Graphics, forme:MIForme, ma_texture:MITexture, ma_bordure:MBordure = null):void {
			var o:MFormeTriangle = forme as MFormeTriangle;
			var aretes:Array = o.getAretes();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			var elem:MArete = aretes[0] as MArete;
			graphics.moveTo(elem.getDepart().getX(), elem.getDepart().getY());
			for(var i:Number=0; i<o.getNombreArete(); i++) {
				elem = aretes[i] as MArete;
				graphics.lineTo(elem.getArrivee().getX(), elem.getArrivee().getY());
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