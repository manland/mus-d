package BarreOutils
{
	import NouvelOnglets.NouvelOnglet;
	
	import Onglets.TabOnglet;
	
	import PanelOptions.PanelOption;
	
	import mx.events.ItemClickEvent;
	import mx.managers.PopUpManager;
	
	public class BarreOutilFichier extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/new_fic.png")] private var nouveau:Class;
		[Bindable] [Embed("Images/barre_outil/enregistrer.png")] private var enregistrer:Class;
		
		private var nb_onglet:int =1;
		private var panel_opt:PanelOption;
		private var tab_onglet:TabOnglet;
		private var fenetre_nouvel_onglet:NouvelOnglet;
		
		public function BarreOutilFichier(tab_onglet:TabOnglet,panel_opt:PanelOption)
		{
			super(tab_onglet);
			this.tab_onglet=tab_onglet;
			this.panel_opt=panel_opt;
			fenetre_nouvel_onglet=new NouvelOnglet(tab_onglet,panel_opt);
			liste_bouton.push({id:"bouton_nouveau", icon:nouveau, toolTip:"Nouveau"});
			liste_bouton.push({id:"bouton_enregistrer", icon:enregistrer, toolTip:"Enregistrer"});
			this.addEventListener(ItemClickEvent.ITEM_CLICK,clicItem);
		}
		
		public function clicItem(event:ItemClickEvent):void
		{	
			if(event.index==0)
			{
				PopUpManager.addPopUp(fenetre_nouvel_onglet, tab_onglet.parent, false);
                PopUpManager.centerPopUp(fenetre_nouvel_onglet);
			}
		}
		
	}
}