package Coeur.Forme
{
	import Coeur.MUtilitaire;
	
	import Utilitaires.MAxe;
	import Utilitaires.MVecteur;
	
	public class MFormeCompose extends MForme implements MIForme
	{
		/**
		 * Viré les getFormeHaut... et remplacer par genre deplacementFormeHaut ?
		 * comment gérer les décalages ? MCoordoonee avec x et y pour chaque forme ?
		 * 
		 * 
		 * 
		 * */
		private var forme_droit:MIForme;
		private var forme_gauche:MIForme;
		private var forme_haut:MIForme;
		private var forme_bas:MIForme;
		private var forme_centre:MIForme;
		
		public function MFormeCompose()
		{
			this.nom_classe = "MFormeCompose";
			this.forme_bas = null;
			this.forme_droit = null;
			this.forme_gauche = null;
			this.forme_haut = null;
			this.forme_centre = null;
		}
		
		public override function calculMinX():Number{
			var min:Number = Number.MAX_VALUE;
			if(forme_haut != null)
				min = MUtilitaire.min(min, forme_haut.calculMinX());
			if(forme_centre != null)
				min = MUtilitaire.min(min, forme_centre.calculMinX());
			if(forme_gauche != null)
				min = MUtilitaire.min(min, forme_gauche.calculMinX());
			if(forme_droit != null)
				min = MUtilitaire.min(min, forme_droit.calculMinX());
			if(forme_bas != null)
				min = MUtilitaire.min(min, forme_bas.calculMinX());
			
			return min;
		}
		
		public override function calculMinY():Number{
			var min:Number = Number.MAX_VALUE;
			if(forme_haut != null)
				min = MUtilitaire.min(min, forme_haut.calculMinY());
			if(forme_centre != null)
				min = MUtilitaire.min(min, forme_centre.calculMinY());
			if(forme_gauche != null)
				min = MUtilitaire.min(min, forme_gauche.calculMinY());
			if(forme_droit != null)
				min = MUtilitaire.min(min, forme_droit.calculMinY());
			if(forme_bas != null)
				min = MUtilitaire.min(min, forme_bas.calculMinY());
			
			return min;
		}
		
		public override function calculMaxX():Number{
			var max:Number = Number.MIN_VALUE;
			if(forme_haut != null)
				max = MUtilitaire.max(max, forme_haut.calculMaxX());
			if(forme_centre != null)
				max = MUtilitaire.max(max, forme_centre.calculMaxX());
			if(forme_gauche != null)
				max = MUtilitaire.max(max, forme_gauche.calculMaxX());
			if(forme_droit != null)
				max = MUtilitaire.max(max, forme_droit.calculMaxX());
			if(forme_bas != null)
				max = MUtilitaire.max(max, forme_bas.calculMaxX());
			
			return max;
		}
		
		public override function calculMaxY():Number{
			var max:Number = Number.MIN_VALUE;
			if(forme_haut != null)
				max = MUtilitaire.max(max, forme_haut.calculMaxY());
			if(forme_centre != null)
				max = MUtilitaire.max(max, forme_centre.calculMaxY());
			if(forme_gauche != null)
				max = MUtilitaire.max(max, forme_gauche.calculMaxY());
			if(forme_droit != null)
				max = MUtilitaire.max(max, forme_droit.calculMaxY());
			if(forme_bas != null)
				max = MUtilitaire.max(max, forme_bas.calculMaxY());
			
			return max;
		}
		
		public function instancie(forme_centre:MIForme):void{
			this.forme_centre = forme_centre;
			this.calculParametres();
		}
		
		public function calculParametres():void{
			this.x = calculMinX();
			this.y = calculMinY();
			var max_x:Number = calculMaxX();
			var max_y:Number = calculMaxY();
			this.largeur = max_x - x;
			this.hauteur = max_y - y;
		}
		
		public function getFormeDroit():MIForme{
			return this.forme_droit;
		}
		public function setFormeDroit(forme_droit:MIForme):void{
			this.forme_droit = forme_droit.clone();
			
			this.forme_droit.deplacement((this.x+largeur) - forme_droit.getX(), this.y - forme_droit.getY());
			this.calculParametres();
		}
		
		public override function deplacement(x:Number, y:Number):void{
			this.x += x;
			this.y += y;
			
			if(this.forme_centre != null){
				forme_centre.deplacement(x,y);
			}
			if(this.forme_droit != null){
				forme_droit.deplacement(x,y);
			}
			if(this.forme_haut != null){
				forme_haut.deplacement(x,y);
			}
			if(this.forme_gauche != null){
				forme_gauche.deplacement(x,y);
			}
			if(this.forme_bas != null){
				forme_bas.deplacement(x,y);
			}
		}
		
		public function getFormeCentre():MIForme{
			return this.forme_centre;
		}
		public function setFormeCentre(forme_centre:MIForme):void{
			this.forme_centre = forme_centre.clone();
		}
		
		public function getFormeHaut():MIForme{
			return this.forme_haut;
		}
		public function setFormeHaut(forme_haut:MIForme):void{
			this.forme_haut = forme_haut.clone();
			
			this.forme_gauche.deplacement(this.forme_centre.getX() - forme_haut.getX(), this.y - forme_haut.getY());
			if(this.forme_gauche != null)
				this.forme_gauche.deplacement(0, this.forme_haut.getHauteur());
			if(this.forme_bas != null)
				this.forme_bas.deplacement(0, this.forme_haut.getHauteur());
			if(this.forme_droit != null)
				this.forme_droit.deplacement(0, this.forme_haut.getHauteur());
			if(this.forme_centre != null)
				this.forme_centre.deplacement(0, this.forme_haut.getHauteur());
			this.calculParametres();
		}
		
		public function getFormeBas():MIForme{
			return this.forme_bas;
		}
		public function setFormeBas(forme_bas:MIForme):void{
			this.forme_bas = forme_bas.clone();
			
			this.forme_bas.deplacement(this.x - forme_bas.getX(), (this.y + hauteur) - forme_bas.getY());
			this.calculParametres();
		}
		
		public function getFormeGauche():MIForme{
			return this.forme_gauche;
		}
		public function setFormeGauche(forme_gauche:MIForme):void{
			this.forme_gauche = forme_gauche.clone();
			
			this.forme_gauche.deplacement(this.x - forme_gauche.getX(), this.forme_centre.getY() - forme_gauche.getY());
			if(this.forme_haut != null)
				this.forme_haut.deplacement(this.forme_gauche.getLargeur(), 0);
			if(this.forme_bas != null)
				this.forme_bas.deplacement(this.forme_gauche.getLargeur(), 0);
			if(this.forme_droit != null)
				this.forme_droit.deplacement(this.forme_gauche.getLargeur(), 0);
			if(this.forme_centre != null)
				this.forme_centre.deplacement(this.forme_gauche.getLargeur(), 0);
			this.calculParametres();
		}
		
		
		public function axeCollision(x:Number,y:Number):MAxe{
			return null;
		}
		
		public function clone():MIForme{
			return null;
		}
		
		public function getAire():Number{
			return this.forme_bas.getAire() + this.forme_centre.getAire() + this.forme_droit.getAire() + this.forme_gauche.getAire() + this.forme_haut.getAire();
		}
		public function getPerimetre():Number{
			return this.forme_bas.getPerimetre() + this.forme_centre.getPerimetre() + this.forme_droit.getPerimetre() + this.forme_gauche.getPerimetre() + this.forme_haut.getPerimetre();
		}
		
		public override function affiche():void{
			super.affiche();
			if(forme_centre != null){
				trace("---------Forme Centre---------");
				this.forme_centre.affiche();
				trace("------------------------------");
			}
			if(forme_bas != null){
				trace("---------Forme Bas---------");
				this.forme_bas.affiche();
				trace("------------------------------");
			}
			if(forme_haut != null){
				trace("---------Forme Haut---------");
				this.forme_haut.affiche();
				trace("------------------------------");
			}
			if(forme_droit != null){
				trace("---------Forme Droite---------");
				this.forme_droit.affiche();
				trace("------------------------------");
			}
			if(forme_gauche != null){
				trace("---------Forme Gauche---------");
				this.forme_gauche.affiche();
				trace("------------------------------");
			}
		}
		
		public function getAxesSeparateurs(objet:MIForme):Array{
			var axes:Array = new Array();
			if(forme_haut != null)
				axes = axes.concat(forme_haut.getAxesSeparateurs(objet));
			if(forme_centre != null)
				axes = axes.concat(forme_centre.getAxesSeparateurs(objet));
			if(forme_gauche != null)
				axes = axes.concat(forme_gauche.getAxesSeparateurs(objet));
			if(forme_droit != null)
				axes = axes.concat(forme_droit.getAxesSeparateurs(objet));
			if(forme_bas != null)
				axes = axes.concat(forme_bas.getAxesSeparateurs(objet));
			return axes;
		}
		
		public function getPointsProjection(vecteur:MVecteur):Array{
			var points:Array = new Array();
			if(forme_haut != null)
				points = points.concat(forme_haut.getPointsProjection(vecteur));
			if(forme_centre != null)
				points = points.concat(forme_centre.getPointsProjection(vecteur));
			if(forme_gauche != null)
				points = points.concat(forme_gauche.getPointsProjection(vecteur));
			if(forme_droit != null)
				points = points.concat(forme_droit.getPointsProjection(vecteur));
			if(forme_bas != null)
				points = points.concat(forme_bas.getPointsProjection(vecteur));
			return points;
		}
		
		public override function seProjeteSur(vecteur:MVecteur):Array{
			//a revoir
//			var pts:Array = getPointsProjection(vecteur);
//			for(var i:uint = 0; i<pts.length; i++){
//				var pt:MCoordonnee = pts[i] as MCoordonnee;
//				
//				var scalaire:Number = vecteur.getX()*pt.getX() + pt.getY()*vecteur.getY();
//				
//				var projection:MVecteur = new MVecteur();
//				projection.instancie(scalaire * vecteur.getX(),scalaire * vecteur.getY());
//				
//				var val:Number = 0;
//             	if(projection.getX()/Math.abs(projection.getX())== vecteur.getX()/Math.abs(vecteur.getX()) && projection.getY()/Math.abs(projection.getY())== vecteur.getY()/Math.abs(vecteur.getY())){
//                 	val = projection.getNorme();
//              	}
//             	else{
//                 	val = -projection.getNorme();
//              	}
//             	min = Math.min(val, min);
//             	max = Math.max(val, max);
//			}
			return null;
		}

	}
}