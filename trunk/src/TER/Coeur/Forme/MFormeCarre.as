package Coeur.Forme
{
	public class MFormeCarre extends MFormeRectangle
	{
		public function MFormeCarre()
		{
			super();
			this.nom_classe = "MFormeCarre";
		}
		
		public override function instancie(x:Number, y:Number, largeur:Number, hauteur:Number = -1):void{
			super.instancie(x,y, largeur, largeur);
		}
		
		public override function setLargeur(largeur:Number):void{
			this.largeur = largeur;
			this.hauteur = largeur
			super.calculAretes();
		}
		
		public override function setHauteur(hauteur:Number):void{
			this.hauteur = hauteur;
			this.largeur = hauteur;
			super.calculAretes();
		}
		
		
		public override function clone():MIForme{
			var clone_miforme:MIForme = new MFormeCarre();
			this.remplirFormePolygone((clone_miforme as MFormeCarre));
			return clone_miforme; 
		}

	}
}