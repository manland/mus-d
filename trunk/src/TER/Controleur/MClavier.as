package Controleur
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.controls.Alert;
	import mx.core.Application;
	
	public class MClavier
	{
			private var ecouteurs:Array;
		
		public function MClavier() {
			Application.application.addEventListener(KeyboardEvent.KEY_DOWN, appuis);
			ecouteurs = new Array();
		}
		
		public function ajouterEcouteur(m:MIEcouteurClavier):void {
			ecouteurs.push(m);
		}
		public function enleverEcouteur(m:MIEcouteurClavier):void {
			ecouteurs.slice(ecouteurs.indexOf(m), 1);
		}
		
		private function appuis(evt:KeyboardEvent):void {
			switch(evt.keyCode)
			{
				// appuis sur la fleche gauche
				case Keyboard.LEFT:
					appuisFlecheGauche();
					break;
				// appuis sur la fleche haut
				case Keyboard.UP:
					appuisFlecheHaut();
					break;
				// appuis sur la fleche droite
				case Keyboard.RIGHT:
					appuisFlecheDroite();
					break;
				// appuis sur la fleche bas
				case Keyboard.DOWN:
					appuisFlecheBas();
					break;   
					
				// appuis sur entree
				case Keyboard.ENTER:
					appuisFlecheBas();
					break;
				
				// appuis sur espace
				case Keyboard.BACKSPACE:
					appuisFlecheBas();
					break; 
					
				default:
					appuisTouche(evt.keyCode);
					break;                        
			}
		}
		
		private function appuisFlecheGauche():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).flecheGauche();
			}
		}
		
		private function appuisFlecheDroite():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).flecheDroite();
			}
		}
		
		private function appuisFlecheHaut():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).flecheHaut();
			}
		}
		
		private function appuisFlecheBas():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).flecheBas();
			}
		}
		
		private function appuisEntree():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).entree();
			}
		}
		
		private function appuisEspace():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).espace();
			}
		}
		
		private function appuisTouche(touche:uint):void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIEcouteurClavier).touche(touche);
			}
		}

	}
}