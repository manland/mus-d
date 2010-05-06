package Coeur.Forme
{
	import Utilitaires.*;
	
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
				min = Math.min(min, forme_haut.calculMinX());
			if(forme_centre != null)
				min = Math.min(min, forme_centre.calculMinX());
			if(forme_gauche != null)
				min = Math.min(min, forme_gauche.calculMinX());
			if(forme_droit != null)
				min = Math.min(min, forme_droit.calculMinX());
			if(forme_bas != null)
				min = Math.min(min, forme_bas.calculMinX());
			
			return min;
		}
		
		public override function calculMinY():Number{
			var min:Number = Number.MAX_VALUE;
			if(forme_haut != null)
				min = Math.min(min, forme_haut.calculMinY());
			if(forme_centre != null)
				min = Math.min(min, forme_centre.calculMinY());
			if(forme_gauche != null)
				min = Math.min(min, forme_gauche.calculMinY());
			if(forme_droit != null)
				min = Math.min(min, forme_droit.calculMinY());
			if(forme_bas != null)
				min = Math.min(min, forme_bas.calculMinY());
			
			return min;
		}
		
		public override function calculMaxX():Number{
			var max:Number = Number.MIN_VALUE;
			if(forme_haut != null)
				max = Math.max(max, forme_haut.calculMaxX());
			if(forme_centre != null)
				max = Math.max(max, forme_centre.calculMaxX());
			if(forme_gauche != null)
				max = Math.max(max, forme_gauche.calculMaxX());
			if(forme_droit != null)
				max = Math.max(max, forme_droit.calculMaxX());
			if(forme_bas != null)
				max = Math.max(max, forme_bas.calculMaxX());
			
			return max;
		}
		
		public override function calculMaxY():Number{
			var max:Number = Number.MIN_VALUE;
			if(forme_haut != null)
				max = Math.max(max, forme_haut.calculMaxY());
			if(forme_centre != null)
				max = Math.max(max, forme_centre.calculMaxY());
			if(forme_gauche != null)
				max = Math.max(max, forme_gauche.calculMaxY());
			if(forme_droit != null)
				max = Math.max(max, forme_droit.calculMaxY());
			if(forme_bas != null)
				max = Math.max(max, forme_bas.calculMaxY());
			
			return max;
		}
		
		public function instancie(forme_centre:MIForme):void{
			this.forme_centre = forme_centre.clone();
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
			if(this.forme_centre == null)
				throw new MErreur(this.nom_classe, "setFormeDroit", "Pas le droit de setter une forme sans la forme centrale");
			this.forme_droit = forme_droit.clone();
			
			this.forme_droit.deplacement((this.forme_centre.getX()+this.forme_centre.getLargeur()) - forme_droit.getX() + this.forme_droit.getDecalage().getX(),
									 this.forme_centre.getY() - forme_droit.getY() + this.forme_droit.getDecalage().getX());
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
			if(this.forme_centre == null){
				this.setFormeBas(null);
				this.setFormeDroit(null);
				this.setFormeHaut(null);
				this.setFormeGauche(null);
			}
		}
		
		public function getFormeHaut():MIForme{
			return this.forme_haut;
		}
		public function setFormeHaut(forme_haut:MIForme):void{
			if(this.forme_centre == null)
				throw new MErreur(this.nom_classe, "setFormeHaut", "Pas le droit de setter une forme sans la forme centrale");
			
			if(forme_haut != null){
				this.forme_haut = forme_haut.clone();
				//trace(this.forme_centre.getX()," - ",forme_haut.getX());
				this.forme_haut.deplacement(this.forme_centre.getX() - forme_haut.getX(), this.y - forme_haut.getY());
				
				if(this.forme_gauche != null)
					this.forme_gauche.deplacement(0, this.forme_haut.getHauteur());
				if(this.forme_bas != null)
					this.forme_bas.deplacement(0, this.forme_haut.getHauteur());
				if(this.forme_droit != null)
					this.forme_droit.deplacement(0, this.forme_haut.getHauteur());
				if(this.forme_centre != null)
					this.forme_centre.deplacement(0, this.forme_haut.getHauteur());
			}
			else{
				//trace(this.forme_centre.getX()," - ",forme_haut.getX());
				if(this.forme_gauche != null)
					this.forme_gauche.deplacement(0, -this.forme_haut.getHauteur());
				if(this.forme_bas != null)
					this.forme_bas.deplacement(0, -this.forme_haut.getHauteur());
				if(this.forme_droit != null)
					this.forme_droit.deplacement(0, -this.forme_haut.getHauteur());
				if(this.forme_centre != null)
					this.forme_centre.deplacement(0, -this.forme_haut.getHauteur());
				this.forme_haut = null;
			}
			this.calculParametres();
		}
		
		public function getFormeBas():MIForme{
			return this.forme_bas;
		}
		public function setFormeBas(forme_bas:MIForme):void{
			if(this.forme_centre == null)
				throw new MErreur(this.nom_classe, "setFormeBas", "Pas le droit de setter une forme sans la forme centrale");
			this.forme_bas = forme_bas.clone();
			
			trace(this.x - forme_bas.getX(),"-",(this.y + hauteur) - forme_bas.getY());
			this.forme_bas.deplacement(this.forme_centre.getY() - forme_bas.getX() + this.forme_bas.getDecalage().getX(),
									 (this.forme_centre.getY()+this.forme_centre.getHauteur()) - forme_bas.getY() + this.forme_bas.getDecalage().getY());
			this.calculParametres();
		}
		
		public function getFormeGauche():MIForme{
			return this.forme_gauche;
		}
		public function setFormeGauche(forme_gauche:MIForme):void{
			if(this.forme_centre == null)
				throw new MErreur(this.nom_classe, "setFormeGauche", "Pas le droit de setter une forme sans la forme centrale");
			this.forme_gauche = forme_gauche.clone();
			
			if(forme_gauche != null){
				this.forme_gauche.deplacement(this.x - forme_gauche.getX(), this.forme_centre.getY() - forme_gauche.getY());
				if(this.forme_haut != null)
					this.forme_haut.deplacement(this.forme_gauche.getLargeur(), 0);
				if(this.forme_bas != null)
					this.forme_bas.deplacement(this.forme_gauche.getLargeur(), 0);
				if(this.forme_droit != null)
					this.forme_droit.deplacement(this.forme_gauche.getLargeur(), 0);
				if(this.forme_centre != null)
					this.forme_centre.deplacement(this.forme_gauche.getLargeur(), 0);
			}
			else{
				if(this.forme_haut != null)
					this.forme_haut.deplacement(-this.forme_gauche.getLargeur(), 0);
				if(this.forme_bas != null)
					this.forme_bas.deplacement(-this.forme_gauche.getLargeur(), 0);
				if(this.forme_droit != null)
					this.forme_droit.deplacement(-this.forme_gauche.getLargeur(), 0);
				if(this.forme_centre != null)
					this.forme_centre.deplacement(-this.forme_gauche.getLargeur(), 0);
				
				this.forme_gauche = forme_gauche;
			}
			this.calculParametres();
		}
		
		
		 public override function axeCollision(forme:MIForme):MAxe{
			 var axe:MAxe = null;
			 if(this.forme_haut != null)
				 axe = this.forme_haut.axeCollision(forme);
			 if(axe == null && this.forme_bas != null)
				 axe = this.forme_bas.axeCollision(forme);
			 if(axe == null && this.forme_droit != null)
				 axe = this.forme_droit.axeCollision(forme);
			 if(axe == null && this.forme_centre != null)
			 	axe = this.forme_centre.axeCollision(forme);
			 return axe;
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
 		
 		public function getPointsParticuliers():Array{
 			var points:Array = new Array();
 			if(forme_haut != null)
 				points = points.concat(forme_haut.getPointsParticuliers());
 			if(forme_centre != null)
 				points = points.concat(forme_centre.getPointsParticuliers());
 			if(forme_gauche != null)
 				points = points.concat(forme_gauche.getPointsParticuliers());
 			if(forme_droit != null)
 				points = points.concat(forme_droit.getPointsParticuliers());
 			if(forme_bas != null)
 				points = points.concat(forme_bas.getPointsParticuliers());
 			return points;
 		}
	}
}