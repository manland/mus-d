package Graphisme.BarreOutils
{	
	import Erreurs.Erreur;
	
	import Graphisme.FenetreCodes.FenetreCode;
	import Graphisme.FenetreCodes.TextAeraCode;
	import Graphisme.Onglets.TabOnglet;
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.net.*;
	
	import mx.controls.TextArea;
	import mx.events.ItemClickEvent;
	import mx.managers.PopUpManager;
	
	public class BarreOutilCode extends BarreOutil
	{
		private var tab_onglet:TabOnglet;
		private var fenetre_code:FenetreCode;
		private var code:TextAeraCode;
		private var myPopUp:TextArea;
		private var erreur:Erreur;
		private var panel_opt:PanelOption;
		
		public function BarreOutilCode(tab_onglet:TabOnglet,panel_opt:PanelOption)
		{
			super(tab_onglet);
			this.panel_opt=panel_opt;
			this.percentHeight=100;
			this.erreur=erreur;
			this.tab_onglet=tab_onglet;
			code=new TextAeraCode();
			fenetre_code=new FenetreCode(code);
			liste_bouton.push({id:"genererCode", label:"Générer Code"});
			
			this.addEventListener(ItemClickEvent.ITEM_CLICK,clicItem);
		}
		
		public function clicItem(event:ItemClickEvent):void
		{	
			var nom_jeu:String = tab_onglet.getOnglet().getNomJeu();
			var type_jeu:String = tab_onglet.getOnglet().getTypeJeu();
			if(type_jeu=="Flex")
			{
				fenetre_code.changerCode(tab_onglet.getOnglet().genererCodeApplicationFlex(nom_jeu).toString());
			}
			else if(type_jeu=="Air")
			{
				fenetre_code.changerCode(tab_onglet.getOnglet().genererCodeApplicationAir(nom_jeu).toString());
			}
            PopUpManager.addPopUp(fenetre_code, tab_onglet.parent, false);
            PopUpManager.centerPopUp(fenetre_code);
		}
		
	}
}