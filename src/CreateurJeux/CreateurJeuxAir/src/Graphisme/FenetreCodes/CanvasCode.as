package Graphisme.FenetreCodes
{
	import mx.containers.Canvas;
	import mx.controls.TextArea;

	public class CanvasCode extends Canvas
	{
		private var code:TextArea;
		private var nom_onglet:String;
	
		public function CanvasCode()
		{
			super();
			this.percentHeight=100;
			this.percentWidth=100;
			nom_onglet =null;
			this.label = nom_onglet;
			code =new TextArea();
			code.percentHeight=100;
			code.percentWidth=100;
			this.addChild(code);
		}
		
		// accesseurs : 
		public function getCode():TextArea { return code;}
		public function getNomOnglet():String {return this.label;}
        public function setNomOnglet(s:String):void {nom_onglet = s; this.label= nom_onglet; }
	}
}