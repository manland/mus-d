package Onglets
{
    
    import PanelOptions.PanelOption;
    
    import flash.display.DisplayObject;
    import flash.events.Event;
    
    import mx.collections.IList;
    import mx.containers.ViewStack;
    import mx.controls.TabBar;
    import mx.core.ClassFactory;
    import mx.core.IFlexDisplayObject;
    import mx.core.mx_internal;
    
    
    public class BarreOnglet extends TabBar{
        
        use namespace mx_internal;
        
        
        public function BarreOnglet(){
            super();
            navItemFactory = new ClassFactory(TabEvent);
        }
        
        override protected function createNavItem(label:String,icon:Class = null):IFlexDisplayObject{
            var ifdo:IFlexDisplayObject = super.createNavItem(label,icon);
            ifdo.addEventListener(TabEvent.CLOSE_TAB, onCloseTabClicked);
            return ifdo;
        }
       
        public function onCloseTabClicked(event:Event):void{
            var index:int = getChildIndex(DisplayObject(event.currentTarget));
            if (getChildren().length>1)
            {
	            if(dataProvider is IList){
    	            dataProvider.removeItemAt(index);
        	    }
            	else if(dataProvider is ViewStack){
                	dataProvider.removeChildAt(index);
            	}
            }
        }
    }
}
