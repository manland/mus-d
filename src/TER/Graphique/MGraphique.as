package Graphique {
	
	public class MGraphique {
		
		private var sous_classe:MIGraphique;
		
		protected var nom_classe:String;
		
		public function MGraphique() {
			nom_classe = "MGrahique";
			sous_classe = MIGraphique(this);
			if(sous_classe == null)
            {
                throw("Les classes qui étendent MGraphique doivent implementer MIGraphique");
            }
		}
	}
}