package Controleur {
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import mx.core.Application;
	import mx.controls.Text;
	import flash.events.FocusEvent;
	import flash.ui.KeyLocation;
	import mx.managers.FocusManager;
	import mx.core.UIComponent;
	
	public class Clavier {
		private var ecouteurs:Array;
		
		public function Clavier() {
			Application.application.addEventListener(KeyboardEvent.KEY_DOWN, bouton);
			ecouteurs = new Array();
		}
		
		public function addIClavierListener(m:IClavierListener):void {
			ecouteurs.push(m);
		}
		public function rmIClavierListener(m:IClavierListener):void {
			ecouteurs.slice(ecouteurs.indexOf(m), 1);
		}
		
		public function bouton(evt:KeyboardEvent):void {
			switch(evt.keyCode)
			{
				// déplacement vers la gauche
				case Keyboard.LEFT:
					fireToucheGauche();
					break;
				// déplacement vers le haut
				case Keyboard.UP:
					fireToucheHaut();
					break;
				// déplacement vers la droite
				case Keyboard.RIGHT:
					fireToucheDroite();
					break;
				// déplacement vers le bas
				case Keyboard.DOWN:
					fireToucheBas();
					break;                    
			}
		}
		
		public function fireToucheGauche():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IClavierListener).toucheGauche();
			}
		}
		
		public function fireToucheDroite():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IClavierListener).toucheDroite();
			}
		}
		
		public function fireToucheHaut():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IClavierListener).toucheHaut();
			}
		}
		
		public function fireToucheBas():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IClavierListener).toucheBas();
			}
		}
		
	}
}
