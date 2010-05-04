package Graphique {
	import Utilitaires.MAxe;
	
	public interface MIObjetGraphiqueEcouteur {
		function graphiqueSeDessine(graphique:MIObjetGraphique):void;
		function graphiqueMeurt(graphique:MIObjetGraphique):void;
		function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void;
		function graphiqueSeDeplace(x:Number, y:Number):void;
		function graphiqueChangeTaille(objet:MIObjetGraphique):void;
	}
}