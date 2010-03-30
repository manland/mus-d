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
	import flash.display.Graphics;
	import mx.controls.TileList;
	import flash.display.Bitmap;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.ConvolutionFilter;
	
	public class MImage implements MITexture {
		protected var objet:MIObjetGraphique;
		private var url_image:String;
		private var loader:Loader = new Loader();
		private var myBitmap:BitmapData;
		
		private var newWidth:Number;
		private var newHeight:Number;
		
		private var timer:Timer;
		private var a_decorer:MITexture = null;
		
		private var sysout:Text;
		
		public function MImage(sysout:Text, url_image:String="") {
			this.sysout = sysout;
			
			this.objet = null;
			this.url_image = url_image;
			
			var request:URLRequest = new URLRequest(url_image);
            
            loader.load(request);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, finaliser);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, erreur);
         
            myBitmap = null;
		}
		
		public function setObjetADessiner(objet:MIObjetGraphique):void {
			this.objet = objet;
		}
		
		public function setADecorer(texture:MITexture):MITexture {
			a_decorer = texture;
			return this;
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
			graphics.lineStyle(2, 0x000000);
			if(myBitmap != null) {
				finaliser();
				var m:Matrix = new Matrix();
				m.translate(objet.getObjet().getX()+((objet.getObjet().getLargeur()-newWidth)/2), objet.getObjet().getY()+((objet.getObjet().getLargeur()-newHeight)/2));
            	graphics.beginBitmapFill(myBitmap, m, false);
   			}
   			else {
   				timer = new Timer(100, 1);
				timer.addEventListener(TimerEvent.TIMER, objet.redessiner);
				timer.start();
   			}
		}
		
		private function finaliser(event:Event=null):void {
			var bmd:BitmapData = new BitmapData(loader.width, loader.height);
			bmd.draw(loader);
 				
		 	var originalWidth:Number = bmd.width;
		 	var originalHeight:Number = bmd.height;
		 	newWidth = originalWidth;
		 	newHeight = originalHeight;
		 	
		 	var matrix:Matrix = new Matrix();
		 	
		 	var MAX_WIDTH:Number = objet.getObjet().getLargeur();
		 	var MAX_HEIGHT:Number = objet.getObjet().getHauteur();
		 	var scale:Number = 1;
		 
		 	if (originalWidth > MAX_WIDTH || originalHeight > MAX_HEIGHT) {
		  		var sx:Number =  MAX_WIDTH / originalWidth;
		  		var sy:Number = MAX_HEIGHT / originalHeight;
		  		scale = Math.min(sx, sy);
		  		newWidth = originalWidth * scale;
		  		newHeight = originalHeight * scale;	
		  	}
		 	matrix.scale(scale, scale);
		 	myBitmap = new BitmapData(newWidth, newHeight); 
		 	myBitmap.draw(bmd, matrix);
		}
		
		private function erreur(event:IOErrorEvent):void {
			sysout.text += "Impossible de charger l'image : " + url_image;
		}
		
		public function getUrlImage():String {
			return url_image;
		}
	}
}