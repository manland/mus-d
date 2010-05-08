package Graphique {
	import flash.display.Graphics;
	import Coeur.MIObjet;
	import mx.core.UIComponent;
	import flash.display.Shape;
	import flash.events.TimerEvent;
	import Graphique.Textures.MITexture;
	import Graphique.Textures.MBordure;
	import Coeur.MIObjetEcouteur;
	import Coeur.Forme.MIForme;
	
	public interface MIObjetGraphique extends MIObjetEcouteur {
		function getGraphique():UIComponent;
		function getObjet():MIObjet;
		function setObjet(objet:MIObjet):void;
		function mourir():void;
		
		function get x():Number;
		function set x(x:Number):void;
		function get y():Number;
		function set y(y:Number):void;
		function get width():Number;
		function set width(width:Number):void;
		function get height():Number;
		function set height(height:Number):void;
		
		function getForme():MIForme;
		function getTexture():MITexture;
		function setTexture(texture:MITexture):void;
		function getBordure():MBordure;
		function setBordure(bordure:MBordure):void;
		function ajouterTexture(texture:MITexture):void;
		
		function redessiner(e:TimerEvent=null):void;
		function ajouterEcouteur(ecouteur:MIObjetGraphiqueEcouteur):void;
		function supprimerEcouteur(ecouteur:MIObjetGraphiqueEcouteur):void;
		
		function getNomClasse():String;
		function clone():MIObjetGraphique;
	}
}