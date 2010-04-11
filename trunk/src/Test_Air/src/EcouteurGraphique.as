package
{
	import Graphique.MIObjetGraphiqueEcouteur;
	import Graphique.MIObjetGraphique;
	import Utilitaires.MAxe;
	import mx.controls.Text;
	import Utilitaires.MErreur;
	import Controleur.MIEffet;
	import Controleur.MMouvementPerpetuel;
	
	public class EcouteurGraphique implements MIObjetGraphiqueEcouteur
	{
		private var sysout:Text;
		private var cpt:int = 0;
		private var mouv:MIEffet;
		public function EcouteurGraphique(sysout:Text, mouv:MIEffet)
		{
			this.sysout = sysout;
			sysout.text = ""+cpt+"\n";
			this.mouv = mouv;
		}
		
		public function graphiqueSeDessine(graphique:MIObjetGraphique):void {
			
		}
		
		public function graphiqueMeurt(graphique:MIObjetGraphique):void {
			sysout.text = ""+cpt+1+"\n";
		}
		
		public function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void {
			(mouv as MMouvementPerpetuel).rebondir(axe);
		}

	}
}