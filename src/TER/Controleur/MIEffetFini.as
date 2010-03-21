package Controleur
{
	public interface MIEffetFini extends MIEffet
	{
		function lancer(x_arrivee:Number, y_arrivee:Number, temps_ms:Number):void;
	}
}