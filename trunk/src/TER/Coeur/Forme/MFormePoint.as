package Coeur.Forme
{
	import Utilitaires.MVecteur;
	
	public class MFormePoint extends MForme implements MIForme
	{
		public function MFormePoint()
		{
			super();
			this.nom_classe = "MFormePoint";
		}
		
		public override function setLargeur(largeur:Number):void{
			if(objet != null)
				objet.setLargeur(0);
		} 
		
		public override function setHauteur(largeur:Number):void{
			if(objet != null)
				objet.setHauteur(0);
		}
		
		public function getAire():Number{
			return 0;
		}
		
		public function getPerimetre():Number{
			return 0;
		}
		
		
 		public function getPointsProjection(vecteur:MVecteur):Array{
			return null;
 		}
 		
 		//retourne la liste des axes séparateurs pour les deux objects
 		public function getAxesSeparateurs(objet:MIForme):Array{
 			return null;
 		}
		
		public function clone():MIForme{
			var clone_miforme:MIForme = new MFormePoint();
			this.remplirForme(clone_miforme as MFormePoint);
			return clone_miforme; 
		}
		
	}
}