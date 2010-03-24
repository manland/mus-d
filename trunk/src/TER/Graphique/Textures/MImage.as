package Graphique.Textures {
	import Graphique.MIObjetGraphique;
	import flash.display.Loader;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import mx.controls.Text;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class MImage implements MITexture {
		protected var objet:MIObjetGraphique;
		private var url_image:String;
		private var loader:Loader = new Loader();
		private var matrix:Matrix;
		private var myBitmap:BitmapData;
		
		private var timer:Timer;
		
		private var sysout:Text;
		
		public function MImage(sysout:Text, objet:MIObjetGraphique, url_image:String="") {
			this.sysout = sysout;
			
			this.objet = objet;
			this.url_image = url_image;
			
			var request:URLRequest = new URLRequest(url_image);
            
            loader.load(request);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, finaliser);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, erreur);
            
            matrix = null;
            myBitmap = null;
		}
		
		public function appliquer():Boolean {
			objet.getGraphique().graphics.lineStyle(2, 0x000000);
			if(myBitmap != null) {
            	objet.getGraphique().graphics.beginBitmapFill(myBitmap, null, false);
            	return true;
   			}
   			else {
   				timer = new Timer(100, 1);
				timer.addEventListener(TimerEvent.TIMER, objet.redessiner);
				timer.start();
   			}
   			return false;
		}
		
		private function finaliser(event:Event):void {
			myBitmap = new BitmapData(loader.width, loader.height);
            myBitmap.draw(loader);
            
//            matrix = new Matrix();
//            matrix.rotate(Math.PI/4);
            
//            appliquer();
		}
		
		private function erreur(event:IOErrorEvent):void {
			sysout.text += "Impossible de charger l'image : " + url_image;
		}
	}
}