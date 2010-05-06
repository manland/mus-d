package Graphique.Textures
{
	import flash.display.Graphics;
	import Graphique.MIObjetGraphique;
	import mx.controls.Label;
	
	public class MTexte extends MTextureAbstraite implements MITexture {
		private var texte:String;
		private var couleur:uint;
		private var label:Label;
		private var texte_est_centre:Boolean = false;
		
		public function MTexte(texte:String="", couleur:uint=0x000000) {
			nom_classe = "MTexte";
			this.texte = texte;
			this.couleur = couleur;
			label = new Label();
			label.text = texte;
			label.regenerateStyleCache(false);
			label.setStyle("color", couleur.toString());
		}
		
		public function centrerText():void {
			texte_est_centre = true;
			if(objet != null) {
				label.x = (objet.getObjet().getLargeur()-label.measureText(texte).width)/2;
				label.y = (objet.getObjet().getHauteur()-label.measureText(texte).height)/2;
			}
		}
		
		public function setXTexte(x:Number):void {
			label.x = x;
			texte_est_centre = false;
		}
		
		public function setYTexte(y:Number):void {
			label.y = y;
			texte_est_centre = false;
		}
		
		public function setTexte(texte:String):void {
			label.text = texte;
			this.texte = texte;
		}
		
		public function setCouleur(couleur:uint):void {
			this.couleur = couleur;
			label.setStyle("color", couleur.toString());
		}
		
		public function getLabel():Label {
			return label;
		}
		
		override public function setObjetADessiner(objet:MIObjetGraphique):void {
			super.setObjetADessiner(objet);
			label.width = objet.getObjet().getLargeur();
			label.height = objet.getObjet().getHauteur();
			objet.getGraphique().addChild(label);
			if(texte_est_centre) {
				centrerText();
			}
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
		}
		
		public function clone():MITexture {
			var clone:MTexte = new MTexte(texte);
			if(a_decorer != null) {
				clone.setADecorer(a_decorer.clone());
			}
			if(texte_est_centre) {
				clone.centrerText();
			}
			return clone;
		}

	}
}