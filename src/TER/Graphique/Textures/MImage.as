package Graphique.Textures {
	import Graphique.MIObjetGraphique;
	import flash.display.Loader;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import mx.controls.Text;
	
	
	public class MImage implements MITexture {
		protected var objet:MIObjetGraphique;
		private var url_image:String;
		private var loader:Loader = new Loader();
		private var matrix:Matrix;
		private var myBitmap:BitmapData;
		
		private var sysout:Text;
		
		public function MImage(sysout:Text, objet:MIObjetGraphique, url_image:String="") {
			this.sysout = sysout;
			
			this.objet = objet;
			this.url_image = url_image;
			
			var request:URLRequest = new URLRequest(url_image);
            
            loader.load(request);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, erreur);
            
            matrix = null;
            myBitmap = null;
		}
		
		public function appliquer():void {
			sysout.text += "avant le if";
			if(myBitmap != null) {
				sysout.text += "Dans le if";
            	objet.getGraphique().graphics.beginBitmapFill(myBitmap);
   			}
   			else {//Permet par le biai des events de pouvoir utiliser appliquer malgrès que l'image ne soit pas encore loader !!!
   				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, finaliser);
   			}
		}
		
		private function finaliser(event:Event):void {
			myBitmap = new BitmapData(loader.width, loader.height);
            myBitmap.draw(loader);
            
//            matrix = new Matrix();
//            matrix.rotate(Math.PI/4);
            
            appliquer();
		}
		
		private function erreur(event:IOErrorEvent):void {
			sysout.text += "Impossible de charger l'image : " + url_image;
		}
	}
}