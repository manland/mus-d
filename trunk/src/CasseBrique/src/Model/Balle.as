package Model
{
	import mx.controls.Text;
	
	public class Balle extends Objet implements IModelObjet
	{
		private var move:MouvementBalle;
		private var touche_bord_haut:Boolean;
		public function Balle(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			super(x, y, largeur, hauteur);
			nom = "Balle";
			//Mouvement balle
			move = new MouvementBalle(this);
			
		}
		
		override public function actionCollision(objet:IModelObjet):void {
			touche_bord_haut = false;
			move.avance((getX() - move.getXOrigine()) * 2, move.getYOrigine(), 2000);
		}
		override public function actionCollisionBord():void {
			if(getY() < 0 && !touche_bord_haut) {
				touche_bord_haut = true;
				move.avance((getX() - move.getXOrigine()) * 2, -200, 2000);
			}
		}
		
		public function run():void {
			move.avance(50, 100, 2000);
		}
	}
}