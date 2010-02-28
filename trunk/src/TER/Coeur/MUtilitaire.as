package Coeur
{
	public class MUtilitaire
	{
		public function MUtilitaire()
		{
		}
		
		
		public static function melangerTableau(tab:Array):Array
		{
			var taille:int = tab.length;
			var tabRes:Array = new Array(taille);
			var alea:int;
			while (taille > 0)
			{
				alea = Math.abs(taille * Math.random());
				tabRes.push(tab[alea]);
				tab = tab.splice(alea,1);
				taille = tab.length;
			}
			return tabRes;
		}
		/* afficher et trier déjà fait de base */
		

	}
}