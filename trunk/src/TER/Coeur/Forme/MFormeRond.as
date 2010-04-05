package Coeur.Forme
{
	import Utilitaires.MAxe;
	
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
		
		public override function axeCollision(x:Number,y:Number):MAxe{
			var x_cercle:Number;
			var y_cercle:Number;
			var rayon:Number;
			x_cercle = this.x + (this.largeur/ 2);
			y_cercle= this.y - (this.hauteur/ 2);
			rayon = this.largeur/2;
			// equation d'un cercle de centre (a,b) et de rayon r : (x − a)²+ (y − b)²  = r²
			if( ( ((x - x_cercle)*(x - x_cercle)) + ((y - y_cercle)*(y - y_cercle)) ) == (rayon * rayon)){
				var axe:MAxe = new MAxe();
				var tiers:Number = this.largeur/3; 
				if(x <= (this.x + 2*tiers) && x >= (this.x + tiers)){
					axe.setAxe(0);
				}
				else if(y >= (this.y - 2*tiers) && y <= (this.y - tiers)){
					axe.setAxe(1);
				}
				else if( (y >= (this.y - tiers) && x <= (this.x + tiers)) || (y <= (this.y - 2*tiers) && x >= (this.x + 2*tiers)) ) {
					axe.setAxe(2);
				}
				else
					axe.setAxe(3);
				return axe;
			}
			else
				return null;
		}
		
		public override function getPerimetre():Number
		{
			return 2 * Math.PI * this.getHauteur();
		}
	}
}