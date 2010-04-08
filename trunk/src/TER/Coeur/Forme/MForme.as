package Coeur.Forme
{
	import Utilitaires.MErreur;
	
	public class MForme
	{
		protected var sous_classe:MIForme;
		
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var nom_classe:String;
		
		public function MForme()
		{
			this.x = 0;
			this.y = 0;
			this.largeur = 0;
			this.hauteur = 0;
			sous_classe = MIForme(this);
			if(sous_classe == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent MForme doivent implementer MIForme");
			}
		}
		
		public function calculMinX():Number{
			return this.x;
		}
		
		public function calculMinY():Number{
			return this.y;
		}
		
		public function calculMaxX():Number{
			return this.largeur + x;
		}
		
		public function calculMaxY():Number{
			return this.hauteur + y;
		}
		
		public function affiche():void
		{
			trace(this.nom_classe,": (",x,",",y,")");
			trace(this.nom_classe,": largeur = ",this.largeur,", hauteur=",hauteur);
		}
		
		public function getX():Number{
			return this.x;
		}
		public function setX(x:Number):void{
			this.x = x;
		}
		
		public function getY():Number{
			return this.y;
		}
		public function setY(y:Number):void{
			this.y = y;
		}
		
		public function getHauteur():Number{
			return this.hauteur;
		}		
		public function setHauteur(hauteur:Number):void{
			this.hauteur = hauteur;	
		}
		
		public function getLargeur():Number{
			return this.largeur;
		}		
		public function setLargeur(largeur:Number):void{
			this.largeur = largeur;			
		}
		
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		public function setNomClasse(nom_classe:String):void
		{
			this.nom_classe = nom_classe;
		}
		
		public function deplacement(x:Number, y:Number):void
		{
			this.x += x;
			this.y += y;
		}
		
		protected function remplirForme(miforme:MForme):void{
			miforme.setX(new Number(x));
			miforme.setY(new Number(y));
			miforme.setHauteur(new Number(hauteur));
			miforme.setLargeur(new Number(largeur));
		}

	}
}