package Coeur.Forme
{
	import Utilitaires.MVecteur;
	import Utilitaires.MCoordonneePositive;

	public class MFormeSegment //extends MForme //implements MIForme
	{
		public function MFormeSegment()
		{
			/* super();
			this.nom_classe = "MFormeSegment"; */
		}
		
		public function setY(y:Number):void
		{
		}
		
		public function getY():Number
		{
			return 0;
		}
		
		public function getLargeur():Number
		{
			return 0;
		}
		
		public function setHauteur(hauteur:Number):void
		{
		}
		
		public function getHauteur():Number
		{
			return 0;
		}
		
		public function setLargeur(largeur:Number):void
		{
		}
		
		public function getAire():Number
		{
			return 0;
		}
		
		public function getNomClasse():String
		{
			return null;
		}
		
		public function setNomClasse(nom_classe:String):void
		{
		}
		
		public function getPerimetre():Number
		{
			return 0;
		}
		
		public function deplacement(x:Number, y:Number):void
		{
		}
		
		public function affiche():void
		{
		}
		
		public function getAxesSeparateurs(obj:MIForme):Array
		{
			return null;
		}
		
		public function getPointsProjection(vect:MVecteur):Array
		{
			return null;
		}
		
		public function seProjeteSur(vecteur:MVecteur):Array
		{
			return null;
		}
		
		public function clone():MIForme
		{
			return null;
		}
		
		public function calculMinX():Number
		{
			return 0;
		}
		
		public function calculMinY():Number
		{
			return 0;
		}
		
		public function calculMaxX():Number
		{
			return 0;
		}
		
		public function calculMaxY():Number
		{
			return 0;
		}
		
		public function getDecalage():MCoordonneePositive
		{
			return null;
		}
		
		public function setDecalage(decalage:MCoordonneePositive):void
		{
		}
		
	}
}