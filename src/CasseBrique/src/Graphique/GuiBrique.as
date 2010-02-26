package Graphique
{
	import Model.Brique;
	import Model.IModelChangeListener;
	import mx.containers.Panel;
	import mx.controls.Text;
	import Model.IModelObjet;
	import Model.MouvementBalle;
	import Model.Balle;
	import Model.Scene;
	import Model.IModelSceneListener;
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.core.Application;
	import Model.Barre;
	import Controleur.Clavier;
	import mx.core.UIComponent;
	
	public class GuiBrique extends Image implements IModelChangeListener, IGuiObjet
	{
		private var brique:Brique;
		private var brique_img:Image;
		[Embed(source="Graphique/Image/brique1.svg")] [Bindable] private var svg_brique:Class;
		
		public function GuiBrique(x:Number = 0, y:Number = 0, largeur:Number = 30, hauteur:Number = 30)
		{
			this.x = x;
			this.y = y;
			this.width = largeur;
			this.height = hauteur;
			
			brique = new Brique(x, y);
			brique.addModelChangeListener(this);
			
			source = svg_brique;
			x = brique.getX();
			y = brique.getY();
			width = brique.getLargeur();
			height = brique.getHauteur();
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
			return brique;
		}

	}
}