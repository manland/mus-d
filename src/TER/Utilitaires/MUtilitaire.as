package Utilitaires
{
	import Utilitaires.MCoordonnee;
	
	import mx.controls.Text;
	
	public class MUtilitaire
	{
		public function MUtilitaire()
		{
			
		}
		
		
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
		
		public static function maxMCoordonneeX(m1:MCoordonnee, m2:MCoordonnee):MCoordonnee{
			if(m1.getX() > m2.getX())
				return m1;
			return m2;
		}
		
		public static function maxMCoordonneeY(m1:MCoordonnee, m2:MCoordonnee):MCoordonnee{
			if(m1.getY() > m2.getY())
				return m1;
			return m2;
		}
		/* afficher et trier déjà fait de base */
		

	}
}