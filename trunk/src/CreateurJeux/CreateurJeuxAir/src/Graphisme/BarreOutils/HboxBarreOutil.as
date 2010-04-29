package Graphisme.BarreOutils
{
	import Erreurs.Erreur;
	
	import Graphisme.Onglets.TabOnglet;
	import Graphisme.PanelOptions.PanelOption;
	
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
			private var erreur:Erreur;
			
		public function HboxBarreOutil(tab_onglet:TabOnglet,panel_opt:PanelOption,erreur:Erreur)
		{
			super();
			this.erreur=erreur;
			this.panel_opt=panel_opt;
			this.percentWidth=100;
			this.y=25;
			this.tab_onglet=tab_onglet;
			
			barre_outil_fic= new BarreOutilFichier(tab_onglet,panel_opt,erreur);	
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


				