package Decor
{
	import Coeur.Elements.MElementAEtat;
	import Coeur.MJeu;
	import Coeur.MScore;
	
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.MIObjetGraphiqueEcouteur;
	import Graphique.Textures.MCouleur;
	
	import Utilitaires.MAxe;
	
	import mx.controls.Text;
	
	public class Nourriture extends MGraphiqueRond implements MIObjetGraphiqueEcouteur
	{
		protected var scene:MGraphiqueScene;
		protected var score:Text;
		public function Nourriture(scene:MGraphiqueScene, x:Number, y:Number, score:Text)
		{
			super(x, y, 5 , 5);
			this.score = score;
			this.scene = scene;
			super.setTexture(new MCouleur(0xcccc33));
			ajouterEcouteur(this);
			this.nom_classe = "Nourriture";
			var rand:Number = Math.round(Math.random() * 50);
			setObjet(new MElementAEtat(rand,0));
		}
		
		public function graphiqueSeDessine(graphique:MIObjetGraphique):void {
			
		}
		
		public function graphiqueMeurt(graphique:MIObjetGraphique):void {
		}
		
		public function graphiqueCollision(objet:MIObjetGraphique, axe:MAxe):void {
			if(objet as MPacman != null){
				var jeu:MJeu = MJeu.getInstance();
				jeu.augmenterScore(0, (this.getObjet()as MElementAEtat).getPointVie());
				score.text = (jeu.getScores()[0] as MScore).getTotal().toString();
			}
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