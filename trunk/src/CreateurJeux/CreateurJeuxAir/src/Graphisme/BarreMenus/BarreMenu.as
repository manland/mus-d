package Graphisme.BarreMenus
{
	import Erreurs.Erreur;
	
	import Graphisme.NouvelOnglets.NouvelOnglet;
	import Graphisme.Onglets.TabOnglet;
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.events.KeyboardEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	
	import mx.controls.MenuBar;
	import mx.events.MenuEvent;
	import mx.managers.PopUpManager;
	
	
	public class BarreMenu extends MenuBar
	{
		private var liste_xml:XMLList;		
		private var tab_onglet:TabOnglet;
		private var fenetre_nouvel_onglet:NouvelOnglet;
		private var erreur:Erreur; 
		private var panel_option:PanelOption;
		

		public function BarreMenu(tab_onglet:TabOnglet,panel_opt:PanelOption,erreur:Erreur)
		{
			super();
			this.percentWidth=100;
			this.height=25;
			this.erreur = erreur;
			this.panel_option = panel_opt;
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
			PopUpManager.addPopUp(fenetre_nouvel_onglet, tab_onglet.parent, false);
			fenetre_nouvel_onglet.getTextInput().setFocus();
            PopUpManager.centerPopUp(fenetre_nouvel_onglet);	
		}
	}
}