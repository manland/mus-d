package
{
	import flash.display.Sprite;
    import flash.display.BitmapData;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.geom.Matrix;
    import mx.controls.Text;

	public class TestImage extends Sprite
	{
		private var url:String = "file:///home/manland/workspace/Test/src/nicubunu-personnage.png";
        private var loader:Loader = new Loader();
        
        private var sysout:Text;

		public function TestImage(sysout:Text)
		{
			this.sysout = sysout;
			
			var request:URLRequest = new URLRequest(url);
            
            loader.load(request);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, drawImage);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            
            width = 100;
            height = 100;
            x = 0;
            y = 0;
            
		}
		 private function drawImage(event:Event):void {

            var myBitmap:BitmapData = new BitmapData(loader.width, loader.height, false);
  
            myBitmap.draw(loader);
            
            var matrix:Matrix = new Matrix();
            matrix.rotate(Math.PI/4);
            
            graphics.beginBitmapFill(myBitmap);
            graphics.drawRect(0, 0, 100, 100);
            graphics.endFill();
        }
 
         private function ioErrorHandler(event:IOErrorEvent):void {
            sysout.text += "Unable to load image: " + url;
        }


	}
}