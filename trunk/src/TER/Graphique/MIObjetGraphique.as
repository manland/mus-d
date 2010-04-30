package Graphique
{
	import flash.display.Graphics;
	import Coeur.MIObjet;
	import mx.core.UIComponent;
	import flash.display.Shape;
	import flash.events.TimerEvent;
	import Graphique.Textures.MITexture;
	import Graphique.Textures.MBordure;
	
	public interface MIObjetGraphique
	{
		function getObjet():MIObjet;
		function getGraphique():UIComponent;
		function getTexture():MITexture;
		function setTexture(texture:MITexture):void;
		function getBordure():MBordure;
		function setBordure(bordure:MBordure):void;
		function ajouterTexture(texture:MITexture):void;
		function redessiner(e:TimerEvent=null):void;
		function getNomClasse():String;
		function clone():MIObjetGraphique;
		function ajouterEcouteur(ecouteur:MIObjetGraphiqueEcouteur):void;
	}
}