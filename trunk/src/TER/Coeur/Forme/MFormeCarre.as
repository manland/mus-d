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
			super.calculParametres();
		}
		
		public override function setHauteur(hauteur:Number):void{
			this.hauteur = hauteur;
			this.largeur = hauteur;
			super.calculParametres();
		}
		public override function clone():MIForme{
			var clone_miforme:MFormeCarre = new MFormeCarre();
			this.remplirFormePolygone(clone_miforme);
			return clone_miforme; 
			
			
			/* var clone_miforme:MIForme = super.clone();
			trace("----------");
			clone_miforme.affiche();
			trace("----------");
			return clone_miforme;
			; */ 
		}

	}
}