package
{
	import mx.controls.ButtonBar;
	import mx.controls.Spacer;	
	

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

