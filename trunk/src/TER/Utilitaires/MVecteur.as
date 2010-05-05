package Utilitaires
{
	/**
	 * Classe représentant un vecteur géométrique
	 */
	public class MVecteur
	{
		/**
		 * nom de la classe
	 	 */
		protected var nom_classe:String;
		/**
		 * abscisse du vecteur
	 	 */
		protected var x:Number;
		/**
		 * ordonnée du vecteur
	 	 */
		protected var y:Number;
		
		/**
		 * crée un vecteur null
	 	 */
		public function MVecteur()
		{
			x = 0;
			y = 0;
			this.nom_classe = "MVecteur";
		}
		
	    /**
		 * instancie le vecteur avec les coordonnées passées en paramètre
		 * @param x: abscisse à donner au vecteur
		 * @param y: ordonnée à donner au vecteur
		 */
		public function instancie(x:Number, y:Number):void
		{	
			this.x = x;
			this.y = y;
		}
		
		/**
		 * retourne la valeur d'abscisse du vecteur receveur
		 * @return valeur d'abscisse du vecteur receveur
		 */
		public function getX():Number
		{
			return this.x;
		}
		/**
		 * remplace la valeur d'abscisse du vecteur receveur par celle passée en paramètre
		 * @param x: nouvelle valeur d'abscisse du vecteur receveur
		 */
		public function setX(x:Number):void
		{
			this.x = x;
		}
		
		/**
		 * retourne la valeur d'ordonnée du vecteur receveur
		 * @return valeur d'ordonnée du vecteur receveur
		 */
		public function getY():Number
		{
			return this.y;
		}
		/**
		 * remplace la valeur d'ordonnée du vecteur receveur par celle passée en paramètre
		 * @param y: nouvelle valeur d'ordonnée du vecteur receveur
		 */
		public function setY(y:Number):void
		{
			this.y = y;
		}
		
		/**
		 * renvoie la chaine qui représente le nom de la classe MVecteur
		 * @return la chaine qui représente le nom de la classe MVecteur : "MVecteur"
		 */
		public function getNomClasse():String
		{
			return nom_classe;
		}
		
		/**
		 * retourne la norme du vecteur receveur (sa longueur)
		 * @return la norme du vecteur receveur
		 * @see http://fr.wikipedia.org/wiki/Norme_%28math%C3%A9matiques%29
		 */
		public function getNorme():Number{
			return Math.sqrt( getX() * getX() + getY() * getY());
		}	
		 /**
		  * retourne un clone du vecteur receveur donc un vecteur ayant les mêmes coordonnées
		  * @return une copie du vecteur receveur
		  */
		public function clone():MVecteur{
			var clone_x:Number = new Number(x);
			var clone_y:Number = new Number(y);
			var clone:MVecteur = new MVecteur();
			clone.instancie(clone_x, clone_y);
			
			return clone;
		}
		
		/**
		 * modifie les coordonnées du vecteur receveur pour qu'il aille du point pt_a au point pt_b
		 * @param pt_a: point de départ du vecteur receveur
		 * @param pt_b: point d'arrivée du vecteur receveur
		 */
		public function entreDeuxPoint(pt_a:MCoordonnee,pt_b:MCoordonnee):void{
			this.instancie(pt_b.getX() - pt_a.getX(), pt_b.getY() - pt_a.getY());
		}
		
		 /**
		  * retourne un vecteur normal (orthogonal) au vecteur receveur
		  * @return un vecteur normal (orthogonal) au vecteur receveur
		  */
		public function getNormal():MVecteur{
			var normal:MVecteur = new MVecteur();
			normal.instancie( -this.getY(), this.getX());
			return normal;
		}
		
		/**
		 * normalise le vecteur receveur c'est-à-dire le redimensionne pour que sa norme soit de 1 mais en gardant la même direction et le même sens
		 */
		public function normalise():void{
			var norme:Number = this.getNorme();
			if(norme != 0){
				setX(getX()/norme);
				setY(getY()/norme);
			}
		}
	}
}