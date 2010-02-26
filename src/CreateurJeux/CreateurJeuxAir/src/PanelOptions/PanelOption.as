package PanelOptions
{
	import mx.containers.Panel;
	import mx.controls.TextArea;

	public class PanelOption extends Panel
	{
		public var sysout:TextArea;
		public function PanelOption()
		{
			super();
			this.layout="vertical";
			this.height=400;
			this.width=150;
			sysout= new TextArea();
			sysout.percentHeight=100;
			this.addChild(sysout);
		}
		
	}
}