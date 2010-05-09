package Coeur.Forme
{
	import Utilitaires.*;
	
	import mx.controls.Text;
	
	public class MForme
	{
		protected var sous_classe:MIForme;
		
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var nom_classe:String;
		protected var decalage:MCoordonneePositive;
		
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
			this.decalage = new MCoordonneePositive(0,0);
		}
		
		//nom:
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		public function getDecalage():MCoordonneePositive{
			return this.decalage.clone() as MCoordonneePositive;
		}
		
		public function setDecalage(decalage:MCoordonneePositive):void{
			this.decalage = decalage; 
		}
		
		public function affiche():void
		{
			trace(this.nom_classe,": (",x,",",y,")");
			trace("Decalage: (",this.decalage.getX(),",",this.decalage.getY(),")");
			trace(this.nom_classe,": largeur = ",this.largeur,", hauteur=",hauteur);
		}
		
		//coordonnées: 
		public function getX():Number{
			return this.x+this.decalage.getX();
		}
		public function setX(x:Number):void{
			if(x != this.x){
				var difference:Number = x - this.x;
				this.deplacement(difference, 0);
			}
		}
				
		public function getY():Number{
			return this.y + this.decalage.getY();
		}
		public function setY(y:Number):void{
			if(y != this.y){
				var difference:Number = y - this.y;
				this.deplacement(0, difference);
			}
		}
		
		public function deplacement(x:Number, y:Number):void
		{
			this.x += x;
			this.y += y;
		}
		
		public function calculMinX():Number{
			return this.x;
		}
		
		public function calculMinY():Number{
			return this.y;
		}
		
		public function calculMaxX():Number{
			return this.largeur + this.getX();
		}
		
		public function calculMaxY():Number{
			return this.hauteur + this.getY();
		}
		
		//taille:
		public function getHauteur():Number{
			return this.hauteur;
		}		
		public function setHauteur(hauteur:Number):void{
			if(hauteur != this.hauteur){
				this.hauteur = hauteur;
			}
		}
		
		public function getLargeur():Number{
			return this.largeur;
		}		
		public function setLargeur(largeur:Number):void{
			if(largeur != this.largeur){
				this.largeur = largeur;
			}
		}
		
		protected function remplirForme(miforme:MForme):void{
			miforme.setDecalage(this.decalage.clone() as MCoordonneePositive);
			miforme.setX(new Number(x));
			miforme.setY(new Number(y));
			miforme.setHauteur(new Number(hauteur));
			miforme.setLargeur(new Number(largeur));
		}
		
		public function deplacementCirculaire(centre:MCoordonnee,angle_degre:Number):void{
			var pt:MCoordonnee = new MCoordonnee(getX()+getLargeur()/2 , getY()+getHauteur()/2);
			pt.tourne(centre,angle_degre);
			setX(pt.getX() - getLargeur()/2);
			setY(pt.getY() - getHauteur()/2);	
		}
		
		//collision:
		/**
 		 * retourne l'axe selon lequel collisionne la forme receveur et la forme passée en paramètre ou null si elles ne collisionnent pas
 		 * <p> cette fonction utilise la méthode des axes séparateurs pour detecter la collision</p>
 		 * @param forme2: forme pour laquelle on cherche l'axe de collision
 		 * @return axe selon laquelle a lieu la collision entre la forme receveur et celle passée en paramètre ou null s'il n'y a pas collision
 		 */	
		public function axeCollision(forme2:MIForme):MAxe{
 			var forme1:MIForme = this as MIForme;
 			// axes séparateurs potentiels pour les deux formes
 			var axesSeparateur:Array = forme1.getAxesSeparateurs(forme2);
 			axesSeparateur = axesSeparateur.concat(forme2.getAxesSeparateurs(forme1));
 			
 			//valeur minimale et maximale des projections des deux figures sur les axes séparateurs
 			var min1:Number;
 			var max1:Number;
 			var min2:Number;
 			var max2:Number;
 			
 			//axe sur lequel l'espacement est le plus grand
 			var espacement_max:Number = Number.NEGATIVE_INFINITY;
 			var vecteur_coll:MVecteur = (axesSeparateur[1] as MVecteur);
 			for(var i:int = 0; i < axesSeparateur.length; i = i + 1) {
 				var vecteur:MVecteur = (axesSeparateur[i] as MVecteur);
 				//on projete la première forme
 				var res:Array = forme1.seProjeteSur(vecteur);
 				min1 = res.pop();
 				max1 = res.pop();
 				//on projete la seconde forme
 				res = forme2.seProjeteSur(vecteur);
 				min2 = res.pop();
 				max2 = res.pop();
 				//on regarde l'espacement entre les deux projections
 				var espacement:Number = (Math.max(max1, max2)-Math.min(min1, min2) )- (max2-min2+max1-min1)
 				// s'il est positif, il n'y a pas collision on retourne null
 				if(espacement > 0){
 					return null;
 				}// sinon on stocke l'axe sur lequel l'espacement est maximum pour connaitre l'axe de collision
 				else if(espacement > espacement_max){
 					espacement_max = espacement;
 					vecteur_coll = vecteur;
 				}
 			}
 			var axe:MAxe = new MAxe();
 			//l'axe de collision est l'axe perpendiculaire à l'axe séparateur
 			axe.orthogonalA(vecteur_coll);
 			return axe;
 		}
		/**
		 * renvoie dans un tableau la valeurs minimale et la valeur maximale de la projection de la forme receveur sur le vecteur passé en paramètre
		 * @param vecteur: vecteur sur lequel on veut projeter la forme
		 * @return un tableau contenant la valeur minimale de projection à l'indice 1 et la valeur maximale de projection à l'indice 0
		 */
 		public function seProjeteSur(vecteur:MVecteur):Array{
 			//on récupère les points à projeter
 			var pts:Array = (this as MIForme).getPointsProjection(vecteur);
 			var res:Array = new Array();
 			//les valeurs maximales et minimales des projections
 			var min:Number = Number.POSITIVE_INFINITY;
 			var max:Number = Number.NEGATIVE_INFINITY;
 			for(var i:int = 0; i<pts.length; i++){
 				//pour chaque point à projeter on calcule la projection vectorielle
 				var pt:MCoordonnee = pts[i] as MCoordonnee;
 				var scalaire:Number = vecteur.getX()*pt.getX() + pt.getY()*vecteur.getY();
 				var projection:MVecteur = new MVecteur();
 				projection.instancie(scalaire * vecteur.getX(),scalaire * vecteur.getY());
 				var val:Number = 0;
              	if(projection.getX()*vecteur.getX() >= 0 && projection.getY() * vecteur.getY() >= 0){
              		// si les vecteurs sont dans le même sens la valeur est positive
                  	val = projection.getNorme();
 				}
              	else{
              		//sinon elle est négatif
                  	val = -projection.getNorme();
               	}
               	//on garde les valeurs maximales et minimales
              	min = Math.min(val, min);
              	max = Math.max(val, max);
 			}
 			res.push(max,min);
 			return res;
 		} 		
	}
}