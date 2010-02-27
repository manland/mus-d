package Model
{
	import mx.controls.List;
	import mx.controls.Text;
	
	public class Brique extends Objet implements IModelObjet
	{	
		public function Brique(x:Number = 0, y:Number = 0, largeur:Number = 100, hauteur:Number = 30)
		{
			super(x, y, largeur, hauteur);
			nom = "Brique";
		}
	}
}