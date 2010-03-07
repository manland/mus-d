package Coeur
{
	import mx.controls.Text;
	
	public class MUtilitaire
	{
		//apres debuggage enlever sysout et remettre melanger tableau en static
		var sysout : Text;
		public function MUtilitaire(sysout : Text)
		{
			this.sysout = sysout;
		}
		
		
		public function melangerTableau(tab:Array):Array
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
		/* afficher et trier déjà fait de base */
		

	}
}