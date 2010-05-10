package Coeur.Elements {
	
	public class MEtatDestructibleTireurMouvementPerpetuel extends MEtatDestructible {
		
		public function MEtatDestructibleTireurMouvementPerpetuel(element:MControleMouvementPerpetuel) {
        	super(element);
	    }
	    
	    override public function mourir():void {
            (element as MControleMouvementPerpetuel).stop();
            element.fireMourir();
	    }
	}
}