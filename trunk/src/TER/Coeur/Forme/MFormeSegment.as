package Coeur.Forme
{
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
			depart = new MCoordonnee(0,0);
			arrivee = new MCoordonnee(0,0);
		}
		
		public function instancie(depart:MCoordonnee, arrivee:MCoordonnee):void {
			if(depart  == null || arrivee == null){
				throw new MErreur(this.nom_classe, "instancie", "depart ou arrivee incorrect");
			}
			this.depart = depart;
			this.arrivee = arrivee;
			this.calculsCoordonnees();
		}
		
		public override function setX(x:Number):void{
			if(x != this.x){
				var difference:Number = x - this.x;
				if(depart != null)
					depart.deplacement(difference, 0);
				if(arrivee != null)
					arrivee.deplacement(difference, 0);
				this.x = x;
			}
		}
		
		public override function setY(y:Number):void{
			if(y != this.y){
				var difference:Number = y - this.y;
				if(depart != null)
					depart.deplacement(0, difference);
				if(arrivee != null)
					arrivee.deplacement(0, difference);
				this.y = y;
			}
		}
		
		public override function setLargeur(largeur:Number):void{
			if(largeur != this.largeur){
				var difference:Number = largeur - this.largeur;
			
				if(arrivee != null && arrivee.getX() > depart.getX())
					arrivee.deplacement(difference, 0);
				else if(depart != null)
					depart.deplacement(difference, 0);
				else
					throw new MErreur(this.nom_classe, "setHauteur", "depart ou arrivee null");
					
				this.largeur = largeur;
			}
		}
		
		public override function setHauteur(hauteur:Number):void{
			if(hauteur != this.hauteur){
				var difference:Number = hauteur - this.hauteur;
			
				if(arrivee != null && arrivee.getY() > depart.getY())
					arrivee.deplacement(0,difference);
				else if(depart != null)
					depart.deplacement(0,difference);
				else
					throw new MErreur(this.nom_classe, "setHauteur", "depart ou arrivee null");
				this.hauteur = hauteur;
			}
		}
		
		public override function affiche():void
		{
			trace(this.nom_classe,": (",x,",",y,")");
			trace("Decalage: (",this.decalage.getX(),",",this.decalage.getY(),")");
			trace("Depart: (",this.depart.getX(),",",this.depart.getY(),") => Arrivée: (",this.arrivee.getX(),",",this.arrivee.getY(),")");
			trace(this.nom_classe,": largeur = ",this.largeur,", hauteur=",hauteur);
		}
		
		public function clone():MIForme{
			var clone_miforme:MIForme = new MFormeSegment();
			(clone_miforme as MFormeSegment).setDepart(depart);
			(clone_miforme as MFormeSegment).setArrivee(arrivee);
			this.remplirForme(clone_miforme as MFormeSegment);
			return clone_miforme; 
		}
		
		public function setDepart(depart:MCoordonnee):void{
			this.depart = depart;
			this.calculsCoordonnees();
		}
		
		public function setArrivee(arrivee:MCoordonnee):void{
			this.arrivee = arrivee;
			this.calculsCoordonnees();
		}
		
		public function getDepart():MCoordonnee{
			return this.depart;
		}
		
		public function getArrivee():MCoordonnee{
			return this.arrivee;
		}
		
		public function calculsCoordonnees():void{
			this.x = Math.min(depart.getX(), arrivee.getX());
			this.y = Math.min(depart.getY(), arrivee.getY());
			var max_x:Number = Math.max(depart.getX(), arrivee.getX());
			var max_y:Number = Math.max(depart.getY(), arrivee.getY());
			
			this.largeur = max_x - this.x;
			this.hauteur = max_y - this.y;
		}
		
		public function getAire():Number{
			return 0;
		}
		
		public function getPerimetre():Number{
			return 0;
		}
		
//		public function tourne(centre:MCoordonnee, angle_degre:Number):void{
//			this.getArrivee().tourne(centre, angle_degre);
//			this.getDepart().tourne(centre, angle_degre);
//			calculsCoordonnees();
//		}
		
		//collision:
		/**
		 * @inheritDoc
		 */
 		public function getPointsProjection(vecteur:MVecteur):Array{
			var points:Array = new Array();
			points.push(depart,arrivee);
			return points;
 		}
 		/**
		 * @inheritDoc
		 */
 		public function getPointsParticuliers():Array{
			var points:Array = new Array();
			points.push(depart,arrivee);
			return points;
 		}
 		/**
		 * @inheritDoc
		 */
 		public function getAxesSeparateurs(objet:MIForme):Array{
 			var axes:Array = new Array();
 			var axe:MVecteur = new MVecteur();
 			axe.entreDeuxPoint(depart,arrivee);
     		axe = axe.getNormal();
     		axe.normalise();
 			axes.push(axe);
 			return axes;
 		}		
	}
}