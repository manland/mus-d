package Graphique
{
	import Coeur.Forme.MFormeEtoile;
	import Utilitaires.MArete;
	import Controleur.MIEffet;
	import Controleur.MMouvementFini;
	import Controleur.MRedimensionnement;
	import Graphique.Textures.MBordure;
	import Graphique.Textures.MITexture;
	import Coeur.Forme.MFormeEtoilePleine;
	
	public class MGraphiqueEtoile extends MGraphiqueAbstrait
	{
		private var vide:Boolean;
		
		public function MGraphiqueEtoile(x:int=0, y:int=0, largeur:int=50, rotation:int=0, vide:Boolean=false)
		{
			this.vide = vide;
			if(vide) {
				forme = new MFormeEtoile();
				(forme as MFormeEtoile).instancie(x, y, largeur, rotation);
			}
			else {
				forme = new MFormeEtoilePleine();
				(forme as MFormeEtoilePleine).instancie2(x, y, largeur, largeur/5, rotation);
			}
			objet.setForme(forme);
			nom_classe = "MGraphiqueEtoile";
		}

		override protected function dessiner():void {
			var aretes:Array = null;
			if(vide) {
				var o:MFormeEtoile = objet.getForme() as MFormeEtoile;
				aretes = o.getAretes();
			}
			else {
				var oo:MFormeEtoilePleine = objet.getForme() as MFormeEtoilePleine;
				aretes = oo.getAretes();
			}
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			var elem:MArete = aretes[0] as MArete;
			graphics.moveTo(elem.getDepart().getX(), elem.getDepart().getY());
			for(var i:Number=0; i<aretes.length; i++) {
				elem = aretes[i] as MArete;
				graphics.lineTo(elem.getArrivee().getX(), elem.getArrivee().getY());
			}
			graphics.endFill();
		}
	}
}