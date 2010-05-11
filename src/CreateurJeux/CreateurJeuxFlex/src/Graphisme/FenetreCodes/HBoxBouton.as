package Graphisme.FenetreCodes
{
	import flash.events.MouseEvent;
	import flash.system.System;
	
	import mx.containers.HBox;
	import mx.controls.Button;

	public class HBoxBouton extends HBox
	{
		private var tab_onglet_code:TabOngletCode;
		private var copier:Button;
		private var titre_btn:String;
		
		public function HBoxBouton()
		{
			super();
			this.tab_onglet_code=null;
			this.percentWidth=100;
			copier=new Button();
			titre_btn = new String();
			titre_btn = "";
			copier.label="Copier le code de "+titre_btn;
			if(tab_onglet_code !=null)
			{
				copier.toolTip="Copie la totalité du code de l'onglet : "+tab_onglet_code.getOnglet().getNomOnglet()+"dans le presse-papier";
			}
			
			this.addChild(copier);
			copier.addEventListener(MouseEvent.CLICK,copierCode);
		}
		
		private function copierCode(event:MouseEvent):void
		{
			System.setClipboard(tab_onglet_code.getOnglet().getCode().text);
		} 
		
		public function setTitreBouton(s:String):void {titre_btn = s; copier.label="Copier le code de "+titre_btn;}
		
		public function setTabOngletCode(t:TabOngletCode):void { tab_onglet_code = t;}
		
	}
}