package Graphisme.FenetreCodes
{
	import Erreurs.Erreur;
	
	import flash.events.Event;
	
	import mx.containers.TabNavigator;

	
	
	public class TabOngletCode extends TabNavigator
	{
		private var onglet_code:CanvasCode;
		private var erreur:Erreur;
		private var fenetre_code:FenetreCode;
	
		public function TabOngletCode(fenetre_code:FenetreCode,erreur:Erreur)
		{
			super();
			onglet_code = new CanvasCode();
			this.erreur = erreur;
			this.fenetre_code = fenetre_code;
			this.addEventListener(Event.CHANGE,ongletChange);
			this.percentHeight=100;
			this.percentWidth=100;
			this.addChild(onglet_code);
		}

		
		override protected function createChildren():void{
            super.createChildren();
        }
        
        
        // accesseurs :
        public function getOnglet():CanvasCode  { 

			return getChildAt(selectedIndex) as CanvasCode;
        }
        
        // evenement quand l'onglet change :
        public function ongletChange(event:Event):void
        {
        	fenetre_code.getHboxBtn().setTitreBouton(this.selectedChild.label);	
        }

        
 	}
}