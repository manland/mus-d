package Graphique
{
	import Coeur.MIObjet;
	import Utilitaires.MCoordonnee;
	import Coeur.Forme.MFormeRectangle;
	import Controleur.MIEffetFini;
	import Controleur.MRedimensionnement;
	import Controleur.MMouvementFini;
	
	public class MGraphiqueRectangle extends MGraphiqueAbstrait
	{
		private var mouvement:MIEffetFini;
		private var mouvement2:MIEffetFini;
		
		public function MGraphiqueRectangle(x:int=0, y:int=0, largeur:int=30, hauteur:int=10)
		{
			forme = new MFormeRectangle();
			(forme as MFormeRectangle).instancie(x, y, largeur, hauteur);
			objet.setForme(forme);
			
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
			graphics.clear();
			ma_texture.appliquer();
			graphics.moveTo(x, y);
			graphics.drawRect(x, y, width, height);
			graphics.endFill();
		}
	}
}