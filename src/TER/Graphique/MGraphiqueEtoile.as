package Graphique
{
	import Coeur.Forme.MFormeEtoile;
	import Utilitaires.MArete;
	import Controleur.MIEffet;
	import Controleur.MMouvementFini;
	
	public class MGraphiqueEtoile extends MGraphiqueAbstrait
	{
		private var mouvement:MIEffet;
		
		public function MGraphiqueEtoile(x:int=0, y:int=0, largeur:int=50)
		{
			forme = new MFormeEtoile();
			(forme as MFormeEtoile).instancie(x, y, largeur);
			objet.setForme(forme);
			
			mouvement = new MMouvementFini(objet, 400, 400, 1000);
		}
		
		public function getMouvement():MIEffet {
			return mouvement;
		}

		override protected function dessiner():void {
			var o:MFormeEtoile = objet.getForme() as MFormeEtoile;
			var aretes:Array = o.getAretes();
			graphics.clear();
			ma_texture.appliquer(graphics);
			var elem:MArete = aretes[0] as MArete;
			graphics.moveTo(elem.getDepart().getX(), elem.getDepart().getY());
			for(var i:Number=0; i<o.getNombreArete(); i++) {
				elem = aretes[i] as MArete;
				graphics.lineTo(elem.getArrivee().getX(), elem.getArrivee().getY());
				if(sysout != null) {
					sysout.text += "de:"+elem.getDepart().getX()+" - a:"+elem.getArrivee().getX()+"\n";
				}
			}
			graphics.endFill();
		}
	}
}