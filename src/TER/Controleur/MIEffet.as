package Controleur
{
	import Coeur.MIObjet;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	/**
	 * Sert à appliquer un Effet (mouvement, redimensionnement...) sur un objet
	 */
	public interface MIEffet
	{
		//getteur et setteur//
		
		/**
		 * renvoie l'objet sur lequel s'applique l'effet receveur
		 * @return l'objet sur lequel s'applique l'effet receveur
		 */
		function getObjet():MIObjet;
		/**
		 * remplace l'objet sur lequel s'applique l'effet par celui passé en paramètre
		 * @param le nouvel objet sur lequel on veut que s'applique l'effet receveur
		 */
		function setObjet(objet:MIObjet):void;
		/**
		 * renvoie le timer de l'effet receveur
		 * @return le timer de l'effet receveur
		 */
		function getTimer():Timer;	
		/**
		 * remplace le timer de l'effet par celui passé en paramètre
		 * @param le nouveau timer de l'effet receveur
		 */
		function setTimer(timer:Timer):void;
		/**
		 * renvoie la chaine qui représente le nom de la classe de l'effet receveur
		 * @return la chaine qui représente le nom de la classe de l'effet receveur
		 */
		function getNomClasse():String; 
				
		
		//vrais fonctions//		
		/**
		 * effectue les calculs nécessaires et lance l'effet receveur
		 */
		function lancer():void;
		/**
		 * stoppe l'effet receveur
		 */
		function stopper():void;
		/**
		 * renvoie un clone de l'effet receveur
		 */
		function clone():MIEffet;
		/**
		 * fonction appelée par le Timer à chaque fois que finit une unité de temps
		 * @param e: evenement du timer qui annonce la fin d'un compte à rebours		 		 
		 */		
		function appliqueUnite(e:TimerEvent):void
		
	}
}