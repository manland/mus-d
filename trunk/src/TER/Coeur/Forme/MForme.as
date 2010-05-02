package Coeur.Forme
{
	import Utilitaires.*;
	
	public class MForme
	{
		protected var sous_classe:MIForme;
		
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var nom_classe:String;
		
		public function MForme()
		{
			this.x = 0;
			this.y = 0;
			this.largeur = 0;
			this.hauteur = 0;
			sous_classe = MIForme(this);
			if(sous_classe == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent MForme doivent implementer MIForme");
			}
		}
		
		public function calculMinX():Number{
			return this.x;
		}
		
		public function calculMinY():Number{
			return this.y;
		}
		
		public function calculMaxX():Number{
			return this.largeur + x;
		}
		
		public function calculMaxY():Number{
			return this.hauteur + y;
		}
		
		public function affiche():void
		{
			trace(this.nom_classe,": (",x,",",y,")");
			trace(this.nom_classe,": largeur = ",this.largeur,", hauteur=",hauteur);
		}
		
		public function getX():Number{
			return this.x;
		}
		public function setX(x:Number):void{
			this.x = x;
		}
		
		public function getY():Number{
			return this.y;
		}
		public function setY(y:Number):void{
			this.y = y;
		}
		
		public function getHauteur():Number{
			return this.hauteur;
		}		
		public function setHauteur(hauteur:Number):void{
			this.hauteur = hauteur;	
		}
		
		public function getLargeur():Number{
			return this.largeur;
		}		
		public function setLargeur(largeur:Number):void{
			this.largeur = largeur;			
		}
		
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		public function setNomClasse(nom_classe:String):void
		{
			this.nom_classe = nom_classe;
		}
		
		public function deplacement(x:Number, y:Number):void
		{
			this.x += x;
			this.y += y;
		}
		
		protected function remplirForme(miforme:MForme):void{
			miforme.setX(new Number(x));
			miforme.setY(new Number(y));
			miforme.setHauteur(new Number(hauteur));
			miforme.setLargeur(new Number(largeur));
		}
		
		// stocke dans min et max les valeurs min et max des projections des points du polygone sur le paramètre vecteur 
		public function seProjeteSur(vecteur:MVecteur):Array{
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
	
		public function axeCollision(forme2:MIForme):MAxe{
			var forme1:MIForme = this as MIForme;
			
			var axesSeparateur:Array = forme1.getAxesSeparateurs(forme2);
			axesSeparateur = axesSeparateur.concat(forme2.getAxesSeparateurs(forme1));
			
			//valeur minimale et maximale des projections des deux figures sur les axes séparateurs
			var min1:Number;
			var max1:Number;
			var min2:Number;
			var max2:Number;
			
			// on stocke l'axe sur lequel l'espacement est maximum pour connaitre l'axe de collision
			var espacement_max:Number = Number.NEGATIVE_INFINITY;
			var vecteur_coll:MVecteur = (axesSeparateur[1] as MVecteur);
			
			for(var i:int = 0; i < axesSeparateur.length; i = i + 1) {
				var vecteur:MVecteur = (axesSeparateur[i] as MVecteur);
				var res:Array = forme1.seProjeteSur(vecteur);
				min1 = res.pop();
				max1 = res.pop();
				res = forme2.seProjeteSur(vecteur);
				min2 = res.pop();
				max2 = res.pop();
				var espacement:Number = (Math.max(max1, max2)-Math.min(min1, min2) )- (max2-min2+max1-min1)
				
				if(espacement > 0){
					return null;
				}
				else if(espacement > espacement_max){
					espacement_max = espacement;
					vecteur_coll = vecteur;
				}
			}
			var axe:MAxe = new MAxe();
			axe.orthogonalA(vecteur_coll);
						
			return axe;
		}

	}
}