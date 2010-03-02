package Coeur
{
	public interface MIObjetEcouteur
	{
		function deplacementObjet(objet:MIObjet):void;
		function changementTaille(objet:MIObjet):void;
		function objetMeurt(objet:MIObjet):void;
		function objetNait(objet:MIObjet):void;
		
	}
}