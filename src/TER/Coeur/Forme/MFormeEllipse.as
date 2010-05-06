package Coeur.Forme
{
	import Utilitaires.*;
	
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
		
		public function clone():MIForme{
			var clone_miforme:MIForme = new MFormeEllipse();
			this.remplirForme((clone_miforme as MFormeEllipse));
			return clone_miforme as MIForme; 
		}
		
		public function getAxesSeparateurs(objet:MIForme):Array{
 			//a revoir??
 			var axes:Array = new Array();
 
 			return axes;
 		}
 		public function getPointsProjection(vecteur:MVecteur):Array{
 			//a revoir??
 			var points:Array = new Array();
 			return points;
 		}
 		
 		public function getPointsParticuliers():Array{
 			var points:Array = new Array();
 			return points;
 		}
		 
	}
}