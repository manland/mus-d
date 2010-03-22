package Coeur.Forme
{
	public class MFormeEllipse implements MIForme
	{
		protected var nom_classe:String;
		protected var largeur:Number;
		protected var hauteur:Number;
		
		public function MFormeEllipse()
		{
			this.largeur = largeur;
			this.hauteur = hauteur;
			this.nom_classe = "MFormeEllipse";
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
			
		}
		
		public function affiche():void
		{
			trace("MEllipse");
		}
		
		public function contient(x:Number,y:Number):Boolean{
			return false;
		}
	}
}