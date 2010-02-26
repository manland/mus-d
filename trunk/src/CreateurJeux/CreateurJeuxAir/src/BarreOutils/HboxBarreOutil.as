package BarreOutils
{
	import mx.containers.HBox;

	public class HboxBarreOutil extends HBox
	{
			// construction de la barre d'outil :		
			private var barre_outil_fic:BarreOutilFichier;
			private var barre_outil_ed:BarreOutilEdition;
			private var barre_outil_an:BarreOutilAnnuler;
			private var barre_outil_zoom:BarreOutilZoom;
			
		public function HboxBarreOutil()
		{
			super();
			this.percentWidth=100;
			this.y=25;
			
			barre_outil_fic= new BarreOutilFichier();	
			barre_outil_ed=new BarreOutilEdition();
			barre_outil_an = new BarreOutilAnnuler();
			barre_outil_zoom = new BarreOutilZoom();		
				
			this.addChild(barre_outil_fic);	
			this.addChild(barre_outil_ed);
			this.addChild(barre_outil_an);
			this.addChild(barre_outil_zoom);	
		}
		
	}
}


				