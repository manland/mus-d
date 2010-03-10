package Utilitaires
{
	public class MCoordonnee
	{
		protected var nom_classe:String;
		protected var x:Number;
		protected var y:Number;
		
		public function MCoordonnee(x:Number, y:Number)
		{
			this.x = x;
			this.y = y;
			this.nom_classe = "MCoordonnee";
		}
		
		public function getX():Number
		{
			return this.x;
		}
		public function setX(x:Number):void
		{
			this.x = x;
		}
		
		public function getY():Number
		{
			return this.y;
		}
		public function setY(y:Number):void
		{
			this.y = y;
		}
		
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		public function estEgal(coordonnee:MCoordonnee):Boolean
		{
			return this.x == coordonnee.getX() && this.y == coordonnee.getY();
		}

	}
}