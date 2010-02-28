package Controleur
{
	import flash.events.MouseEvent;
	
	import mx.controls.Text;
	import mx.core.Application;
	import mx.core.UIComponent;

	public class MSouris
	{
		private static var sysout:Text;//Pour débuggage
		
		private var ancienX:Number;
		private var ancienY:Number;
		
		private var ecouteurs:Array;
		
		public function MSouris(compo_a_ecouter:UIComponent = null, s:Text)
		{
			sysout = s;
			ancienX = -1;
			ancienY = -1;
			ecouteurs = new Array();
			if(compo_a_ecouter != null) {
				compo_a_ecouter.addEventListener(MouseEvent.CLICK, clic);
			}
			else {
				Application.application.addEventListener(MouseEvent.CLICK, clic);
			}
			//Application.application.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClic);
			Application.application.addEventListener(MouseEvent.MOUSE_MOVE, bouge);
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
		private function bouge(evenement : MouseEvent):void
		{
			//Alert.show(evenement.stageX.toString());
			var x:Number = evenement.stageX;
			var y:Number = evenement.stageY;
			//sysout.text += "bouge : "+evenement.stageX.toString()+"  "+evenement.stageY.toString()+"\n";
			if(ancienX != -1 && ancienY != -1){
				if(x -  ancienX < 0){
					for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
						ecouteurs[i].bougeGauche(x);
					}
				}
				if(x -  ancienX > 0){
						for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
							ecouteurs[i].bougeDroite(x);
						}
				}
				if(y -  ancienY < 0){
					for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
						ecouteurs[i].bougeHaut();
					}
				}
				if(y -  ancienY > 0){
					for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
						ecouteurs[i].bougeBas();
					}
				}
				
			}
			ancienX = x;
			ancienY = y;
			
		
		}
//		private function doubleClic(evenement : MouseEvent):void
//		{
//			Alert.show("double clic");
//			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
//				ecouteurs[i].doubleClic();
//			}
//		}
		
	}
}