package Model
{
	import mx.controls.Text;
	
	public class Balle implements IModelObjet
	{
		private var sysout:Text;
		
		private var x:Number;
		private var y:Number;
		private var largeur:Number;
		private var hauteur:Number;
		
		private var ecouteurs:Array;
		
		public function Balle(t:Text, x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			sysout = t;
			
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = hauteur;
			
			ecouteurs = new Array();
		}
		
		public function addModelChangeListener(m:IModelChangeListener):void {
			ecouteurs.push(m);
		}
		public function rmModelChangeListener(m:IModelChangeListener):void {
			ecouteurs.slice(ecouteurs.indexOf(m), 1);
		}

		public function getX():Number {
			return x;
		}
		public function setX(x:Number):void {
			this.x = x;
			fireChangeX();
		}
		public function fireChangeX():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IModelChangeListener).modelChangeX(this);
			}
		}
		
		public function getY():Number {
			return y;
		}
		public function setY(y:Number):void {
			this.y = y;
			fireChangeY();
		}
		public function fireChangeY():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IModelChangeListener).modelChangeY(this);
			}
		}
		
		public function getLargeur():Number {
			return largeur;
		}
		public function setLargeur(largeur:Number):void {
			this.largeur = largeur;
			fireChangeLargeur();
		}
		public function fireChangeLargeur():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IModelChangeListener).modelChangeLargeur(this);
			}
		}
		
		public function getHauteur():Number {
			return hauteur;
		}
		public function setHauteur(hauteur:Number):void {
			this.hauteur = hauteur;
		}
		public function fireChangeHauteur():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IModelChangeListener).modelChangeHauteur(this);
			}
		}
		
		public function getSysOut():Text {
			return sysout;
		}

	}
}