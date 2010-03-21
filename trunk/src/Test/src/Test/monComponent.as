package Test {

	import flash.events.Event;
	import flash.geom.Matrix;
	
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.core.UIComponent;
	
	/**
	* Border color of background for the icon.
	*
	* @default 0xFF0000
	*/
	[Style(name="iconBackgroundColor", type="uint", format="Color")]
	
	[Style(name = "iconBackgroundThickness", type = "Number", format = "Length", inherit = "no")]
	
	public class monComponent extends UIComponent
	{
	
		private var _icon : Image;
		private var _label : Label;
		
		private var _labelPaddingTop : Number;
		private var _iconBackgroundColor : uint = 0x000000;
		private var _iconBackgroundThickness : Number = 1;
		
		private var _idx : Number = 0;
		
		private var _layuotInitialized : Boolean;
		public function monComponent() {
			super();
			labelPaddingTop = 5;
			_icon = new Image();
			_label = new Label();
			
			_label.styleName = "navButtonTextStyle";
			styleName = "mainNavIconStyle";
			
			_icon.addEventListener(Event.INIT, onIconLoaded );
		}
		
		override protected function createChildren():void {
			super.createChildren();
			addChild( _icon );
			addChild( _label );
		}
		
		public function onIconLoaded( p_evt : Event = null ):void {
			layoutLabel();
			invalidateDisplayList();
		}
		
		public function set icon(p_value:Object):void {
			if( p_value is Class ) {
				_icon.source = new p_value();
				onIconLoaded();
			}
			else if( p_value is String ) {
				_icon.source = p_value;
			}
			invalidateDisplayList();
		}
		
		public function get text():String {
			return _label.text;
		}
		
		public function set text(p_value:String):void {
			_label.text = p_value;
			name = p_value;
			invalidateSize();
			invalidateDisplayList();
		}
		
		public function get labelPaddingTop():Number {
			return _labelPaddingTop;
		}
		
		public function set labelPaddingTop(p_value:Number):void {
			_labelPaddingTop = p_value;
		}
		
		public function get idx():Number {
			return _idx;
		}
		
		public function set idx(p_value:Number):void {
			_idx = p_value;
		}
		
		private function layoutLabel() : void {
			if( !_layuotInitialized ) {
				_label.x = width/2 - _label.textWidth / 2;
				_label.y = _icon.contentHeight + labelPaddingTop + _icon.y;
			}
		}
		
		override public function styleChanged(styleProp:String):void {
			super.styleChanged(styleProp);
			if(getStyle("iconBackgroundColor") ) {
				_iconBackgroundColor = getStyle("iconBackgroundColor") as uint;
			}
			if(getStyle("iconBackgroundThickness") ) {
				_iconBackgroundThickness = getStyle("iconBackgroundThickness") as Number;
			}
			invalidateDisplayList();
		}
		
		override protected function measure():void
		{
			super.measure();
			
			if( percentWidth ) {
				measuredWidth = percentWidth;
			}
			if( percentHeight ) {
				measuredHeight = percentHeight;
			}
			if( width ) {
				measuredWidth = width;
			}
			if( height ) {
				measuredHeight = height;
			}
			if( !measuredWidth ) {
				measuredWidth = _icon.contentWidth;
			}
			if( !measuredHeight ) {
				measuredHeight = _icon.contentHeight + labelPaddingTop + _label.getExplicitOrMeasuredHeight();
			}
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight );
			for(var i:Number = 0; i < numChildren; i++) {
				var uic : UIComponent = getChildAt( i ) as UIComponent;
				uic.setActualSize(uic.getExplicitOrMeasuredWidth(), uic.getExplicitOrMeasuredHeight() );
			}
			//draw background circle for the icon, looks like a border
			_icon.graphics.clear();
			_icon.graphics.beginFill( _iconBackgroundColor );
			_icon.graphics.drawCircle( _icon.contentWidth / 2, _icon.contentHeight /2, _icon.contentWidth/2 + _iconBackgroundThickness);
			_icon.graphics.endFill();
			
			layoutLabel();
			_layuotInitialized = true;
		}
	}
}
