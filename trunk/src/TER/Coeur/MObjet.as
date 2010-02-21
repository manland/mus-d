package Coeur
{
	import Graphique.*;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import mx.core.UIComponent;
	
	public class MObjet extends UIComponent
	{
		
		public function MObjet()
		{
			width = 100;
			height = 100;
		}
		
		public function dessiner(graphisme:MDegrade):void {
			graphisme.dessiner(this);
		}

	}
}