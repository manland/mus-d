package Coeur.Forme
{
	import Utilitaires.*;
	
	import mx.controls.Text;
	
	public class MFormeRond extends MFormeEllipse
	{
		
		public function MFormeRond()
		{
			super();
			this.nom_classe = "MFormeRond";
		}
		
		public override function instancie(x:Number, y:Number, largeur:Number, hauteur:Number):void{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = largeur;
		}
		
		public override function setLargeur(largeur:Number):void{
			super.setLargeur(largeur);
			super.setHauteur(largeur);
		}
		
		public override function setHauteur(hauteur:Number):void{
			super.setLargeur(hauteur);
			super.setHauteur(hauteur);
		}
		
		public function getRayon():Number
		{
			return this.getHauteur()/2;
		}
		
		public function getCentre():MCoordonnee
 		{
 			return new MCoordonnee(this.getX()+getRayon(),this.getY()+getRayon());
 		}
 		
		public override function getPerimetre():Number
		{
			return 2 * Math.PI * this.getHauteur();
		}
		
		public override function clone():MIForme{
			var clone_miforme:MIForme = new MFormeRond();
			this.remplirForme(clone_miforme as MFormeRond);
			return clone_miforme; 
		}
		
//		public override function tourne(centre:MCoordonnee, angle_degre:Number):void{
//			var pt:MCoordonnee = this.getCentre();
//			pt.tourne(centre,angle_degre);
//			//sysout.text +="\n tourne rond: "+pt.getX()+" - "+pt.getY();
//			setX(pt.getX() - this.getRayon());
//			setY(pt.getY() - this.getRayon());			
//		}	
		
		//collision
 		/**
 		 * @inheritDoc
 		 */
 		public override function getPointsProjection(vecteur:MVecteur):Array{
 			var res:Array = new Array();
 			var vecteur_unite :MVecteur = vecteur.clone();
 			vecteur_unite.normalise();
 			var pt_a:MCoordonnee = new MCoordonnee(getCentre().getX()+getRayon()*vecteur_unite.getX(),getCentre().getY()+getRayon()*vecteur_unite.getY());
 			var pt_b:MCoordonnee = new MCoordonnee(getCentre().getX()-getRayon()*vecteur_unite.getX(),getCentre().getY()-getRayon()*vecteur_unite.getY());
 			res.push(pt_b,pt_a);
 			return res;
 		}
 		/**
		 * @inheritDoc
		 */
 		public override function getPointsParticuliers():Array{
 			var points:Array = new Array();
 			points.push(getCentre());
 			return points;
 		} 		
 		/**
 		 * @inheritDoc
 		 */
 		public override function getAxesSeparateurs(objet:MIForme):Array{
 			var axes:Array = new Array();
 			var axe:MVecteur = new MVecteur();
 			var pts:Array = objet.getPointsParticuliers();
 			for(var i:int = 0; i < pts.length; i = i + 1) {
 				var pt:MCoordonnee = (pts[i] as MCoordonnee);
 				axe.entreDeuxPoint(this.getCentre(),pt);
 				axe.normalise();
 				axes.push(axe.clone());
 			}
 			return axes;
 		}
	}
}