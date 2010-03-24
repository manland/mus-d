package Graphique.Textures {
	import Graphique.MIObjetGraphique;
	
	public class MCouleur implements MITexture {
		protected var objet:MIObjetGraphique;
		private var couleur:uint;
		
		public function MCouleur(objet:MIObjetGraphique, couleur:uint=0xFF0000) {
			this.objet = objet;
			this.couleur = couleur;
		}
		
		public function appliquer():Boolean {
			objet.getGraphique().graphics.lineStyle(2, 0x000000);
			objet.getGraphique().graphics.beginFill(couleur);
			return true;
		}
	}
}