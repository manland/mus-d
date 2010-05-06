package Graphisme.Onglets
{
	import Erreurs.Erreur;
	
	import Graphisme.PanelOptions.OptionJeu;
	import Graphisme.PanelOptions.PanelOption;
	
	import mx.containers.TabNavigator;

	public class TabOnglet extends TabNavigator
	{
		private var onglet:Onglet;
		private var panel_opt:PanelOption;
		private var option_jeu:OptionJeu;
		private var erreur:Erreur;
	

		public function TabOnglet(panel_opt:PanelOption,option_jeu:OptionJeu,erreur:Erreur)
		{
			super();
			this.erreur=erreur;
			this.panel_opt=panel_opt;
			this.option_jeu = option_jeu;
			onglet= new Onglet(panel_opt,option_jeu,erreur);
//			this.width=800;
//			this.height=600;
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
		
		public function setOptionJeu(opt:OptionJeu):void { option_jeu = opt;	}
		public function getOptionJeu():OptionJeu { return option_jeu;}
		
	}


}
