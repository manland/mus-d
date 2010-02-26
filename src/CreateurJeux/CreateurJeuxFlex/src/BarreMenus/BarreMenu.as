package BarreMenus
{
	import mx.controls.MenuBar;
	import mx.events.MenuEvent;
	
	
	public class BarreMenu extends MenuBar
	{
		private var liste_xml:XMLList;		
		
		public function BarreMenu()
		{
			super();
			this.percentWidth=100;
			this.height=25;
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
		}
		
	}
}