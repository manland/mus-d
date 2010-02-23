package Coeur
{
	import mx.containers.Canvas;
	import flash.display.Graphics;
	import Graphique.MIGraphique;
	
	public class MScene extends Canvas implements MIObjet
	{
		public function MScene()
		{
			width = 1000;
			height = 1000;
			
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