package Graphique.Textures
{
	import flash.display.Graphics;
	import Graphique.MIObjetGraphique;
	import mx.controls.Label;
	
	public class MTexte extends MTextureAbstraite implements MITexture {
		private var texte:String;
		private var couleur:uint;
		private var label:Label;
		
		public function MTexte(texte:String="", couleur:uint=0x000000) {
			nom_classe = "MTexte";
			this.texte = texte;
			this.couleur = couleur;
			label = new Label();
			label.text = texte;
			label.regenerateStyleCache(false);
		}
		
		public function centrerText():void {
			if(objet != null) {
				label.x = (objet.getObjet().getLargeur()-label.measureText(texte).width)/2;
				label.y = (objet.getObjet().getHauteur()-label.measureText(texte).height)/2;
			}
		}
		
		public function setTexte(texte:String):void {
			label.text = texte;
			this.texte = texte;
		}
		
		override public function setObjetADessiner(objet:MIObjetGraphique):void {
			super.setObjetADessiner(objet);
			label.width = objet.getObjet().getLargeur();
			label.height = objet.getObjet().getHauteur();
			objet.getGraphique().addChild(label);
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
		}
		
		public function clone():MITexture {
			return null;
		}

	}
}