package Model
{
	import mx.controls.Text;
	import Controleur.Clavier;
	import mx.core.UIComponent;
	import Controleur.IClavierListener;
	
	public class Barre implements IModelObjet, IClavierListener
	{
		private var x:Number;
		private var y:Number;
		private var largeur:Number;
		private var hauteur:Number;
		
		private var ecouteurs:Array;
		
		public function Barre(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = hauteur;
			
			ecouteurs = new Array();
			
			//Objet controlé par clavier
			var clavier:Clavier = new Clavier();
			clavier.addIClavierListener(this);
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
			fireChangeHauteur();
		}
		public function fireChangeHauteur():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IModelChangeListener).modelChangeHauteur(this);
			}
		}
		
		public function toucheBas():void {
			setY(y + 1);
		}
		
		public function toucheHaut():void {
			setY(y - 1);
		}
		
		public function toucheDroite():void {
			setX(x + 1);
		}
		
		public function toucheGauche():void {
			setX(x - 1);
		}
	}
}