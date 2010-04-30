package Utilitaires
{
	public class MVecteur
	{
		
		protected var nom_classe:String;
		protected var x:Number;
		protected var y:Number;
		
		public function MVecteur(){
			this.nom_classe = "MVecteur";
		}
		
		public function instancie(x:Number, y:Number)
		{	
			this.x = x;
			this.y = y;
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
	
		public function getNorme():Number{
			return Math.sqrt( getX() * getX() + getY() * getY());
		}	
		
		public function clone():MVecteur{
			var clone_x:Number = new Number(x);
			var clone_y:Number = new Number(y);
			var clone:MVecteur = new MVecteur();
			clone.instancie(clone_x, clone_y);
			
			return clone;
		}
		
		public function entreDeuxPoint(pt_a:MCoordonnee,pt_b:MCoordonnee){
			this.instancie(pt_b.getX() - pt_a.getX(), pt_b.getY() - pt_a.getY());
		}
		
		public function getNormal():MVecteur{
			var normal:MVecteur = new MVecteur();
			normal.instancie( -this.getY(), this.getX());
			return normal;
		}
		
		public function normalise():void{
			var norme:Number = this.getNorme();
			if(norme != 0){
				setX(getX()/norme);
				setY(getY()/norme);
			}
		}
	}
}