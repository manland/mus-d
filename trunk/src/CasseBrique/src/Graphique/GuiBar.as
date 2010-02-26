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
		[Embed(source="Graphique/Image/barre.svg")] [Bindable] private var svg_barre:Class;
		
		public function GuiBar(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			this.x = x;
			this.y = y;
			this.width = largeur;
			this.height = hauteur;
			
			barre = new Barre(x, y, width, height);
			barre.addModelChangeListener(this);
			
			source = svg_barre;
			x = barre.getX();
			y = barre.getY();
			width = barre.getLargeur();
			height = barre.getHauteur();
		}
		
		public function modelChangeX(o:IModelObjet):void {
			x = o.getX();
		}
		public function modelChangeY(o:IModelObjet):void {
			y = o.getY();
		}
		public function modelChangeLargeur(o:IModelObjet):void {
			//sysout.text += o.getLargeur() + "\n";
		}
		public function modelChangeHauteur(o:IModelObjet):void {
			//sysout.text += o.getHauteur() + "\n";
		}
		
		public function getComponent():UIComponent {
			return this;
		}
		public function getObjet():IModelObjet {
			return barre;
		}

	}
}