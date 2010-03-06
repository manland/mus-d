package Utilitaires
{
	public class MArete
	{
		protected var nom_classe:String;
		protected var depart:MCoordonnee;
		protected var arrivee:MCoordonnee;
		
		public function MArete()
		{
			this.nom_classe = "MArete";
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

	}
}