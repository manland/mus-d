package Graphique.Textures
{
	import Graphique.MIObjetGraphique;
	import mx.controls.Text;
	
	public class MTextureAbstraite
	{
		
		protected var a_decorer:MITexture = null;
		protected var objet:MIObjetGraphique;
		protected var nom_classe:String = "";
		
		public var sysout:Text = null;
		
		public function MTextureAbstraite()
		{
			nom_classe = "MTextureAbstraite";
		}
		
		public function setObjetADessiner(objet:MIObjetGraphique):void {
			this.objet = objet;
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