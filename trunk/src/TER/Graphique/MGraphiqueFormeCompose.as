package Graphique
{
	import Coeur.Forme.MFormeCompose;
	import Coeur.Forme.MIForme;
	import Coeur.Forme.MFormeRectangle;
	import Coeur.Forme.MFormeRond;
	import Coeur.Forme.MFormeTriangle;
	import Utilitaires.MErreur;
	import Utilitaires.MCoordonnee;
	import Coeur.Forme.MFormeEtoile;
	
	public class MGraphiqueFormeCompose extends MGraphiqueAbstrait implements MIObjetGraphique
	{
		public function MGraphiqueFormeCompose()
		{
			var rectangle:MFormeRectangle = new MFormeRectangle();
            rectangle.instancie(10,10,50,70);
            var triangle:MFormeTriangle = new MFormeTriangle();
            triangle.instancie(new MCoordonnee(40, 0), new MCoordonnee(0, 40), new MCoordonnee(40, 40));
            var eto:MFormeEtoile = new MFormeEtoile();
            eto.instancie(50, 50, 60);
            
            var r:MFormeCompose = new MFormeCompose();
            r.instancie(rectangle);
            r.setFormeBas(triangle);
            r.setFormeGauche(rectangle);
            r.setFormeDroit(triangle);
            r.setFormeHaut(rectangle);
            r.setX(100);
            r.setY(100);
			nom_classe = "MGraphiqueFormeCompose";
			
			forme = r;
			objet.setForme(forme);
		}
		
		override protected function dessiner():void {
			fireSeDessine();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			dessinerRecursion(objet.getForme());
			graphics.endFill();
		}

		private function dessinerRecursion(f:MIForme):void {
			var forme_compose:MFormeCompose = f as MFormeCompose;
			var forme_rectangle:MFormeRectangle = f as MFormeRectangle;
			var forme_rond:MFormeRond = f as MFormeRond;
			var forme_triangle:MFormeTriangle = f as MFormeTriangle;
			if(forme_compose != null) {
				dessinerRecursion(forme_compose.getFormeCentre());
				dessinerRecursion(forme_compose.getFormeDroit());
				dessinerRecursion(forme_compose.getFormeGauche());
				dessinerRecursion(forme_compose.getFormeHaut());
				dessinerRecursion(forme_compose.getFormeBas());
			}
			else if(forme_rectangle != null) {
				MGraphiqueRectangle.dessiner(graphics, forme_rectangle, ma_texture, ma_bordure);
			}
			else if(forme_rond != null) {
				MGraphiqueRond.dessiner(graphics, forme_rond, ma_texture, ma_bordure);
			}
			else if(forme_triangle != null) {
				MGraphiqueTriangle.dessiner(graphics, forme_triangle, ma_texture, ma_bordure);
			}
		}
		
		override public function clone():MIObjetGraphique {
			return null;
		}
	}
}