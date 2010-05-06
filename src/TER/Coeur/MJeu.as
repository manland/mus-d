package Coeur
{
	import Utilitaires.MErreur;
	
	public class MJeu
	{
		static private var instance:MJeu = null;
		private var nom_classe:String;
		private var scene:MScene;
		
		public function MJeu()
		{
			scene = null;
			if(instance == null){
				instance = this;
			}
			else{
				throw new MErreur(this.nom_classe, "MJeu()", "Utiliser getInstance pour obtenir une instance de "+this.nom_classe);
			}
		}
		
		public static function getInstance():MJeu{
		 	if(instance == null)
		 		instance = new MJeu();
		 	return instance;
		}
		
		public function getNomClasse():String{
			return this.nom_classe;
		}
		
		public function setScene(scene:MScene):void{
			this.scene = scene;
		}
		public function getScene():MScene{
			return this.scene;
		}
		
		public function debut():void{
			if(scene != null)
				scene.debut()
			else
				throw new MErreur(this.nom_classe, "debut", "Il n'y a pas de scene sur laquelle lancer le jeu");
		}

	}
}