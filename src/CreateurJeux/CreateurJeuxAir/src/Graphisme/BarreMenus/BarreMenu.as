package Graphisme.BarreMenus
{
	import Erreurs.Erreur;
	
	import Graphisme.NouvelOnglets.NouvelOnglet;
	import Graphisme.Onglets.TabOnglet;
	import Graphisme.PanelOptions.OptionJeu;
	import Graphisme.PanelOptions.PanelOption;
	
	import mx.controls.MenuBar;
	import mx.core.WindowedApplication;
	import mx.events.MenuEvent;
	import mx.managers.PopUpManager;
	
	
	public class BarreMenu extends MenuBar
	{
		private var liste_xml:XMLList;		
		private var tab_onglet:TabOnglet;
		private var fenetre_nouvel_onglet:NouvelOnglet;
		private var erreur:Erreur; 
		private var panel_option:PanelOption;
		private var option_jeu:OptionJeu;
		

		public function BarreMenu(tab_onglet:TabOnglet,panel_opt:PanelOption,option_jeu:OptionJeu,erreur:Erreur)
		{
			super();
			this.percentWidth=100;
			this.height=25;
			this.erreur = erreur;
			this.panel_option = panel_opt;
			this.option_jeu = option_jeu;
			this.tab_onglet = tab_onglet;
			fenetre_nouvel_onglet=new NouvelOnglet(tab_onglet,panel_opt,erreur);
			initialisation();
		}
		
		public function initialisation():void
		{
			// remplissage de la liste xml qui contient les elements du menu :
			liste_xml=
			<>
				<menuTitre label="Fichier">
				     <menuItem label="Nouveau"/>
				     <menuItem label="Quitter"/>
				</menuTitre>
				<menuTitre label="Edition">
					<menuItem label="Annuler"/>
					<menuItem label="Refaire" />
				</menuTitre>
			</>;	
			
			this.labelField="@label";			// on affecte les labels
			this.dataProvider=liste_xml;
			
			// evenements :
			this.addEventListener(MenuEvent.ITEM_CLICK,actionsMenu);
			
		}
		
		// permet de donner une action au sous-menu cliqué
		public function actionsMenu(event:MenuEvent):void
		{
              if(event.item.@label=="Quitter")
              {
              		this.parentApplication.close();
              }
              else if(event.item.@label=="Nouveau")
              {
              		nouvelOnglet();
              }
		}
				
		public function nouvelOnglet():void
		{
			PopUpManager.addPopUp(fenetre_nouvel_onglet, tab_onglet.parentApplication as WindowedApplication, false);
			fenetre_nouvel_onglet.getTextInput().setFocus();
            PopUpManager.centerPopUp(fenetre_nouvel_onglet);	
		}
	}
}