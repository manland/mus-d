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
		function getNomClasse():String; 
		function setNomClasse(nom_classe:String):void;		
						
		
		/*vrai fonctions*/
		function lancer():void;
		function stopper():void;
		function clone():MIEffet;
		
	}
}