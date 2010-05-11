package Graphisme.BarreOutils
{
	import Erreurs.Erreur;
	
	import Graphisme.NouvelOnglets.NouvelOnglet;
	import Graphisme.Onglets.TabOnglet;
	import Graphisme.PanelOptions.PanelOption;
	
	import mx.core.WindowedApplication;
	import mx.events.ItemClickEvent;
	import mx.managers.PopUpManager;
	
	public class BarreOutilFichier extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/new_fic.png")] private var nouveau:Class;
		[Bindable] [Embed("Images/barre_outil/enregistrer.png")] private var enregistrer:Class;
		
		private var nb_onglet:int =1;
		private var erreur:Erreur;
		private var tab_onglet:TabOnglet;
		private var fenetre_nouvel_onglet:NouvelOnglet;
		private var panel_opt:PanelOption;
		
		public function BarreOutilFichier(tab_onglet:TabOnglet,panel_opt:PanelOption,erreur:Erreur)
		{
			super(tab_onglet);
			this.erreur=erreur;
			this.tab_onglet=tab_onglet;
			this.panel_opt=panel_opt;
			fenetre_nouvel_onglet=new NouvelOnglet(tab_onglet,panel_opt,erreur);
			liste_bouton.push({id:"bouton_nouveau", icon:nouveau, toolTip:"Nouveau"});
			liste_bouton.push({id:"bouton_enregistrer", icon:enregistrer, toolTip:"Enregistrer"});
			this.addEventListener(ItemClickEvent.ITEM_CLICK,clicItem);
		}
		
		public function clicItem(event:ItemClickEvent):void
		{	
			if(event.index==0)
			{
				PopUpManager.addPopUp(fenetre_nouvel_onglet, tab_onglet.parentApplication as WindowedApplication, false);
				fenetre_nouvel_onglet.getTextInput().setFocus();
                PopUpManager.centerPopUp(fenetre_nouvel_onglet);
			}
		}
		
	}
}