package Coeur.Elements
{
	import Coeur.MIObjet;
	import Coeur.MIObjetEcouteur;
	import Utilitaires.MAxe;
	import Utilitaires.MErreur;
	
	public class AbstraitDestructibleEtat implements MIObjetEcouteur
	{
		private var objet:MIObjet;
		private var desctructible:MIDestructible;
		private var nom_classe:String;
		
		public function AbstraitDestructibleEtat(objet:MIObjet)
		{
			desctructible = MIDestructible(this);
			nom_classe = "AbstraitDestructibleEtat";
			if(desctructible == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent AbstraitDestructibleEtat.as doivent implementer MIDestructible");
			}
			objet.ajoutObjetEcouteur(this);
		}
		
		public function deplacementObjet(objet:MIObjet):void {
			
		}
		
		public function changementTaille(objet:MIObjet):void {
			
		}
		
		public function objetMeurt(objet:MIObjet):void {
			
		}
		
		public function objetNait(objet:MIObjet):void {
			
		}
		
		public function objetCollision(objet:MIObjet, axe:MAxe):void {
			
		}

	}
}