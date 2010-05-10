package Decor
{
	import Coeur.Elements.MDeplacementClavier;
	import Coeur.MIObjet;
	
	import Controleur.MIEcouteurClavier;
	
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.MIObjetGraphiqueEcouteur;
	import Graphique.Textures.MCouleur;
	
	import Utilitaires.MAxe;

	public class MPacman extends MGraphiqueRond implements MIObjetGraphiqueEcouteur
	{
		protected var scene:MGraphiqueScene;
		
		public function MPacman(scene:MGraphiqueScene, x:int, y:int)
		{
			super(x, y,10,10);
			this.scene = scene;
			setFocus();
			super.setTexture(new MCouleur(0xcccc33));
			setObjet(new MDeplacementClavier(100, 10, scene));
			this.nom_classe = "MPacman";
			ajouterEcouteur(this);
		}
		
		public override function objetCollision(objet:MIObjet, axe:MAxe):void {
			super.objetCollision(objet,axe);
		}
		
		public function graphiqueSeDessine(graphique:MIObjetGraphique):void {
			
		}
		
		public function graphiqueMeurt(graphique:MIObjetGraphique):void {
		}
		
		public function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void {
			trace("-------------------------");
			trace("Dans pacman");
			trace(graphique.getNomClasse()); 
			//var m:MIEcouteurClavier = getObjet() as MIEcouteurClavier;
			//m.flecheGauche();m.flecheGauche();m.flecheGauche();
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