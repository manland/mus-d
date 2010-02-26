package MenuAccordeons
{
	import mx.containers.Accordion;

	public class MenuAccordeon extends Accordion
	{
		private var canvas_obj_statique:CanvasTileListStatique;
		private var canvas_obj_controle:CanvasTileListControle;
		private var canvas_obj_dynamique:CanvasTileListDynamique;
		
		public function MenuAccordeon()
		{
			super();
			this.width=150;
			this.height=300;
			
			canvas_obj_statique= new CanvasTileListStatique();
			canvas_obj_statique.label="Objets statiques";
			this.addChild(canvas_obj_statique);
			
			canvas_obj_controle= new CanvasTileListControle();
			canvas_obj_controle.label="Objets controlés";
			this.addChild(canvas_obj_controle);
			
			canvas_obj_dynamique= new CanvasTileListDynamique();
			canvas_obj_dynamique.label="Objets dynamiques";
			this.addChild(canvas_obj_dynamique);
		}
		
	}
}