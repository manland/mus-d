package MenuAccordeons
{
	import mx.controls.TileList;

	public class ListeObjets extends TileList
	{
		protected var liste:Array;
		
		public function ListeObjets()
		{
			super();
			liste= [];
			this.maxColumns=2;
			this.rowHeight=50;
			this.columnWidth=50;
			this.width=130;	 
			this.dragEnabled=true;
			this.dataProvider=liste;
		}
		
	}
}