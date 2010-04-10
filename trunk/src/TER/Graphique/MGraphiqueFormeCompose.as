package Graphique
{
	import Coeur.Forme.MFormeCompose;
	import Coeur.Forme.MIForme;
	import Coeur.Forme.MFormeRectangle;
	import Coeur.Forme.MFormeRond;
	import Coeur.Forme.MFormeTriangle;
	import Utilitaires.MErreur;
	
	public class MGraphiqueFormeCompose extends MGraphiqueAbstrait
	{
		public function MGraphiqueFormeCompose()
		{
			var rectangle:MFormeRectangle = new MFormeRectangle();
            rectangle.instancie(10,10,50,70);
                
            var r:MFormeCompose = new MFormeCompose();
            r.instancie(rectangle);
            r.setFormeBas(rectangle);
            r.setFormeGauche(rectangle);
            r.setFormeDroit(rectangle);
            r.setFormeHaut(rectangle);
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
			var aretes:Array = null;
			var o:MFormeCompose = objet.getForme() as MFormeCompose;
			dessinerRecursion(o);
			graphics.endFill();
		}
		
		private function dessinerRecursion(f:MIForme):void {
//			throw new MErreur("MGraphiqueFormeCompose", "dessinerRecursion", ""+f.affiche());
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
			if(forme_rectangle != null) {
//				throw new MErreur("MGraphiqueFormeCompose", "dessinerRecursion", ""+f);
				MGraphiqueRectangle.dessiner(graphics, forme_rectangle, ma_texture, ma_bordure);
			}
			if(forme_rond != null) {
				MGraphiqueRond.dessiner(graphics, forme_rond, ma_texture, ma_bordure);
			}
			if(forme_triangle != null) {
				MGraphiqueTriangle.dessiner(graphics, forme_triangle, ma_texture, ma_bordure);
			}
		}
		
		override public function clone():MIObjetGraphique {
			return null;
		}
	}
}