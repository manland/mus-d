package Utilitaires
{
	public class MArete
	{
		protected var nom_classe:String;
		protected var depart:MCoordonnee;
		protected var arrivee:MCoordonnee;
		
		public function MArete(depart:MCoordonnee, arrivee:MCoordonnee)
		{
			this.depart = depart;
			this.arrivee = arrivee;
			this.nom_classe = "MArete";
		}
		
		public function initialise(depart:MCoordonnee, arrivee:MCoordonnee):void
		{
			this.depart = depart;
			this.arrivee = arrivee;
		}
		public function initialise2(xa:Number, ya:Number, xb:Number, yb:Number):void
		{
			this.depart = new MCoordonnee(xa,ya);
			this.arrivee = new MCoordonnee(xb,yb);
		}
		
		public function getDepart():MCoordonnee
		{
			return this.depart;
		}
		public function setDepart(depart:MCoordonnee):void
		{
			this.depart = depart;
		}
		
		public function getArrivee():MCoordonnee
		{
			return this.arrivee;
		}
		public function setArrivee(arrivee:MCoordonnee):void
		{
			this.arrivee = arrivee;
		}
		
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		public function longueur():Number
		{
			var xa:Number = depart.getX();
			var ya:Number = depart.getY();
			
			var xb:Number = arrivee.getX();
			var yb:Number = arrivee.getY();
			
			return Math.sqrt( Math.pow(xb - xa, 2) + Math.pow(yb - ya,2));
		}
		
		public function estEgal(arete:MArete):Boolean
		{
			if((this.depart.estEgal(arete.getDepart()) && this.arrivee.estEgal(arete.getArrivee())) ||
				this.depart.estEgal(arete.getArrivee()) && this.arrivee.estEgal(arete.getDepart()))
				return true;
			return false;
		}
		
		public function ontUnPointCommun(arete:MArete):Boolean
		{
			if(!this.estEgal(arete) && ( 
			this.depart.estEgal(arete.getDepart()) ||
			this.depart.estEgal(arete.getArrivee())||
			this.arrivee.estEgal(arete.getDepart())||
			this.arrivee.estEgal(arete.getArrivee())))
				return true;
			return false;
		}
		
		public function affiche():void
		{
			trace("("+depart.getX()+","+depart.getY()+")-("+arrivee.getX()+","+arrivee.getY()+")");
		}
		
		public function contient(x:Number, y:Number):Boolean{
			var x1:Number = getArrivee().getX();
			var x2:Number = getDepart().getX();
			var y1:Number = getArrivee().getY();
			var y2:Number = getDepart().getY()
			var a :Number;
			var b:Number;
			
			if(x1 != x2){
				a = (y2 - y1) / (x2 - x1);
				b = y1 - (a * x1);
				return y == (a*x + b) && ((y1 <= y && y<= y2) || (y2 <= y && y<= y1));
			}
			else
				return x1 == x && ((y1 <= y && y<= y2) || (y2 <= y && y<= y1)) ;
		}
		
		public function clone():MArete{
			
			var clone_depart:MCoordonnee = this.depart.clone();
			var clone_arrivee:MCoordonnee = this.arrivee.clone();
			
			var clone_marete:MArete = new MArete(clone_depart, clone_arrivee);
			return clone_marete;
		}
		
		public function deplacement(x:Number, y:Number):void {
			this.depart.deplacement(x,y);
			this.arrivee.deplacement(x,y);
		}
		
		public function tourne(centre:MCoordonnee, angle_degre:Number):void{
			this.getArrivee().tourne(centre, angle_degre);
			this.getDepart().tourne(centre, angle_degre);
		}

	}
}