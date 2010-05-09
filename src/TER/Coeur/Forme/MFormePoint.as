package Coeur.Forme
{
	import Utilitaires.*;
	
	public class MFormePoint extends MForme implements MIForme
	{
		public function MFormePoint()
		{
			super();
			this.nom_classe = "MFormePoint";
		}
		
		public override function setLargeur(largeur:Number):void{
		} 
		
		public override function setHauteur(largeur:Number):void{
		}
		
		public function getAire():Number{
			return 0;
		}
		
		public function getPerimetre():Number{
			return 0;
		}	
		
//		public function tourne(centre:MCoordonnee, angle_degre:Number):void{
//			var pt:MCoordonnee = new MCoordonnee(getX(), getY());
//			pt.tourne(centre,angle_degre);
//			setX(pt.getX());
//			setY(pt.getY());			
//		}	
		
 		//collision
 		/**
		 * @inheritDoc
		 */
 		public function getAxesSeparateurs(objet:MIForme):Array{
 			var axes:Array = new Array();
 			var axe:MVecteur = new MVecteur();
 			var pts:Array = objet.getPointsParticuliers();
 			for(var i:int = 0; i < pts.length; i = i + 1) {
 				var pt:MCoordonnee = (pts[i] as MCoordonnee);
 				axe.entreDeuxPoint(new MCoordonnee(getX(),getY()),pt);
 				axe.normalise();
 				axes.push(axe.clone());
 			}
 			return axes;
 		}
 		/**
		 * @inheritDoc
		 */
 		public function getPointsProjection(vecteur:MVecteur):Array{
			var points:Array = new Array();
			points.push(new MCoordonnee(getX(),getY()));
			return points;
 		}
		/**
		 * @inheritDoc
		 */
		public function getPointsParticuliers():Array{
			var points:Array = new Array();
			points.push(new MCoordonnee(getX(),getY()));
			return points;
		}
		
		public function clone():MIForme{
			var clone_miforme:MIForme = new MFormePoint();
			this.remplirForme(clone_miforme as MFormePoint);
			return clone_miforme; 
		}
		
	}
}