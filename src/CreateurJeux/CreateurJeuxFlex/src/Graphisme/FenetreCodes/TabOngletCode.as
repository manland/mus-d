package Graphisme.FenetreCodes
{
	import mx.containers.TabNavigator;

	
	
	public class TabOngletCode extends TabNavigator
	{
		private var onglet_code:CanvasCode;
	
		public function TabOngletCode()
		{
			super();
			onglet_code = new CanvasCode();
		
			this.percentHeight=100;
			this.percentWidth=100;
			this.addChild(onglet_code);
		}

		
		override protected function createChildren():void{
            super.createChildren();
        }
        
        
        // accesseurs :
        public function getOnglet():CanvasCode  { 
//        	return getChildAt(selectedIndex) as TextAeraCode;
			return onglet_code;
        }
        

        
 	}
}