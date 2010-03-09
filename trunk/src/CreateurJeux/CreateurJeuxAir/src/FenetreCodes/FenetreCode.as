package FenetreCodes
{
	import flash.events.Event;
	
	import mx.containers.TitleWindow;
	import mx.containers.VBox;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;

	public class FenetreCode extends TitleWindow
	{
		private var code:TextAeraCode;
		private var hBox_btn:HBoxBouton;
		private var vBox:VBox;
		
		public function FenetreCode(code:TextAeraCode)
		{
			super();
			this.code=code;
			this.title="Code généré : ";
			this.showCloseButton = true;
			this.height=400;
			this.width=400;
			vBox=new VBox();
			vBox.percentHeight=100;
			vBox.percentWidth=100;
			hBox_btn=new HBoxBouton(code);
		}
		
		
		private function closeEventHandler(event:CloseEvent):void
		{
            PopUpManager.removePopUp(this);
        } 

       override protected function createChildren():void
       {
        	super.createChildren();
        	this.addEventListener(Event.CLOSE, closeEventHandler);
	       // code.text = "bla bla encore du texte pour le texteArea";
	       vBox.addChild(hBox_btn);
	       vBox.addChild(code);
        	addChild(vBox);
       }

	   public function changerCode(s:String):void
	   {
	   		code.text=s;
	   }
		
	}
}