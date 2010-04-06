package Graphique.Textures
{
	import Graphique.MIObjetGraphique;
	import flash.display.Graphics;
	
	public interface MITexture
	{
		function appliquer(graphics:Graphics):void;
		function setADecorer(texture:MITexture):MITexture;
		function getADecorer():MITexture;
		function setObjetADessiner(objet:MIObjetGraphique):void;
		function getObjetADessiner():MIObjetGraphique;
		function getNomClasse():String;
		function clone():MITexture;
	}
}