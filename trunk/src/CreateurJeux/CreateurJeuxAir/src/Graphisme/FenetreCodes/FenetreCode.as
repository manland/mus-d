package Graphisme.FenetreCodes
{
	import flash.events.Event;
	
	import mx.containers.TitleWindow;
	import mx.containers.VBox;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;

	public class FenetreCode extends TitleWindow
	{
		private var hBox_btn:HBoxBouton;
		private var vBox:VBox;
		private var tab_onglet_code:TabOngletCode;
		
		public function FenetreCode()
		{
			
			// avant le constructeur contenait : code:TextaeraCode
			super();
//			this.code=code;
			
			this.tab_onglet_code =null;
			this.title="Code généré : ";
			this.showCloseButton = true;
			this.height=400;
			this.width=400;
			vBox=new VBox();
			vBox.percentHeight=100;
			vBox.percentWidth=100;
			hBox_btn=new HBoxBouton();
			
		}
		
		
		private function closeEventHandler(event:CloseEvent):void
		{
            PopUpManager.removePopUp(this);
        } 

       override protected function createChildren():void
       {
        	super.createChildren();
        	this.addEventListener(Event.CLOSE, closeEventHandler);
  	        vBox.addChild(hBox_btn);
	        vBox.addChild(tab_onglet_code);
	        hBox_btn.setTitreBouton(tab_onglet_code.getOnglet().getNomOnglet());
        	addChild(vBox);
       }

//	   public function changerCode(s:String):void
//	   {
//	   		tab_onglet_code.getOnglet().text=s;
//	   }
//
		public function setTabOnglet(t:TabOngletCode):void { tab_onglet_code = t; hBox_btn.setTabOngletCode(tab_onglet_code);}
		public function getTabOngletCode():TabOngletCode {return tab_onglet_code;}
		public function getHboxBtn():HBoxBouton {return hBox_btn;}
	}
}