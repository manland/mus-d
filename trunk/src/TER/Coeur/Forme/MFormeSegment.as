package Coeur.Forme
{
	import Coeur.MUtilitaire;
	
	import Utilitaires.MCoordonnee;
	import Utilitaires.MErreur;
	import Utilitaires.MVecteur;

	public class MFormeSegment extends MForme implements MIForme
	{
		protected var depart:MCoordonnee;
		protected var arrivee:MCoordonnee;
		
		public function MFormeSegment()
		{
			super();
			this.nom_classe = "MFormeSegment";
		}
		
		public function instancie(depart:MCoordonnee, arrivee:MCoordonnee){
			if(depart  == null || arrivee == null){
				throw new MErreur(this.nom_classe, "instancie", "depart ou arrivee incorrect");
			}
			this.depart = depart;
			this.arrivee = arrivee;
			
			this.x = MUtilitaire.min(depart.getX(), arrivee.getX());
			this.y = MUtilitaire.min(depart.getY(), arrivee.getY());
			var max_x:Number = MUtilitaire.max(depart.getX(), arrivee.getX());
			var max_y:Number = MUtilitaire.max(depart.getY(), arrivee.getY());
			
			this.largeur = max_x - this.x;
			this.hauteur = max_y - this.y;
		}
		
		public override function setX(x:Number):void{
			var difference:Number = x - this.x;
			depart.deplacement(difference, 0);
			arrivee.deplacement(difference, 0);
			this.x = x;
		}
		
		public override function setY(y:Number):void{
			var difference:Number = this.y - y;
			depart.deplacement(0, difference);
			arrivee.deplacement(0, difference);
			this.y = y;
		}
		
		public override function setLargeur(largeur:Number):void{
			var difference:Number = largeur - this.largeur;
			
			if(arrivee.getX() > depart.getX())
				arrivee.deplacement(difference, 0);
			else
				depart.deplacement(difference, 0);
			this.largeur = largeur;
		}
		
		public override function setHauteur(hauteur:Number):void{
			var difference:Number = hauteur - this.hauteur;
			
			if(arrivee.getY() > depart.getY())
				arrivee.deplacement(0,difference);
			else
				depart.deplacement(0,difference);
			this.hauteur = hauteur;
		}
		
		public override function affiche():void
		{
			trace(this.nom_classe,": (",x,",",y,")");
			trace("Decalage: (",this.decalage.getX(),",",this.decalage.getY(),")");
			trace("Depart: (",this.depart.getX(),",",this.depart.getY(),") => Arrivée: (",this.arrivee.getX(),",",this.arrivee.getY(),")");
			trace(this.nom_classe,": largeur = ",this.largeur,", hauteur=",hauteur);
		}
		
		
		
 		public function getPointsProjection(vecteur:MVecteur):Array{
			return null;
 		}
 		
 		//retourne la liste des axes séparateurs pour les deux objects
 		public function getAxesSeparateurs(objet:MIForme):Array{
 			return null;
 		}
		
		public function clone():MIForme{
			var clone_miforme:MIForme = new MFormeSegment();
			this.remplirForme(clone_miforme as MFormeSegment);
			return clone_miforme; 
		}
		
		public function getAire():Number{
			return 0;
		}
		
		public function getPerimetre():Number{
			return 0;
		}
		
	}
}