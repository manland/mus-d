package Utilitaires
{
	/**
	 * cette classe représente l'axe de collision.
	 */
	public class MAxe
	{
		/**
		 * nom de la classe ici "MAxe"
		 */ 
		private var nom_classe:String;
		/**
		 * valeur représentant l'inclinaison de l'axe:
		 * <p> axe est égale à 
		 * 0 si l'axe est parallèle à l'axe d'abscisse
		 * 1 si il est parallèle à l'axe d'ordonné
		 * 2 si il est parallèle à la droite d'équation y = x
		 * 3 si il est parallèle à la droite d'équation y = -x </p>
		 */
		private var axe:int;
		
		/**
		 * crée un objet de type MAxe
		 */ 
		public function MAxe(){
			nom_classe = "MAxe";
		}
		
		/**
		 * renvoie la chaine qui représente le nom de la classe de l'objet receveur ici "MAxe"
		 * @return la chaine qui représente le nom de la classe de l'objet receveur ici "MAxe"
		 */
		public function getNomClasse():String{
			return nom_classe;
		}
		
		/**
		 * modifie l'axe pour qu'il soit approximativement parallèle à la droite d'équation y = ax + b
		 * @see http://fr.wikipedia.org/wiki/Fonction_affine#Repr.C3.A9sentation_graphique
		 * @param a: coeffiscient directeur de la droite auquelle on veut que l'axe soit parallèle
		 * @param b: ordonnée à l'origine de la droite auquelle on veut que l'axe soit parallèle
		 */
		public function instancieAvecCoeffiscientDroite(a:Number,b:Number):void
		{
			if(a == 0){ //droite parallèle à l'abscisse
				axe = 0;
			}
			else if(a < 0){
				if(a > -0.5)//droite presque parallèle à l'abscisse
					axe = 0;
				else if (a < -1.5)//droite presque parallèle à l'ordonnée
					axe = 1;
				else //droite presque parallèle à la droite d'équation y = -x
					axe = 3;
			}
			else{
				if(a < 0.5)//droite presque parallèle à l'abscisse
					axe = 0;
				else if (a > 1.5)//droite presque parallèle à l'ordonnée
					axe = 1;
				else //droite presque parallèle à la droite d'équation y = x
					axe = 2;
			}
		}
		
		
		/**
		 * modifie l'axe pour qu'il soit approximativement parallèle à l'arête passée en paramètre
		 * @param arete: arete auquelle on veut que l'axe soit parallèle
		 */
		public function instancieAvecArete(arete:MArete):void{
			var x1:Number = arete.getArrivee().getX();
			var x2:Number = arete.getDepart().getX();
			var y1:Number = arete.getArrivee().getY();
			var y2:Number = arete.getDepart().getY()
			var a :Number;
			var b:Number;
			
			if(x1 != x2){ // droite d'equation de la forme y = ax + b
				a = (y2 - y1) / (x2 - x1);
				b = y1 - (a * x1);
				instancieAvecCoeffiscientDroite(a,b);
			}
			else // droite parallèle à l'axe des ordonnées
				axe = 1;
		}
		
		/**
		 * modifie l'axe pour qu'il soit approximativement perpendiculaire à l'arête passée en paramètre
		 * @param arete: arete auquelle on veut que l'axe soit perpendiculaire
		 */
		public function perpendiculaireA(arete:MArete):void{
			instancieAvecArete(arete);
			
			if(estHorizontal()){//s'il est horizontal
				axe = 1;//on le met vertical
			}
			else if(estVertical()){//s'il est vertical 
				axe = 0;//on le met horizontal
			}
			else if(estObliqueMontant()){//s'il est oblique montant
				axe = 3;//on le met oblique descendant
			}
			else if(estObliqueDescendant()){//s'il est oblique descendant
				axe = 2;//on le met oblique montant
			}
		}
		
		/**
		 * modifie l'axe pour qu'il soit approximativement perpendiculaire au vecteur passé en paramètre
		 * @param vecteur: vecteur auquel on veut que l'axe soit perpendiculaire
		 */
		public function orthogonalA(vecteur:MVecteur):void{
			var arete:MArete = new MArete(new MCoordonnee(0,0),new MCoordonnee(vecteur.getX(),vecteur.getY()));
			this.perpendiculaireA(arete);			
		}
		
		/**
		 * modifie la valeur de l'inclinaison de l'axe par celle passée en paramètre
		 * @param axe: nouvelle valeur de l'inclinaison de l'axe
		 */
		public function setAxe(axe:int):void{
			if(axe <= 3 && axe >=0){
				this.axe = axe;
			}
		}
		
		/**
		 * retourne vrai si l'axe est horizontal c'est-à-dire parallèle à l'axe d'abscisse
		 * @return vrai si l'axe est horizontal
		 */
		public function estHorizontal():Boolean{
			return axe == 0;
		}
		/**
		 * retourne vrai si l'axe est vertical c'est-à-dire parallèle à l'axe d'ordonnée
		 * @return vrai si l'axe est vertical
		 */
		public function estVertical():Boolean{
			return axe == 1;
		}
		/**
		 * retourne vrai si l'axe est oblique montant c'est-à-dire parallèle à la droite d'équation y = x
		 * @return vrai si l'axe est oblique montant
		 */
		public function estObliqueMontant():Boolean{
			return axe == 2;
		}
		/**
		 * retourne vrai si l'axe est oblique descendant c'est-à-dire parallèle à la droite d'équation y = -x
		 * @return vrai si l'axe est oblique descendant
		 */
		public function estObliqueDescendant():Boolean{
			return axe == 3;
		}

	}
}