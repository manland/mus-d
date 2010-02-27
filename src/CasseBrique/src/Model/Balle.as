package Model
{
	import mx.controls.Text;
	
	public class Balle extends Objet implements IModelObjet
	{
		public function Balle(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			super(x, y, largeur, hauteur);
			nom = "Balle";
		}
	}
}