package Controleur
{
	public interface MIEffet
	{
		function lancer(x_arrivee:Number, y_arrivee:Number, temps_ms:Number):void;
		function stopper():void;		
	}
}