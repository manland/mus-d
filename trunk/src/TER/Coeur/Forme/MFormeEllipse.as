package Coeur.Forme
{
	import Utilitaires.MAxe;
	
	public class MFormeEllipse extends MForme implements MIForme
	{
		/**
		 * 
		 * A refaire
		 * 
		 * */
		
		public function MFormeEllipse()
		{
			this.x = 0;
			this.y = 0;
			this.largeur = 0;
			this.hauteur = 0;
			this.nom_classe = "MFormeEllipse";
		}
		
		public function instancie(x:Number, y:Number, largeur:Number, hauteur:Number):void{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = hauteur;
		}

		public function getAire():Number
		{
			return this.largeur * this.largeur * Math.PI;;
		}
		
		public function getPerimetre():Number
		{
			return 0;
		}
		
		public override function affiche():void
		{
			super.affiche();
		}
		
		public function axeCollision(x:Number,y:Number):MAxe{
			//a remplir
			return null;
		}
		
		public function clone():MIForme{
			
			var clone_miforme:MFormeEllipse = new MFormeEllipse();
			this.remplirForme(clone_miforme);
			return clone_miforme; 
		}
		 
	}
}