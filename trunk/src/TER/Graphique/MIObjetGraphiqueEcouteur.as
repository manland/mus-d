package Graphique {
	import Utilitaires.MAxe;
	import Coeur.MIObjet;
	
	public interface MIObjetGraphiqueEcouteur {
		function graphiqueSeDessine(graphique:MIObjetGraphique):void;
		function graphiqueMeurt(graphique:MIObjetGraphique):void;
		function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void;
		function graphiqueSeDeplace(graphique:MIObjetGraphique):void;
		function graphiqueChangeTaille(graphique:MIObjetGraphique):void;
		function debutDuJeuGraphique(graphique:MIObjetGraphique):void;
		function finDuJeuGraphique(graphique:MIObjetGraphique):void;
	}
}