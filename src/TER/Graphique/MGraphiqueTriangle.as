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
	
	public class MGraphiqueTriangle extends UIComponent implements MIObjetGraphique
	{
		private var objet:MIObjet;
		private var texture:MITexture;
		private var sysout:Text;
		public function MGraphiqueTriangle(sysout:Text)
		{
			this.sysout = sysout;
			
			var x:Number = 20;
			var y:Number = 20;
			objet = new MElement();
			var forme:MFormeTriangle = new MFormeTriangle();
			forme.ajouterArete(new MArete(new MCoordonnee(x, y),new MCoordonnee(x+20, y+20)));
			forme.ajouterArete(new MArete(new MCoordonnee(x+20, y+20), new MCoordonnee(x-40, y+20)));
			forme.ajouterArete(new MArete(new MCoordonnee(x-40, y+20), new MCoordonnee(x, y)));
			objet.setForme(forme);
			objet.setX(x);
			objet.setY(y);
			objet.setLargeur(40);
			objet.setHauteur(20);
			
			texture = new MCouleur(this);
			
			this.x = x;
			this.y = y;
			width = 40;
			height = 20;
		}
		
		public function getObjet():MIObjet {
			return objet;
		}
		
		public function getGraphique():UIComponent {
			return this;
		}
		
		public function dessiner():void {
			var o:MFormeTriangle = objet.getForme() as MFormeTriangle;
			var aretes:Array = o.getAretes();
			graphics.moveTo(x, y);
			texture.appliquer();
			for(var i:Number=0; i<o.getNombreArete(); i++) {
				var elem:MArete = aretes[i] as MArete;
				graphics.lineTo(elem.getArrivee().getX(), elem.getArrivee().getY());
			}
			graphics.endFill();
		}
		
		public function getTexture():MITexture {
			return texture;
		}
		public function setTexture(texture:MITexture):void {
			this.texture = texture;
		}

	}
}