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
			this.panel_opt=panel_opt;
			onglet= new Onglet(panel_opt);
			this.percentHeight=100;
			this.percentWidth=100;
			this.addChild(onglet);
		}

		
		override protected function createChildren():void{
        if (!tabBar){
             tabBar = new BarreOnglet();
             tabBar.name = "tabBar";
             tabBar.focusEnabled = false;
             tabBar.styleName = this;
    
             tabBar.setStyle("borderStyle", "none");
             tabBar.setStyle("paddingTop", 0);
             tabBar.setStyle("paddingBottom", 0);
                
             rawChildren.addChild(tabBar);
                
            }
            super.createChildren();
        }
        
        public function getOnglet():Onglet
        {
        	return getChildAt(selectedIndex) as Onglet;
        }
		
		
	}


}
