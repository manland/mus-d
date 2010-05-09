package Utilitaires
{
	import Utilitaires.MCoordonnee;
	
	import mx.controls.Text;
	
	/**
	 * Classe proposant des fonctions static pour fournir un certain nombre de fonctions utiles au developpement
	 */
	public class MUtilitaire
	{
		public function MUtilitaire()
		{
			new MErreur("MUtilitaire", "Constructeur", "La classe MUtilitaire ne doit pas être implémentée, toutes ses fonctions sont à utiliser en static")
		}
		/**
		 * renvoyant un mélange du tableau passé en paramètre
		 * @param tab; tableau que l'on veut mélanger
		 * @return mélange du tableau passé en paramètre
		 */
		public static function melangerTableau(tab:Array):Array
		{
			var taille:int = tab.length;
			var tabRes:Array = new Array();
			var alea:int;
			while (taille > 0)
			{
				alea = Math.abs(taille * Math.random());
				tabRes.push(tab[alea]);
				tab.splice(alea,1);
				taille = tab.length;
			}
			return tabRes;
		}
		/**
		 * retourne l'objet coordonnée ayant l'abscisse la plus grande
		 * @param m1: premier objet coordonnée qu'on veut comparer
		 * @param m2: second objet coordonnée que l'on veut comparer
		 * @return l'objet coordonnée ayant la plus grande abscisse
		 */
		public static function maxMCoordonneeX(m1:MCoordonnee, m2:MCoordonnee):MCoordonnee{
			if(m1.getX() > m2.getX())
				return m1;
			return m2;
		}
		/**
		 * retourne l'objet coordonnée ayant l'ordonnée la plus grande
		 * @param m1: premier objet coordonnée qu'on veut comparer
		 * @param m2: second objet coordonnée que l'on veut comparer
		 * @return l'objet coordonnée ayant la plus grande ordonnée
		 */
		public static function maxMCoordonneeY(m1:MCoordonnee, m2:MCoordonnee):MCoordonnee{
			if(m1.getY() > m2.getY())
				return m1;
			return m2;
		}		
		/**
		 * supprime l'élément passé en paramètre
		 */
		public static function enlever(tab:Array, objet):Array
		{
			tab.splice(tab.indexOf(objet),1);
			return tab;
		}

	}
}