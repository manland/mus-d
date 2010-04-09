package Coeur
{
	import Utilitaires.MAxe;
	
	public interface MIObjetEcouteur
	{
		function deplacementObjet(objet:MIObjet):void;
		function changementTaille(objet:MIObjet):void;
		function objetMeurt(objet:MIObjet):void;
		function objetNait(objet:MIObjet):void;
		function objetCollision(objet:MIObjet, axe:MAxe):void;
		
	}
}