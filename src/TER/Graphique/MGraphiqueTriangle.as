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
	import Controleur.MIEffetFini;
	import Controleur.MRedimensionnement;
	import Controleur.MIEffetInfini;
	import Controleur.MMouvementPerpetuel;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class MGraphiqueTriangle extends MGraphiqueAbstrait
	{
		private var mouvement:MIEffetFini;
		private var mouvement2:MIEffetFini;
		
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
			
			mouvement = new MRedimensionnement(objet);
			mouvement2 = new MMouvementFini(objet);
		}
		
		public function getMouvement():MIEffetFini {
			return mouvement;
		}
		
		public function getMouvement2():MIEffetFini {
			return mouvement2;
		}
		
		override protected function dessiner():void {
			var o:MFormeTriangle = objet.getForme() as MFormeTriangle;
			var aretes:Array = o.getAretes();
			graphics.clear();
			ma_texture.appliquer(graphics);
			var elem:MArete = aretes[0] as MArete;
			graphics.moveTo(elem.getDepart().getX(), elem.getDepart().getY());
			for(var i:Number=0; i<o.getNombreArete(); i++) {
				elem = aretes[i] as MArete;
				graphics.lineTo(elem.getArrivee().getX(), elem.getArrivee().getY());
			}
			graphics.endFill();
		}
	}
}