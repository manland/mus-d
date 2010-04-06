package Graphique.Textures {
	import Graphique.MIObjetGraphique;
	import flash.display.Graphics;
	import mx.controls.Text;
	
	public class MCouleur extends MTextureAbstraite implements MITexture {
		private var couleur:uint;
		
		public function MCouleur(couleur:uint=0xFF0000) {
			nom_classe = "MCouleur";
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
			graphics.beginFill(couleur);
		}
		
		public function clone():MITexture {
			var clone:MCouleur = new MCouleur(couleur);
			clone.setObjetADessiner(objet);
			if(a_decorer != null) {
				clone.setADecorer(a_decorer.clone());
			}
			return clone;
		}
	}
}