package Graphique.Textures
{
	import Graphique.MIObjetGraphique;
	import mx.controls.Text;
	import Utilitaires.MErreur;
	
	public class MTextureAbstraite
	{
		private var sous_classe:MITexture;
		protected var a_decorer:MITexture = null;
		protected var objet:MIObjetGraphique;
		protected var nom_classe:String = "";
		
		public var sysout:Text = null;
		
		public function MTextureAbstraite() {
			nom_classe = "MTextureAbstraite";
			sous_classe = MITexture(this);
			if(sous_classe == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent MTextureAbstraite doivent implementer MITexture");
			}
		}
		
		public function setADecorer(texture:MITexture):MITexture {
			a_decorer = texture;
			return sous_classe;
		}
		
		public function setObjetADessiner(objet:MIObjetGraphique):void {
			this.objet = objet;
			if(a_decorer != null) {
				a_decorer.setObjetADessiner(objet);
			}
		}
		
		public function getObjetADessiner():MIObjetGraphique {
			return objet;
		}
		
		public function getADecorer():MITexture {
			return a_decorer;
		}
		
		public function getNomClasse():String {
			return nom_classe;
		}

	}
}