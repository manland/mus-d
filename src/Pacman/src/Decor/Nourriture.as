package Decor
{
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.MIObjetGraphiqueEcouteur;
	import Graphique.Textures.MCouleur;
	
	import Utilitaires.MAxe;
	
	public class Nourriture extends MGraphiqueRond implements MIObjetGraphiqueEcouteur
	{
		protected var scene:MGraphiqueScene;
		public function Nourriture(scene:MGraphiqueScene, x:Number, y:Number)
		{
			super(x, y, 5 , 5);
			this.scene = scene;
			super.setTexture(new MCouleur(0xcccc33));
			ajouterEcouteur(this);
			this.nom_classe = "Nourriture";
		}
		
		public function graphiqueSeDessine(graphique:MIObjetGraphique):void {
			
		}
		
		public function graphiqueMeurt(graphique:MIObjetGraphique):void {
		}
		
		public function graphiqueCollision(objet:MIObjetGraphique, axe:MAxe):void {
			trace("-------------------------");
			trace("Dans nourriture"); 
			trace(objet.getNomClasse()); 
			this.mourir();
		}
		
		public function graphiqueSeDeplace(graphique:MIObjetGraphique):void {
			
			
		}
		
		public function graphiqueChangeTaille(graphique:MIObjetGraphique):void {
			
		}
		
		public function debutDuJeuGraphique(graphique:MIObjetGraphique):void {
			
		}
		
		public function finDuJeuGraphique(graphique:MIObjetGraphique):void {
			
		}

	}
}