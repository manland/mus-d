package Erreurs
{
	import mx.containers.Panel;
	import mx.controls.Text;

	public class Erreur extends Panel
	{
		public var sysout:Text;
		
		public function Erreur()
		{
			super();
			this.layout="vertical";
			this.height=400;
			this.width=150;
			sysout= new Text();
			sysout.percentHeight=100;
			this.addChild(sysout);
		}
		
	}
}