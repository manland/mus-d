package Controleur
{
	import Coeur.MIObjet;
	import flash.utils.Timer;
	
	public interface MIEffet
	{
		/*getteur et setteur*/
		function getObjet():MIObjet;
		function setObjet(objet:MIObjet):void;
		function getTimer():Timer;	
		function setTimer(timer:Timer):void;	
						
		
		/*vrai fonctions*/
		function stopper():void;
	}
}