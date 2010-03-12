package
{
	import mx.core.Application;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class TestImage2 extends Sprite
	{
		public function TestImage2()
		{
			var bmd:BitmapData = new BitmapData(20,20, true, 0x00FFFFFF);
			var care:Rectangle = new Rectangle(0, 0, 10, 10);
			bmd.fillRect(care, 0xFF000000);
			
			
			var fond:MovieClip = new MovieClip ();
			fond.graphics.beginBitmapFill (bmd, null, true, false);
			fond.graphics.drawRect (0, 0, fond.stage.stageWidth, fond.stage.stageHeight);
			
			addChild (fond);

		}

	}
}