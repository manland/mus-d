package Graphique.Textures
{
	import Graphique.MIObjetGraphique;
	import flash.display.Graphics;
	
	public interface MITexture
	{
		function appliquer(graphics:Graphics):void;
		function setADecorer(texture:MITexture):MITexture;
	}
}