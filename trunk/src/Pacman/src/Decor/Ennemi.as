package Decor
{
	import Coeur.MIObjet;
	
	import Controleur.MMouvementRecherche;
	
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.MIObjetGraphiqueEcouteur;
	import Graphique.Textures.MCouleur;
	
	import Utilitaires.MAxe;

	public class Ennemi extends MGraphiqueRond implements MIObjetGraphiqueEcouteur
	{
		protected var scene:MGraphiqueScene;
		protected var mouvement:MMouvementRecherche;
		public function Ennemi(scene:MGraphiqueScene, x:int, y:int, taille:Number, pacman:MPacman)
		{
			super(x, y,taille, taille);
			this.scene = scene;
			super.setTexture(new MCouleur(0x0055ff));
			if(pacman != null && pacman.getObjet() != null){
				mouvement = new MMouvementRecherche(this.getObjet() as MIObjet, pacman.getObjet() as MIObjet, taille, 500);
			}
			ajouterEcouteur(this);
		}
		
		public function graphiqueSeDessine(graphique:MIObjetGraphique):void {
			
		}
		
		public function graphiqueMeurt(graphique:MIObjetGraphique):void {
		}
		
		public function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void {
			if((graphique as Mur != null) || (graphique as MGraphiqueScene != null)){
				mouvement.annuler();
			}
		}
		
		public function graphiqueSeDeplace(graphique:MIObjetGraphique):void {
			
		}
		
		public function graphiqueChangeTaille(graphique:MIObjetGraphique):void {
			
		}
		
		public function debutDuJeuGraphique(graphique:MIObjetGraphique):void {
			mouvement.lancer();
		}
		
		public function finDuJeuGraphique(graphique:MIObjetGraphique):void {
			mouvement.stopper();
		}
	}
}