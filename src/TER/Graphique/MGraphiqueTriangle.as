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
	
	public class MGraphiqueTriangle extends UIComponent implements MIObjetGraphique, MIObjetEcouteur
	{
		private var objet:MIObjet;
		private var texture:MITexture;
		private var mouvement:MIEffetFini;
		public var sysout:Text;
		private var mon_x:Number;
		private var mon_y:Number;
		
		public function MGraphiqueTriangle(point1:MCoordonnee=null, point2:MCoordonnee=null, point3:MCoordonnee=null)
		{
			objet = new MDynamique();
			objet.ajoutObjetEcouteur(this);
			
			if(point1 != null && point2 != null && point3 != null) {
				var forme:MFormeTriangle = new MFormeTriangle();
				forme.instancie(point1, point2, point3);
				objet.setForme(forme);
				x = objet.getX();
				y = objet.getY();
				width = objet.getLargeur();
				height = objet.getHauteur();
			}
			
			mouvement = new MMouvementFini(objet);
			
			texture = new MDegradeRadial(this);
		}
		
		public function getObjet():MIObjet {
			return objet;
		}
		
		public function getGraphique():UIComponent {
			return this;
		}
		
		public function getTexture():MITexture {
			return texture;
		}
		public function setTexture(texture:MITexture):void {
			this.texture = texture;
			invalidateDisplayList();
		}
		
		public function deplacementObjet(objet:MIObjet):void {
			x = objet.getX();
			y = objet.getY();
			invalidateDisplayList();
		}
		public function changementTaille(objet:MIObjet):void {
//			width = objet.getLargeur();
//			height = objet.getHauteur();
			invalidateDisplayList();
		}
		public function objetMeurt(objet:MIObjet):void {
			sysout.text += "Je neurt !!";
			parent.removeChild(this);
		}
		public function objetNait(objet:MIObjet):void {
			sysout.text += "Je nais !!";
		}
		
		public function getMouvement():MIEffetFini {
			return mouvement;
		}
		
//		override public function set x(x:Number):void {
//			super.x = x;
//			if(objet.getX() != x) {
//				objet.setX(x);
//			}
//		}
//		override public function set y(y:Number):void {
//			super.y = y;
//			if(objet.getY() != y) {
//				objet.setY(y);
//			}
//		}
//		override public function set width(width:Number):void {
//			sysout.text += "setWidth";
//			super.width = width;
//			if(objet.getLargeur() != width) {
////				objet.setLargeur(width);
//			}
//		}
//		override public function set height(height:Number):void {
//			super.height = height;
//			if(objet.getHauteur() != height) {
////				objet.setHauteur(height);
//			}
//		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight );
//			objet.setLargeur(unscaledWidth);
//			objet.setHauteur(unscaledHeight);
			dessiner();
		}
		
		protected function dessiner():void {
			var o:MFormeTriangle = objet.getForme() as MFormeTriangle;
			var aretes:Array = o.getAretes();
			graphics.clear();
			texture.appliquer();
			var elem:MArete = aretes[0] as MArete;
			graphics.moveTo(elem.getDepart().getX(), elem.getDepart().getY());
			for(var i:Number=0; i<o.getNombreArete(); i++) {
				elem = aretes[i] as MArete;
				graphics.lineTo(elem.getArrivee().getX(), elem.getArrivee().getY());
			}
			graphics.endFill();
			
		}
		
//		override protected function commitProperties():void {
//            super.commitProperties();
//			invalidateDisplayList();
//		}

	}
}