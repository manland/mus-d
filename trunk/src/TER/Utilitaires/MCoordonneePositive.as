package Utilitaires
{
	public class MCoordonneePositive extends MCoordonnee
	{
		public function MCoordonneePositive(x:Number, y:Number)
		{
			this.nom_classe = "MCoordonneePositive";
			if(x <0 || y<0)
				throw new MErreur(this.nom_classe, "MCoordonneePositive", "x ou y invalide");
			this.x = x;
			this.y = y;
		}
		
		public override function setX(x:Number):void
		{
			if(x <0)
				throw new MErreur(this.nom_classe, "setX", "x invalide");
			this.x = x;
		}
		
		public override function setY(y:Number):void
		{
			if(y <0)
				throw new MErreur(this.nom_classe, "setY", "y invalide");
			this.y = y;
		}
		
		public override function deplacement(x:Number, y:Number):void
		{
			if(this.x + x < 0 || this.y + y < 0)
				throw new MErreur(this.nom_classe, "deplacement", "x ou y invalide");
			this.x += x;
			this.y += y;
		}
		
		public override function clone():MCoordonnee{			
			var clone_x:Number = new Number(x);
			var clone_y:Number = new Number(y);
			
			return new MCoordonneePositive(clone_x, clone_y);
		}
		
	}
}