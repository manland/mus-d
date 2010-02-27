package Model
{
	import mx.controls.Text;
	import Controleur.Clavier;
	import mx.core.UIComponent;
	import Controleur.IClavierListener;
	
	public class Barre extends Objet implements IModelObjet, IClavierListener
	{
		public function Barre(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			super(x, y, largeur, hauteur);
			nom = "Barre";
			
			//Objet controlé par clavier
			var clavier:Clavier = new Clavier();
			clavier.addIClavierListener(this);
		}
		
		public function toucheBas():void {
			setY(y + 1);
		}
		
		public function toucheHaut():void {
			setY(y - 1);
		}
		
		public function toucheDroite():void {
			setX(x + 1);
		}
		
		public function toucheGauche():void {
			setX(x - 1);
		}
	}
}