package Coeur.Forme
{
	public class MFormeRectangle implements MIFormePolygone
	{
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var nom_classe:String;
		
		public function MFormeRectangle()
		{
			this.x = 0;
			this.y = 0;
			this.largeur = 0;
			this.hauteur = 0;
			this.nom_classe = "MFormeRectangle";
		}
		
		public function instancie(x:Number, y:Number, largeur:Number, hauteur:Number):void{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = hauteur;
		}
		
		public function affiche():void
		{
			trace(this.getNomClasse());
		}
		
		public function deplacement(x:Number, y:Number):void{
			this.x += x;
			this.y += y;
		}
		
		public function getAire():Number{
			return this.largeur * this.hauteur;
		}
		
		public function getPerimetre():Number{
			return 2*this.largeur + 2*this.hauteur;
		}
		
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		public function contient(x:Number,y:Number):Boolean{
			return false;
		}
		
		public function getAretes():Array
		{
			return null;
		}
		
		public function getX():Number{
			return this.x;
		}
		
		public function getY():Number{
			return this.y;
		}
		
		public function setLargeur(largeur:Number):void{
			this.largeur = largeur;
		}
		
		public function getLargeur():Number{
			return this.largeur;
		}
		
		public function setHauteur(hauteur:Number):void{
			this.hauteur = hauteur;
		}
		
		public function getHauteur():Number{
			return this.hauteur;
		}
		
		public function getNombreArete():Number{
			return 0;
		}
		
		public function getSommeAngles():Number{
			return 360;
		}
		
		public function setAretes(aretes:Array):void
		{
		}
		public function setNombreArete(nombre_arete:Number):void{
			
		}
	}
}