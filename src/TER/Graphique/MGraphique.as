package Graphique {
	
	public class MGraphique {
		
		private var sous_classe:MIGraphique;
		
		public function MGraphique() {
			sous_classe = MIGraphique(this);
			if(sous_classe == null)
            {
                throw("Les classes qui étendent MGraphique doivent implementer MIGraphique");
            }
		}
	}
}