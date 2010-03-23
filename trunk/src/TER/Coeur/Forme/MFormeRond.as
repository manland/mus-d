package Coeur.Forme
{
	public class MFormeRond extends MFormeEllipse
	{
		public function MFormeRond()
		{
			super();
			this.nom_classe = "MFormeRond";
		}
		
		public override function instancie(x:Number, y:Number, largeur:Number, hauteur:Number):void{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = largeur;
		}
		
		public override function setLargeur(largeur:Number):void{
			this.largeur = largeur;
			this.hauteur = largeur
		}
		
		public override function setHauteur(hauteur:Number):void{
			this.hauteur = hauteur;
			this.largeur = hauteur;
		}
		
		public function getRayon():Number
		{
			return this.getHauteur();
		}
		
		public override function contient(x:Number,y:Number):Boolean{
			/**a remplir**/
			return false;
		}
		
		public override function getPerimetre():Number
		{
			return 2 * Math.PI * this.getHauteur();
		}
	}
}