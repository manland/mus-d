package Coeur.Forme
{
	public class MFormeRond extends MFormeEllipse
	{
		public function MFormeRond(rayon:Number = 0)
		{
			nom_classe = "MFormeRond";
		}
		
		public function setRayon(rayon:Number):void
		{
			setLargeur(rayon);
			setHauteur(rayon);
		}
		
		public function getRayon():Number
		{
			return this.getHauteur();
		}
		
		public override function contient(x:Number,y:Number):Boolean{
			/**a remplir**/
			return false;
		}
	}
}