package Coeur.Forme
{
	import Utilitaires.*;
	
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
			return this.getHauteur();
		}
		
		public function getCentre():MCoordonnee
 		{
 			return new MCoordonnee(this.getX()+getRayon(),this.getY()+getRayon());
 		}
 		public override function getPointsProjection(vecteur:MVecteur):Array{
 			var res:Array = new Array();
 			var vecteur_unite :MVecteur = vecteur.clone();
 			vecteur_unite.normalise();
 			var pt_a:MCoordonnee = new MCoordonnee(getCentre().getX()+getRayon()*vecteur_unite.getX(),getCentre().getY()+getRayon()*vecteur_unite.getY());
 			var pt_b:MCoordonnee = new MCoordonnee(getCentre().getX()-getRayon()*vecteur_unite.getX(),getCentre().getY()-getRayon()*vecteur_unite.getY());
 			res.push(pt_b,pt_a);
 			return res;
 		}
 		
 		//retourne la liste des axes séparateurs pour les deux objects
 		public override function getAxesSeparateurs(objet:MIForme):Array{
 			var axes:Array = new Array();
 			var axe:MVecteur = new MVecteur();
 			if((objet as MFormeRond) != null){
 			//l'autre objet est un rond, l'axe est alors la droite entre les deux centres
 				axe.entreDeuxPoint(this.getCentre(),(objet as MFormeRond).getCentre());
 				axe.normalise();
 				axes.push(axe);
 			}
 			else if(objet as MFormePolygone != null){
 			// si l'autre objet est un polygone les axes sont alors les droites entre chaque sommet du polygone et le centre
 				var pts:Array = (objet as MFormePolygone).getSommet();
 				for(var i:int = 0; i < pts.length; i = i + 1) {
 					var pt:MCoordonnee = (pts[i] as MCoordonnee);
 					axe.entreDeuxPoint(this.getCentre(),pt);
 					axe.normalise();
 					axes.push(axe.clone());
 				}
 			}
 			return axes;
 		}
		
		public override function getPerimetre():Number
		{
			return 2 * Math.PI * this.getHauteur();
		}
		
		public override function clone():MIForme{
			var clone_miforme:MIForme = new MFormeRond();
			this.remplirForme(clone_miforme as MFormeRond);
			return clone_miforme; 
		}// stocke dans min et max les valeurs min et max des projections des points du polygone sur le paramètre vecteur
 
 
 		public override function seProjeteSur(vecteur:MVecteur):Array{
 			var pts:Array = (this as MIForme).getPointsProjection(vecteur);
 			var res:Array = new Array();
 			var min:Number = Number.POSITIVE_INFINITY;
 			var max:Number = Number.NEGATIVE_INFINITY;
 			for(var i:int = 0; i<pts.length; i++){
 				var pt:MCoordonnee = pts[i] as MCoordonnee;
 				var scalaire:Number = vecteur.getX()*pt.getX() + pt.getY()*vecteur.getY();
 				var projection:MVecteur = new MVecteur();
 				projection.instancie(scalaire * vecteur.getX(),scalaire * vecteur.getY());
 				var val:Number = 0;
              	if(projection.getX()*vecteur.getX() >= 0 && projection.getY() * vecteur.getY() >= 0){
                  	val = projection.getNorme();
               	}
              	else{
                  	val = -projection.getNorme();
               	}
              	min = Math.min(val, min);
              	max = Math.max(val, max);
              	res.push(max,min);
 			}
 			return res;
 		}
		 
	}
}