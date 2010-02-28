package Controleur
{
	import flash.events.MouseEvent;	
	import mx.core.Application;

	public class MSouris
	{
		private var ecouteurs:Array;
		
		public function MSouris()
		{
			ecouteurs = new Array();	
			Application.application.addEventListener(MouseEvent.CLICK, clic);
			Application.application.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClic);		
		}
		
		public function ajouterEcouteur( ecouteur:MIEcouteurSouris):void
		{
			ecouteurs.push(ecouteur);
		}
		
		public function enleverEcouteur( ecouteur:MIEcouteurSouris):void
		{
			ecouteurs.slice(ecouteurs.indexOf(ecouteur), 1);
		}
		
		private function clic(evenement : MouseEvent):void
		{
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				ecouteurs[i].clic();
			}
		}
		private function doubleClic(evenement : MouseEvent):void
		{
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				ecouteurs[i].doubleClic();
			}
		}
		
	}
}