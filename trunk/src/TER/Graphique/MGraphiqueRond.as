package Graphique
{
	import Controleur.MIEffetFini;
	import Controleur.MRedimensionnement;
	import Controleur.MMouvementFini;
	import Coeur.Forme.MFormeRond;
	import flash.display.Graphics;
	
	public class MGraphiqueRond extends MGraphiqueAbstrait
	{
		private var mouvement:MIEffetFini;
		private var mouvement2:MIEffetFini;
		
		public function MGraphiqueRond(x:int=0, y:int=0, largeur:int=30, hauteur:int=30)
		{
			forme = new MFormeRond();
			(forme as MFormeRond).instancie(x, y, largeur, hauteur);
			objet.setForme(forme);
			
			mouvement = new MMouvementFini(objet);
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
			ma_texture.appliquer(graphics);
			graphics.moveTo(x, y);
			graphics.drawEllipse(x, y, width, height);
			graphics.endFill();
		}

	}
}