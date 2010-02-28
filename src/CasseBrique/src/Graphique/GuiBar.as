package Graphique
{
	import mx.controls.Image;
	import Model.IModelObjet;
	import Model.Barre;
	import Model.IModelChangeListener;
	import mx.core.UIComponent;
	
	public class GuiBar extends Image implements IModelChangeListener, IGuiObjet
	{
		private var barre:Barre;
		private var barre_img:Image;
		[Embed(source="Graphique/Image/barre.svg")] [Bindable] 
			private var svg_barre:Class;
		private var ecouteurs:Array;
		public function GuiBar(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			this.x = x;
			this.y = y;
			this.width = largeur;
			this.height = hauteur;
			ecouteurs = new Array();
			
			barre = new Barre(x, y, width, height);
			barre.addModelChangeListener(this);
			
			source = svg_barre;
			x = barre.getX();
			y = barre.getY();
			width = barre.getLargeur();
			height = barre.getHauteur();
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
			return barre;
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