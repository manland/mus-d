package Coeur
{
	public class MFormeEllipse implements MIForme
	{
		protected var largeur:Number;
		protected var hauteur:Number;
		
		public function MFormeEllipse(largeur:Number = 0, hauteur:Number = 0)
		{
			this.largeur = largeur;
			this.hauteur = hauteur;
		}
		
		public function getLargeur():Number
		{
			return this.largeur;
		}
		public function setLargeur(largeur:Number):void
		{
			this.largeur = largeur;
		}
		
		public function getHauteur():Number
		{
			return this.hauteur;
		}
		public function setHauteur(hauteur:Number):void
		{
			this.hauteur = hauteur;
		}

		public function getAire():Number
		{
			return 0;
		}
		
		public function getNomClasse():String
		{
			return null;
		}
		
	}
}