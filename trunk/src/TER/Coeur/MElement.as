package Coeur
{
	import mx.core.UIComponent;
	import flash.display.Graphics;
	import Graphique.MIGraphique;
	
	public class MElement extends UIComponent implements MIObjet
	{
		public function MElement()
		{
			width = 100;
			height = 100;
		}
		
		public function dessiner(graphisme:MIGraphique):void {
			graphisme.dessiner(this);
		}
		
		public function getX():Number {
			return x;
		}
		
		public function getY():Number {
			return y;
		}
		
		public function getHauteur():Number {
			return height;
		}
		
		public function getLargeur():Number {
			return width;
		}
		
		public function getGraphics():Graphics {
			return graphics;
		}

	}
}