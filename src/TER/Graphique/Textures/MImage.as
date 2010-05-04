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
		private var loader:Loader;
		private var myBitmap:BitmapData;
		private var newWidth:Number;
		private var newHeight:Number;
		
		private var timer:Timer;
		
		public function MImage(url_image:String="") {
			nom_classe = "MImage";
			
			this.objet = null;
			this.url_image = url_image;
			
            loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, finaliser);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, erreur);
         
            myBitmap = null;
		}
		
		override public function setObjetADessiner(objet:MIObjetGraphique):void {
			super.setObjetADessiner(objet);
            loader.load(new URLRequest(url_image));
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
			if(myBitmap != null) {
				finaliser();
				var m:Matrix = new Matrix();
            	graphics.beginBitmapFill(myBitmap, m, false);
   			}
   			else {
   				timer = new Timer(100, 1);
				timer.addEventListener(TimerEvent.TIMER, objet.redessiner);
				timer.start();
   			}
		}
		
		private function finaliser(event:Event=null):void {
			var bmd:BitmapData = new BitmapData(loader.width, loader.height, true, 0x00FFFFFF);
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
		  		newWidth = originalWidth * sx;
		  		newHeight = originalHeight * sy;	
		  	}
		  	else if (originalWidth < MAX_WIDTH || originalHeight < MAX_HEIGHT) {
		  		sx = MAX_WIDTH / originalWidth;
		  		sy = MAX_HEIGHT / originalHeight;
		  		newWidth = MAX_WIDTH * sx;
		  		newHeight = MAX_HEIGHT * sy;
		  	}
		 	matrix.scale(sx, sy);
		 	if(newWidth > 2880) {
		 		newWidth = 2880;
		 	}
		 	if(newHeight > 2880) {
		 		newHeight = 2880;
		 	}
		 	try {
		 		myBitmap = new BitmapData(newWidth, newHeight, true, 0x00FFFFFF); 
		 	}
		 	catch(e:Error) {
		 		throw new MErreur("MImage", "finaliser","Erreur le bitmap est invalide vous n'avez probablement, pas donné de taille à votre objet : newWidth:"+newWidth+",newHeight:"+newHeight);
		 	}
		 	myBitmap.draw(bmd, matrix);
		}
		
		private function erreur(event:IOErrorEvent):void {
			throw new MErreur("MImage", "erreur", "Impossible de charger l'image : " + url_image, sysout);
		}
		
		public function getUrlImage():String {
			return url_image;
		}
		
		public function clone():MITexture {
			var clone:MImage = new MImage(new String(url_image));
			if(a_decorer != null) {
				clone.setADecorer(a_decorer.clone());
			}
			return clone;
		}
	}
}