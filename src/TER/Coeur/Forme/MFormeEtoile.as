package Coeur.Forme
{
	import Utilitaires.MArete;
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	
	public class MFormeEtoile extends MFormePolygone implements MIFormePolygone
	{
		protected var rotation:Number;
		
		public function MFormeEtoile()
		{
			super();
			this.nom_classe="MFormeEtoile";
			this.nombre_arete = 5;
			this.somme_angles = -1;
			this.rotation = 0;
		}
		
		public function instancie(x:Number, y:Number, largeur:Number, rotation:Number = 0):void{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = largeur;
			this.rotation = rotation;
			this.calculAretes()
		}
		
		public override function calculAretes():void{
			var milieu_x:Number = x +largeur/2;
			var milieu_y:Number = y +largeur/2;
			var rayon:Number = largeur/2;
			var angle:Number = rotation;
			
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
		
		public function getAire():Number
		{
			return 0;
		}
		
		public override function setNombreArete(nombre_arete:Number):void
		{
		}
		
		public function getRotation():Number{
			return this.rotation;
		}
		public function setRotation(rotation:Number):void{
			this.rotation = rotation;
			this.calculAretes();
		}
		
		public function clone():MIForme{
			var clone_miforme:MIForme = new MFormeEtoile();
			this.remplirFormePolygone(clone_miforme as MFormeEtoile);
			(clone_miforme as MFormeEtoile).setRotation(new Number(rotation));
			return clone_miforme; 
		}
		
		public override function affiche():void{
			super.affiche();
			trace("decalage :",this.rotation);
		}
		
	}
}