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
			var x_cercle:Number;
			var y_cercle:Number;
			var rayon:Number;
			x_cercle = this.x + (this.largeur/ 2);
			y_cercle= this.y - (this.hauteur/ 2);
			rayon = this.largeur/2;
			// equation d'un cercle de centre (a,b) et de rayon r : (x − a)²+ (y − b)²  = r²
			if( ( ((x - x_cercle)*(x - x_cercle)) + ((y - y_cercle)*(y - y_cercle)) ) == (rayon * rayon)){
				return true;
			}
			else
				return false;
		}
		
		public override function getPerimetre():Number
		{
			return 2 * Math.PI * this.getHauteur();
		}
	}
}