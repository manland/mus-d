package BarreOutils
{
	import Onglets.TabOnglet;
	
	import PanelOptions.PanelOption;
	
	import mx.containers.HBox;

	public class HboxBarreOutil extends HBox
	{
			// construction de la barre d'outil :		
			private var barre_outil_fic:BarreOutilFichier;
			private var barre_outil_ed:BarreOutilEdition;
			private var barre_outil_an:BarreOutilAnnuler;
			private var barre_outil_zoom:BarreOutilZoom;
			private var barre_outil_code:BarreOutilCode;
			private var tab_onglet:TabOnglet;
			private var panel_opt:PanelOption;
			
		public function HboxBarreOutil(tab_onglet:TabOnglet,panel_opt:PanelOption)
		{
			super();
			this.percentWidth=100;
			this.y=25;
			this.tab_onglet=tab_onglet;
			this.panel_opt=panel_opt;
			
			barre_outil_fic= new BarreOutilFichier(tab_onglet,panel_opt);	
			barre_outil_ed=new BarreOutilEdition(tab_onglet);
			barre_outil_an = new BarreOutilAnnuler(tab_onglet);
			barre_outil_zoom = new BarreOutilZoom(tab_onglet);
			barre_outil_code = new BarreOutilCode(tab_onglet,panel_opt);		
				
			this.addChild(barre_outil_fic);	
			this.addChild(barre_outil_ed);
			this.addChild(barre_outil_an);
			this.addChild(barre_outil_zoom);	
			this.addChild(barre_outil_code);
		}
		
	}
}


				