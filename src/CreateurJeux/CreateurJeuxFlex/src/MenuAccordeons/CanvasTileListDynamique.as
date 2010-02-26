package MenuAccordeons
{
	import mx.containers.Canvas;

	public class CanvasTileListDynamique extends Canvas
	{
		private var liste_obj_dynamique:ListeObjetDynamique; 
		
		public function CanvasTileListDynamique()
		{
			super();
			
			liste_obj_dynamique=new ListeObjetDynamique();
			this.addChild(liste_obj_dynamique);
			
		}
		
	}
}