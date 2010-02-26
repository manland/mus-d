package MenuAccordeons
{
	import mx.containers.Canvas;

	public class CanvasTileListStatique extends Canvas
	{
		private var liste_obj_statique:ListeObjetStatiques;
		
		public function CanvasTileListStatique()
		{
			super();
			this.height=150;
			this.width=300;
			
			liste_obj_statique=new ListeObjetStatiques();
			this.addChild(liste_obj_statique);

		}
		
	}
}