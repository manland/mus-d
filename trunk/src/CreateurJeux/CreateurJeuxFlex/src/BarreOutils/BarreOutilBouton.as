package BarreOutils
{	
	import FenetreCodes.FenetreCode;
	import FenetreCodes.TextAeraCode;
	
	import Onglets.TabOnglet;
	
	import PanelOptions.PanelOption;
	
	import flash.net.*;
	
	import mx.controls.TextArea;
	import mx.events.ItemClickEvent;
	import mx.managers.PopUpManager;
	
	public class BarreOutilBouton extends BarreOutil
	{
		private var tab_onglet:TabOnglet;
		private var fenetre_code:FenetreCode;
		private var code:TextAeraCode;
		private var myPopUp:TextArea;
		private var panel_opt:PanelOption;
		
		public function BarreOutilBouton(tab_onglet:TabOnglet,panel_opt:PanelOption)
		{
			super(tab_onglet);
			this.percentHeight=100;
			this.panel_opt=panel_opt;
			this.tab_onglet=tab_onglet;
			code=new TextAeraCode();
			fenetre_code=new FenetreCode(code);
			liste_bouton.push({id:"genererCode", label:"Générer Code"});
			
			this.addEventListener(ItemClickEvent.ITEM_CLICK,clicItem);
		}
		
		public function clicItem(event:ItemClickEvent):void
		{	
				fenetre_code.changerCode(tab_onglet.getOnglet().getScene().enregistrer().toString());
                PopUpManager.addPopUp(fenetre_code, tab_onglet.parent, false);
                PopUpManager.centerPopUp(fenetre_code);
		}
		
	}
}