package Graphique.Textures {
	import Graphique.MIObjetGraphique;
	import flash.display.Graphics;
	import mx.controls.Text;
	
	public class MCouleur implements MITexture {
		private var couleur:uint;
		private var a_decorer:MITexture = null;
		
		public var sysout:Text;
		
		public function MCouleur(couleur:uint=0xFF0000) {
			this.couleur = couleur;
		}
		
		public function setADecorer(texture:MITexture):MITexture {
			a_decorer = texture;
			return this;
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
			graphics.lineStyle(2, 0x000000);
			graphics.beginFill(couleur);
		}
		
		public function setObjetADessiner(objet:MIObjetGraphique):void {}
	}
}