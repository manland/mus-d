package Coeur.Forme
{
	import Utilitaires.MArete;
	import Utilitaires.MCoordonnee;
	
	public class MFormeEtoile extends MFormeComplexe implements MIFormePolygone
	{
		public function MFormeEtoile()
		{
			this.nom_classe="MEtoile";
			this.nombre_arete = 3;
			this.somme_angle = -1;
		}
		
		public function instancie(x:Number, y:Number, largeur:Number):void{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = hauteur;
			
			var milieu_x:Number = (x+largeur)/2;
			var milieu_y:Number = (y+largeur)/2;
			var rayon:Number = largeur/2;
			
			var point1:MCoordonnee = new MCoordonnee(rayon * Math.cos((2*Math.PI)/5), rayon * Math.sin((2*Math.PI)/5));
			var point2:MCoordonnee = new MCoordonnee(rayon * Math.cos((4*Math.PI)/5), rayon * Math.sin((4*Math.PI)/5));
			var point3:MCoordonnee = new MCoordonnee(rayon * Math.cos((6*Math.PI)/5), rayon * Math.sin((6*Math.PI)/5));
			var point4:MCoordonnee = new MCoordonnee(rayon * Math.cos((8*Math.PI)/5), rayon * Math.sin((8*Math.PI)/5));
			var point5:MCoordonnee = new MCoordonnee(rayon * Math.cos((10*Math.PI)/5), rayon * Math.sin((10*Math.PI)/5));
			
			this.ajouterArete(new MArete(point1, point3));
			this.ajouterArete(new MArete(point1, point4));
			this.ajouterArete(new MArete(point2, point4));
			this.ajouterArete(new MArete(point2, point5));
			this.ajouterArete(new MArete(point3, point5));
			
		}
		
		public function ajouterArete(arete:MArete):Boolean
		{
			arete = new MArete(new MCoordonnee(arete.getDepart().getX(),arete.getDepart().getY()),
								new MCoordonnee(arete.getArrivee().getX(),arete.getArrivee().getY()));
			if(aretes.length < nombre_arete)
			{
				aretes.push(arete);
				return true;
			}
			else return false;
		}
		
		public override function setHauteur(hauteur:Number):void
		{
		}
		public override function setLargeur(largeur:Number):void
		{
		}
		public override function setX(x:Number):void
		{
		}
		public override function setY(y:Number):void
		{
		}
		
		public function getAire():Number
		{
			return 0;
		}
		
		
		public function getPerimetre():Number
		{
			return 0;
		}
		
		public override function setNombreArete(nombre_arete:Number):void
		{
		}
		
		public function affiche():void
		{
			trace(this.getNomClasse());
		}
		
		public function contient(x:Number, y:Number):Boolean
		{
			return false;
		}
		
	}
}