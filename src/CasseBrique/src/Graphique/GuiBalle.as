package Graphique
{
	import mx.controls.Image;
	import Model.IModelChangeListener;
	import Model.Balle;
	import Model.IModelObjet;
	import mx.core.UIComponent;
	
	public class GuiBalle extends Image implements IModelChangeListener, IGuiObjet
	{
		private var balle:Balle;
		private var boule_img:Image;
		[Embed(source="Graphique/Image/boule.svg")] [Bindable] 
			private var svg_balle:Class;
		private var ecouteurs:Array;
		public function GuiBalle(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			this.x = x;
			this.y = y;
			this.width = largeur;
			this.height = hauteur;
			ecouteurs = new Array();
			
			balle = new Balle(x, y, width, height);
			balle.addModelChangeListener(this);
			
			source = svg_balle;
			width = balle.getLargeur();
			height = balle.getHauteur();
		}
		
		public function addGuiChangeListener(m:IGuiChangeListener):void {
			ecouteurs.push(m);
		}
		
		public function modelChangeX(o:IModelObjet):void {
			x = o.getX();
		}
		public function modelChangeY(o:IModelObjet):void {
			y = o.getY();
		}
		public function modelChangeLargeur(o:IModelObjet):void {
			width = o.getLargeur();
		}
		public function modelChangeHauteur(o:IModelObjet):void {
			height = o.getHauteur();
		}
		public function modelMeurt(o:IModelObjet):void {
			mourir();
		}
		public function modelNait(o:IModelObjet):void {
			naitre();
		}
		
		public function getComponent():UIComponent {
			return this;
		}
		public function getObjet():IModelObjet {
			return balle;
		}
		public function mourir():void {
			fireMourir();
		}
		private function fireMourir():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IGuiChangeListener).guiMeurt(this);
			}
		}
		public function naitre():void {
			fireNaitre();
		}
		private function fireNaitre():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IGuiChangeListener).guiNait(this);
			}
		}

	}
}