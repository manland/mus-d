package Coeur.Forme
{
	import Utilitaires.MArete;
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	
	public class MFormeRectangle extends MFormePolygone implements MIFormePolygone
	{
		
		public function MFormeRectangle()
		{
			super()
			this.nom_classe = "MFormeRectangle";
			this.nombre_arete = 4;
			this.somme_angles = 360;
		}
		
		public function instancie(x:Number, y:Number, largeur:Number, hauteur:Number = -1):void{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			if(hauteur == -1)
				this.hauteur = largeur;
			else
				this.hauteur = hauteur;
			
			this.calculAretes();
			
		}
		
		public override function calculAretes():void{
			
			this.aretes = new Array();
			var m1:MCoordonnee = new MCoordonnee(x+this.decalage.getX(), y+this.decalage.getY());
			var m2:MCoordonnee = new MCoordonnee(x+largeur+this.decalage.getX(), y+this.decalage.getY());
			var m3:MCoordonnee = new MCoordonnee(x+largeur+this.decalage.getX(), y+hauteur+this.decalage.getY());
			var m4:MCoordonnee = new MCoordonnee(x+this.decalage.getX(), y+hauteur+this.decalage.getY());
			
			var a1:MArete = new MArete(m1 ,m2);
			var a2:MArete = new MArete(m2, m3);
			var a3:MArete = new MArete(m3, m4);
			var a4:MArete = new MArete(m4, m1);
			this.ajouterArete(a1);
			this.ajouterArete(a2);
			this.ajouterArete(a3);
			this.ajouterArete(a4);
		}
		
		public function getAire():Number{
			return this.largeur * this.hauteur;
		}
		
		public override function getPerimetre():Number{
			return 2*this.largeur + 2*this.hauteur;
		}
		
		public override function setNombreArete(nombre_arete:Number):void{
		}
		
		public override function setSommeAngles(somme_angles:Number):void{
		}
		
		public function clone():MIForme{
			var clone_miforme:MIForme = new MFormeRectangle();
			this.remplirFormePolygone((clone_miforme as MFormeRectangle));
			return clone_miforme; 
		}
		
	}
}