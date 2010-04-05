package Utilitaires
{
	/**
	 * cette classe représente l'axe de collision.
	 */
	public class MAxe
	{
		
		private var axe:int;
		//axe est égale à 
		// 0 si l'axe est parallèle à l'abscisse
		// 1 si il est parallèle à l'ordonné
		// 2 si il est parallèle à la droite d'équation y = x
		// 3 si il est parallèle à la droite d'équation y = -x
		
		
		public function MAxe(){
			
		}
		
		/**
		 * droite caractérisée par l'équation y = ax + b
		 */
		public function instancie(a:Number,b:Number):void
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
		 * collision avec une arete
		 */
		public function instancie2(arete:MArete):void{
			var x1:Number = arete.getArrivee().getX();
			var x2:Number = arete.getDepart().getX();
			var y1:Number = arete.getArrivee().getY();
			var y2:Number = arete.getDepart().getY()
			var a :Number;
			var b:Number;
			
			if(x1 != x2){ // droite d'equation de la forme y = ax + b
				a = (y2 - y1) / (x2 - x1);
				b = y1 - (a * x1);
				instancie(a,b);
			}
			else // droite parallèle à l'axe des ordonnées
				axe = 1;
		}
		
		public function setAxe(axe:int):void{
			if(axe <= 3 && axe >=0){
				this.axe = axe;
			}
		}
		
		public function estHorizontal():Boolean{
			return axe == 0;
		}
		
		public function estVertical():Boolean{
			return axe == 1;
		}
		
		public function estObliqueMontant():Boolean{
			return axe == 2;
		}
		
		public function estObliqueDescendant():Boolean{
			return axe == 3;
		}

	}
}