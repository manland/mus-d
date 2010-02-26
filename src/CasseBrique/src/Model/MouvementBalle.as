package Model
{
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.TimerEvent;
	
	public class MouvementBalle
	{
		private var objet:IModelObjet;
		private var timer:Timer;
		private var tx:Number;
		private var ty:Number;
		private var A:Number;
		private var B:Number;
		private var type_droite:Number;//0 = normal; 1 = horizontale; 2 = verticale
		public function MouvementBalle(objet:IModelObjet)
		{
			this.objet = objet;
		}
		
		public function avance(tx:Number, ty:Number, temps_ms:Number):void {
			if(timer != null) {
				stop();
			}
			this.tx = tx;
			this.ty = ty;
			calculEquationDroite();
			var distance:Number = Math.sqrt(((tx-objet.getX())*(tx-objet.getX())) +
											((ty-objet.getY())*(ty-objet.getY())));
			var temps_1_pixel:Number = temps_ms/distance;
			timer = new Timer(temps_1_pixel, distance);
			timer.addEventListener(TimerEvent.TIMER, finUnPixel);
			timer.start();
		}
		
		public function stop():void {
			timer.stop();
		}
		
		public function finUnPixel(e:TimerEvent):void {
			if(type_droite == 1) {//droite horizontale
				objet.setY(objet.getY() + 1);
			}
			else {
				objet.setX(objet.getX() + 1);
				objet.setY(calculPoint(objet.getX()));
			}
		}
		
		//Retourne le y en fonction du x
		private function calculPoint(x:Number):Number {
			if(type_droite == 0) {//droite normale
				return (A * x) + B;
			}
			else if(type_droite == 1) {//droite horizontale
				return objet.getY();
			}
			else {//droite verticale
				return objet.getY() + 1;
			}
		}
		
		//Calcul le a et le b de y = ax+b
		private function calculEquationDroite():void {
			if(objet.getX() == tx) {
				type_droite = 2;//droite verticale
			}
			else if(objet.getY() == ty) {
				type_droite = 1;//droite horizontale
			}
			else {
				type_droite = 0;//droite normale
				A = (objet.getY() - ty) / (objet.getX() - tx);
				B = objet.getY() - (A * objet.getX());
			}
		}

	}
}