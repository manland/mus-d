package Graphique
{
	import flash.display.Graphics;
	import Coeur.MIObjet;
	import mx.core.UIComponent;
	import flash.display.Shape;
	import flash.events.TimerEvent;
	
	public interface MIObjetGraphique
	{
		function getObjet():MIObjet;
		function getGraphique():UIComponent;
		function redessiner(e:TimerEvent=null):void;
	}
}