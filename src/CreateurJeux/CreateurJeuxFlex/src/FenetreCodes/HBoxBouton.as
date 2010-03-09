package FenetreCodes
{
	import flash.events.MouseEvent;
	import flash.system.System;
	
	import mx.containers.HBox;
	import mx.controls.Button;

	public class HBoxBouton extends HBox
	{
		private var code:TextAeraCode;
		private var copier:Button;
		
		public function HBoxBouton(code:TextAeraCode)
		{
			super();
			this.code=code;
			this.percentWidth=100;
			copier=new Button();
			copier.label="Copier tout le code";
			copier.toolTip="Copie la totalité du code dans le presse-papier";
			
			this.addChild(copier);
			copier.addEventListener(MouseEvent.CLICK,copierCode);
		}
		
		private function copierCode(event:MouseEvent):void
		{
			System.setClipboard(code.text);
		} 
		
	}
}