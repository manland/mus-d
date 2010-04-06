package Coeur.Forme
{
	import Utilitaires.MArete;
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	import Utilitaires.MErreur;
	
	public class MFormeEtoilePleine extends MFormeEtoile
	{
		protected var petit_rayon:Number;
		
		public function MFormeEtoilePleine()
		{
			super();
			this.nom_classe="MFormeEtoilePleine";
			this.nombre_arete = 10;
			this.somme_angles = -1;
			this.petit_rayon = 0;
		}
		
		public override function instancie(x:Number, y:Number, largeur:Number, decalage:Number = 0):void{
			if(petit_rayon > largeur / 3)
				throw new MErreur(this.nom_classe, "instancie", "Le petit rayon est trop petit");
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = largeur;
			this.petit_rayon = largeur / 4;
			this.decalage = decalage;
			this.calculAretes();
		}
		
		public function instancie2(x:Number, y:Number, largeur:Number, decalage:Number = 0, petit_rayon:Number = 0):void{
			if(petit_rayon > largeur / 2)
				throw new MErreur(this.nom_classe, "instancie", "Le petit rayon est trop petit");
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = largeur;
			this.petit_rayon = largeur / 4;
			this.decalage = decalage;
			this.calculAretes();
		}
		
		public override function calculAretes():void{
			var milieu_x:Number = x +largeur/2;
			var milieu_y:Number = y +largeur/2;
			var rayon:Number = largeur/2;
			var angle:Number = decalage + ((2*Math.PI)/10);
			
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
			

			angle = decalage;
			var point6:MCoordonnee = new MCoordonnee(milieu_x + (petit_rayon * Math.cos(angle)), milieu_y + (petit_rayon * Math.sin(angle)));
			angle += ((2*Math.PI)/5);
			var point7:MCoordonnee = new MCoordonnee(milieu_x + (petit_rayon * Math.cos(angle)), milieu_y + (petit_rayon * Math.sin(angle)));
			angle += ((2*Math.PI)/5);
			var point8:MCoordonnee = new MCoordonnee(milieu_x + (petit_rayon * Math.cos(angle)), milieu_y + (petit_rayon * Math.sin(angle)));
			angle += ((2*Math.PI)/5);
			var point9:MCoordonnee = new MCoordonnee(milieu_x + (petit_rayon * Math.cos(angle)), milieu_y + (petit_rayon * Math.sin(angle)));
			angle += ((2*Math.PI)/5);
			var point10:MCoordonnee = new MCoordonnee(milieu_x + (petit_rayon * Math.cos(angle)), milieu_y + (petit_rayon * Math.sin(angle)));
			
			
			this.ajouterArete(new MArete(point1, point7));
			this.ajouterArete(new MArete(point7, point2));
			this.ajouterArete(new MArete(point2, point8));
			this.ajouterArete(new MArete(point8, point3));
			this.ajouterArete(new MArete(point3, point9));
			this.ajouterArete(new MArete(point9, point4));
			this.ajouterArete(new MArete(point4, point10));
			this.ajouterArete(new MArete(point10, point5));
			this.ajouterArete(new MArete(point5, point6));
			this.ajouterArete(new MArete(point6, point1));
		}
		
		public override function axeCollision(x:Number, y:Number):MAxe
		{ 
			/* a remplir*/
			return null;
		}
		
		public function getPetitRayon():Number{
			return this.petit_rayon;
		}
		public function setPetitRayon(petit_rayon:Number):void{
			if(petit_rayon > largeur / 3)
				throw new MErreur(this.nom_classe, "instancie", "Le petit rayon est trop petit");
			this.petit_rayon = petit_rayon;
			this.calculAretes();
		}
		
		public override function clone():MIForme{
			var clone_mformeetoilepleine:MFormeEtoilePleine = super.clone()as MFormeEtoilePleine;
			clone_mformeetoilepleine.setDecalage(new Number(this.decalage));
			clone_mformeetoilepleine.setPetitRayon(new Number(this.petit_rayon));
			return clone_mformeetoilepleine;
		}
		

	}
}