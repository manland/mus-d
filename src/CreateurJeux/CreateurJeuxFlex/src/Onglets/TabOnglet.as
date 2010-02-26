package Onglets
{
	import PanelOptions.PanelOption;
	
	import mx.containers.TabNavigator;

	public class TabOnglet extends TabNavigator
	{
		private var onglet:Onglet;
		private var panel_opt:PanelOption;
		
		public function TabOnglet(panel_opt:PanelOption)
		{
			super();
			this.minHeight=450;
			this.minWidth=450;
			this.percentWidth=100;
			this.percentHeight=100;
			this.panel_opt=panel_opt;
			
			onglet = new Onglet(panel_opt);
			this.addChild(onglet);
			
		}
		
	}

}