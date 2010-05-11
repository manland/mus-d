package Decor
{
	import Coeur.Elements.MDeplacementClavier;
	import Coeur.MJeu;
	
	import Controleur.MClavier;
	
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
		private var taille:Number;
		
		public function MPacman(scene:MGraphiqueScene, x:int, y:int, etat:Text, taille:Number)
		{
			super(x, y,taille, taille);
			this.etat = etat;
			this.scene = scene;
			setFocus();
			this.taille = taille;
			super.setTexture(new MCouleur(0xcccc33));
			this.nom_classe = "MPacman";
			setObjet(new MDeplacementClavier(100, 0, scene, taille/2));
			ajouterEcouteur(this);
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
			else if((graphique as Ennemi) != null && MJeu.getInstance().getEstCommence()){
				etat.text= "Perdu....";
				MJeu.getInstance().fin();
				this.setTexture(new MCouleur(0xff0000));
			}else if((graphique as Nourriture) != null && MJeu.getInstance().getEstCommence()){
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
				if(cpt == 0){
					etat.text= "Victoire";
					MJeu.getInstance().fin();
					this.setTexture(new MCouleur(0x00ff00));
				}
			}
		}
		
		public function graphiqueSeDeplace(graphique:MIObjetGraphique):void {
		}
		
		public function graphiqueChangeTaille(graphique:MIObjetGraphique):void {
			
		}
		
		public function debutDuJeuGraphique(graphique:MIObjetGraphique):void {
		}
		
		public function finDuJeuGraphique(graphique:MIObjetGraphique):void {
			MClavier.getInstance().enleverEcouteur((this.getObjet() as MDeplacementClavier));
		}
		
	}
}