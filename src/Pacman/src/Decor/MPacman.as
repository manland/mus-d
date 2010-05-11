package Decor
{
	import Coeur.Elements.MDeplacementClavier;
	import Coeur.MIObjet;
	
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.MIObjetGraphiqueEcouteur;
	import Graphique.Textures.MCouleur;
	
	import Utilitaires.MAxe;
	
	import mx.controls.Text;

	public class MPacman extends MGraphiqueRond implements MIObjetGraphiqueEcouteur
	{
		protected var scene:MGraphiqueScene;
		protected var etat:Text;
		
		public function MPacman(scene:MGraphiqueScene, x:int, y:int, etat:Text)
		{
			super(x, y,10,10);
			this.etat = etat;
			this.scene = scene;
			setFocus();
			super.setTexture(new MCouleur(0xcccc33));
			setObjet(new MDeplacementClavier(100, 0, scene));
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
			if((graphique as Mur != null) || (graphique as MGraphiqueScene != null)){
				var m:MDeplacementClavier = getObjet() as MDeplacementClavier;
				m.annuler();
			}
			else if((graphique as Ennemi) != null){
				etat.text= "Perdu....";
			}else if((graphique as Nourriture) != null){
				graphique.mourir();
				etat.text= "Miammmmmmm";
				var a:Array = this.scene.getChildren();
				var taille_tableau = a.length;
				var cpt:Number = 0;
				var last:Nourriture;
				for(var i:uint=0; i<taille_tableau; i++){
					var n:Nourriture = a[i] as Nourriture;
					if(n != null){
						cpt++;
						last = n;
					}
				}
				if(cpt == 0)
					etat.text= "Victoire";
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