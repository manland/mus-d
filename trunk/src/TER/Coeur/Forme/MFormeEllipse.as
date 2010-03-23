package Coeur.Forme
{
	public class MFormeEllipse implements MIForme
	{
		protected var nom_classe:String;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var x:Number;
		protected var y:Number;
		
		public function MFormeEllipse()
		{
			this.x = 0;
			this.y = 0;
			this.largeur = 0;
			this.hauteur = 0;
			this.nom_classe = "MFormeEllipse";
		}
		
		public function instancie(x:Number, y:Number, largeur:Number, hauteur:Number):void{
			this.x = x;
			this.y = y;
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
			return this.largeur * this.largeur * Math.PI;;
		}
		
		public function getPerimetre():Number
		{
			return 0;
		}
		
		public function getNomClasse():String
		{
			return nom_classe;
		}
		
		public function deplacement(x:Number, y:Number):void
		{
			this.x += x;
			this.y += y;
		}
		
		public function affiche():void
		{
			trace(this.getNomClasse());
		}
		
		public function contient(x:Number,y:Number):Boolean{
			//a remplir
			return false;
		}
		
		public function getX():Number{
			return this.x;
		}
		
		public function getY():Number{
			return this.y;
		}
		 
	}
}