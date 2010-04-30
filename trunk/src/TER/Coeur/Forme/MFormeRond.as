package Coeur.Forme
{
	import Utilitaires.MArete;
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	import Utilitaires.MVecteur;
	
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
			this.largeur = largeur;
			this.hauteur = largeur
		}
		
		public override function setHauteur(hauteur:Number):void{
			this.hauteur = hauteur;
			this.largeur = hauteur;
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
			res.push(pt_a);
			var pt_b:MCoordonnee = new MCoordonnee(getCentre().getX()-getRayon()*vecteur_unite.getX(),getCentre().getY()-getRayon()*vecteur_unite.getY());
			res.push(pt_b);
			
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
		
		//a degager??
//		public override function axeCollision(x:Number,y:Number):MAxe{
//			var a:Number;
//			var b:Number;
//			var rayon:Number;
//			
//			//coordonnées du centre du cercle et longeur du rayon
//			rayon = this.largeur/2;
//			a = this.getX() + rayon;
//			b = this.getY() + rayon;
//			
//			// equation d'un cercle de centre (a,b) et de rayon r => (x − a)²+ (y − b)²  = r²
//			if( ( ((x - a)*(x - a)) + ((y - b)*(y - b)) ) == (rayon * rayon)){
//				var axe:MAxe = new MAxe();
//				var tiers:Number = this.largeur/3; 
//				if(x <= (this.getX() + 2*tiers) && x >= (this.getX() + tiers)){
//					axe.setAxe(0);
//				}
//				else if(y >= (this.getY() + 2*tiers) && y <= (this.getY() + tiers)){
//					axe.setAxe(1);
//				}
//				else if( (y >= (this.getY() + tiers) && x <= (this.getX() + tiers)) || (y <= (this.getY() + 2*tiers) && x >= (this.getX() + 2*tiers)) ) {
//					axe.setAxe(2);
//				}
//				else
//					axe.setAxe(3);
//				return axe;
//			}
//			else
//				return null;
//		}
		
		public override function getPerimetre():Number
		{
			return 2 * Math.PI * this.getHauteur();
		}
		
		public override function clone():MIForme{
			var clone_miforme:MIForme = new MFormeRond();
			this.remplirForme((clone_miforme as MFormeRond));
			return clone_miforme; 
		}
		 
	}
}