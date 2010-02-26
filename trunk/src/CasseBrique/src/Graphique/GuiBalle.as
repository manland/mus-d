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
		[Embed(source="Graphique/Image/boule.svg")] [Bindable] private var svg_balle:Class;
		
		public function GuiBalle(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			this.x = x;
			this.y = y;
			this.width = largeur;
			this.height = hauteur;
			
			balle = new Balle(x, y, width, height);
			balle.addModelChangeListener(this);
			
			source = svg_balle;
			width = balle.getLargeur();
			height = balle.getHauteur();
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
			return balle;
		}

	}
}