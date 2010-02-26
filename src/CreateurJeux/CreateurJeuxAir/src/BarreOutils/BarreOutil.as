package BarreOutils
{
	import mx.controls.ButtonBar;
	

	public class BarreOutil extends ButtonBar
	{
		protected var liste_bouton:Array;
		
		public function BarreOutil()
		{
			super();
			liste_bouton=[];
			this.dataProvider=liste_bouton;
		}
		
	}
}

