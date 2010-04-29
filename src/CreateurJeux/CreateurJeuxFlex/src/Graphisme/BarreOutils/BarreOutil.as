package Graphisme.BarreOutils
{
	import Graphisme.Onglets.Onglet;
	import Graphisme.Onglets.TabOnglet;
	
	import mx.controls.ButtonBar;
	

	public class BarreOutil extends ButtonBar
	{
		protected var liste_bouton:Array;
		private var tab_onglet:TabOnglet;
		
		public function BarreOutil(tab_onglet:TabOnglet)
		{
			super();
			liste_bouton=[];
			this.tab_onglet=tab_onglet;
			this.dataProvider=liste_bouton;
		}
	}
}

