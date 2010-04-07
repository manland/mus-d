package Coeur.Forme
{
	import Utilitaires.MArete;
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	
	public class MFormeEtoile extends MFormePolygone implements MIFormePolygone
	{
		protected var decalage:Number;
		
		public function MFormeEtoile()
		{
			super();
			this.nom_classe="MFormeEtoile";
			this.nombre_arete = 5;
			this.somme_angles = -1;
			this.decalage = 0;
		}
		
		public function instancie(x:Number, y:Number, largeur:Number, decalage:Number = 0):void{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = largeur;
			this.decalage = decalage;
			this.calculAretes()
		}
		
		public function calculAretes():void{
			var milieu_x:Number = x +largeur/2;
			var milieu_y:Number = y +largeur/2;
			var rayon:Number = largeur/2;
			var angle:Number = decalage;
			
			this.aretes = new Array();
			var point1:MCoordonnee = new MCoordonnee(milieu_x + (rayon * Math.cos(angle)), milieu_y + (rayon * Math.sin(angle)));
			angle += ((2*Math.PI)/5);
			var point2:MCoordonnee = new MCoordonnee(milieu_x + (rayon * Math.cos(angle)), milieu_y + (rayon * Math.sin(angle)));
			angle += ((2*Math.PI)/5);
			var point3:MCoordonnee = new MCoordonnee(milieu_x + (rayon * Math.cos(angle)), milieu_y + (rayon * Math.sin(angle)));
			angle += ((2*Math.PI)/5);
			var point4:MCoordonnee = new MCoordonnee(milieu_x + (rayon * Math.cos(angle)), milieu_y + (rayon * Math.sin(angle)));
			angle += ((2*Math.PI)/5);
			var point5:MCoordonnee = new MCoordonnee(milieu_x + (rayon * Math.cos(angle)), milieu_y + (rayon * Math.sin(angle)));
			
			this.ajouterArete(new MArete(point1, point3));
			this.ajouterArete(new MArete(point3, point5));
			this.ajouterArete(new MArete(point5, point2));
			this.ajouterArete(new MArete(point2, point4));
			this.ajouterArete(new MArete(point4, point1));
		}
		
		public override function setHauteur(hauteur:Number):void{
			super.setHauteur(hauteur);
			super.setLargeur(hauteur);
			this.calculAretes();
		}
		
		public override function setLargeur(largeur:Number):void{
			this.setHauteur(largeur);
		}
		
		public override function setX(x:Number):void
		{
			super.setX(x);
			this.calculAretes();
		}
		public override function setY(y:Number):void
		{
			super.setY(y);
			this.calculAretes();
		}
		
		public function getAire():Number
		{
			return 0;
		}
		
		public override function setNombreArete(nombre_arete:Number):void
		{
		}
		
		public function axeCollision(x:Number, y:Number):MAxe
		{ 
			/* a remplir*/
			return null;
		}
		
		public function getDecalage():Number{
			return this.decalage;
		}
		public function setDecalage(decalage:Number):void{
			this.decalage = decalage;
			this.calculAretes();
		}
		
		public function clone():MIForme{
			var clone_miforme:MIForme = new MFormeEtoile();
			this.remplirFormePolygone(clone_miforme as MFormeEtoile);
			(clone_miforme as MFormeEtoile).setDecalage(new Number(decalage));
			return clone_miforme; 
		}
		
		public override function affiche():void{
			super.affiche();
			trace("decalage :",this.decalage);
		}
		
	}
}