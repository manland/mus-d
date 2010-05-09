package Coeur.Elements {
	
	public class MEtatDestructibleTireurMouvementPerpetuel extends MEtatDestructible {
		
		public function MEtatDestructibleTireurMouvementPerpetuel(element:MTireurMouvementPerpetuel) {
			super(element);
		}
		
		override public function mourir():void {
			(element as MTireurMouvementPerpetuel).stop();
			element.fireMourir();
		}
	}
}