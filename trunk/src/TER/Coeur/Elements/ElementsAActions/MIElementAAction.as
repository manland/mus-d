package Coeur.Elements.ElementsAActions {
	import Coeur.Elements.MElementAEtat;
	
	
	public interface MIElementAAction {
		function ajouterElementAAction(element:MIElementAAction):void;
		function activerAction(nom:String):void;
		function desactiverAction(nom:String):void;
		function action(nom:String):void;
		function getElementAEtat():MElementAEtat;
	}
}