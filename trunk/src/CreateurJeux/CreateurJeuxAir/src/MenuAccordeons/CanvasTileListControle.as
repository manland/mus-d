package MenuAccordeons
{
	import mx.containers.Canvas;

	public class CanvasTileListControle extends Canvas
	{
		private var liste_obj_controle:ListeObjetControle; 
		
		public function CanvasTileListControle()
		{
			super();
			
			liste_obj_controle = new ListeObjetControle();
			this.addChild(liste_obj_controle);
			
		}
		
	}
}