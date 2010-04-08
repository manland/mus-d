package Graphique.Textures {
	import Graphique.MIObjetGraphique;
	import flash.display.Graphics;
	import mx.controls.Text;
	
	public class MCouleur extends MTextureAbstraite implements MITexture {
		private var couleur:uint;
		private var alpha:int;
		
		public function MCouleur(couleur:uint=0xFF0000, alpha:int=1) {
			nom_classe = "MCouleur";
			this.couleur = couleur;
			this.alpha = alpha;
		}
		
		public function getCouleur():uint {
			return couleur;
		}
		
		public function setCouleur(couleur:uint):void {
			this.couleur = couleur;
		}
		
		public function getAlpha():int {
			return alpha;
		}
		
		public function setAlpha(alpha:int):void {
			this.alpha = alpha;
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
			graphics.beginFill(couleur, alpha);
		}
		
		public function clone():MITexture {
			var clone:MCouleur = new MCouleur(couleur);
			if(a_decorer != null) {
				clone.setADecorer(a_decorer.clone());
			}
			return clone;
		}
	}
}