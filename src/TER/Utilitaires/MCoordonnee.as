package Utilitaires
{
	public class MCoordonnee
	{
		protected var nom_classe:String;
		protected var x:Number;
		protected var y:Number;
		
		public function MCoordonnee(x:Number=0, y:Number=0)
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
		
		public function deplacement(x:Number, y:Number):void
		{
			this.x += x;
			this.y += y;
		}
		
		public function clone():MCoordonnee{
			var clone_x:Number = new Number(x);
			var clone_y:Number = new Number(y);
			
			return new MCoordonnee(clone_x, clone_y);
		}
		
		public function affiche():void{
			trace(this.nom_classe,": (",this.x,",",this.y,")");
		}

	}
}