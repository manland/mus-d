package Coeur
{
	public class MFormeRond extends MFormeEllipse
	{
		public function MFormeRond(rayon:Number = 0)
		{
			super(largeur, hauteur);
		}
		
		public function getAire():Number
		{
			return getLargeur() * getLargeur() * Math.PI;
		}
		
	}
}