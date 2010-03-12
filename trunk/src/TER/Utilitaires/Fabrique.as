package Utilitaires {
	import mx.core.UIComponent;
	import mx.controls.Text;
	import mx.containers.Panel;
	import mx.events.FlexEvent;
	
	public class Fabrique extends UIComponent
	{
		public var test:String = "";
		public var sysout:Text = null;
		public function Test()
		{
			super();
		}
        
		override protected function commitProperties():void {
            super.commitProperties();

			if(sysout != null) {
				var i:Number = 0;
				while(i<10){sysout.text += "Youououphi !! "+test+"\n";i++;}
			}
		}
		
		
		

	}
}