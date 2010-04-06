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
	import Utilitaires.MErreur;
	
	public class MImage extends MTextureAbstraite implements MITexture {
		private var url_image:String;
		private var loader:Loader = new Loader();
		private var myBitmap:BitmapData;
		private var newWidth:Number;
		private var newHeight:Number;
		private var garder_ratio:Boolean;
		
		private var timer:Timer;
		
		public function MImage(url_image:String="") {
			nom_classe = "MImage";
			
			this.objet = null;
			this.url_image = url_image;
			this.garder_ratio = false;
			
			var request:URLRequest = new URLRequest(url_image);
            
            loader.load(request);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, finaliser);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, erreur);
         
            myBitmap = null;
		}
		
		public function setADecorer(texture:MITexture):MITexture {
			a_decorer = texture;
			return this;
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
			if(myBitmap != null) {
				finaliser();
				var m:Matrix = new Matrix();
				m.translate(objet.getObjet().getX(), objet.getObjet().getY());
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
		 	var sx:Number = 1;
		 	var sy:Number = 1;
		 	if (originalWidth > MAX_WIDTH || originalHeight > MAX_HEIGHT) {
		  		sx =  MAX_WIDTH / originalWidth;
		  		sy = MAX_HEIGHT / originalHeight;
		  		if(garder_ratio) {
		  			sx = sy = Math.min(sx, sy);
		  		}
		  		newWidth = originalWidth * sx;
		  		newHeight = originalHeight * sy;	
		  	}
		  	else if (originalWidth < MAX_WIDTH || originalHeight < MAX_HEIGHT) {
		  		sx = MAX_WIDTH / originalWidth;
		  		sy = MAX_HEIGHT / originalHeight;
		  		if(garder_ratio) {
		  			sx = sy = Math.min(sx, sy);
		  		}
		  		newWidth = MAX_WIDTH * sx;
		  		newHeight = MAX_HEIGHT * sy;
		  	}
		 	matrix.scale(sx, sy);
		 	myBitmap = new BitmapData(newWidth, newHeight); 
		 	myBitmap.draw(bmd, matrix);
		}
		
		private function erreur(event:IOErrorEvent):void {
			throw new MErreur("MImage", "erreur", "Impossible de charger l'image : " + url_image, sysout);
		}
		
		public function getUrlImage():String {
			return url_image;
		}
		
		public function getGarderRatio():Boolean {
			return garder_ratio;
		}
		public function setGarderRatio(garder_ratio:Boolean) {
			this.garder_ratio = garder_ratio;
		}
		
		public function clone():MITexture {
			var clone:MImage = new MImage(new String(url_image));
			clone.setObjetADessiner(objet);
			if(a_decorer != null) {
				clone.setADecorer(a_decorer.clone());
			}
			return clone;
		}
	}
}