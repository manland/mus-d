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
	
	public class GuiBrique implements IModelChangeListener, IModelSceneListener
	{
		private var brique:Brique;
		private var balle:Balle;
		private var scene:Scene;
		private var move:MouvementBalle;
		private var sysout:Text;
		private var myCanvas:Canvas;
		
		private var boule_img:Image;
		[Embed(source="boule.svg")] [Bindable] private var svg_balle:Class;
		private var brique_img:Image;
		[Embed(source="brique1.svg")] [Bindable] private var svg_brique:Class;
		
		public function GuiBrique(t:Text, c:Canvas)
		{
			sysout = t;
			myCanvas = c;
			
			//Brique
			brique = new Brique(t, 36, 25);
			brique.addModelChangeListener(this);
			
			brique_img = new Image();
			brique_img.source = svg_brique;
			brique_img.x = brique.getX();
			brique_img.y = brique.getY();
			brique_img.width = brique.getLargeur();
			brique_img.height = brique.getHauteur();
			myCanvas.addChild(brique_img);
			
			//Balle
			balle = new Balle(t, 20, 0, 15, 15);
			balle.addModelChangeListener(this);
			
			boule_img = new Image();
			boule_img.source = svg_balle;
			boule_img.x = balle.getX();
			boule_img.y = balle.getY();
			boule_img.width = balle.getLargeur();
			boule_img.height = balle.getHauteur();
			myCanvas.addChild(boule_img);
			
			//Scene
			scene = new Scene(myCanvas.width, myCanvas.height);
			scene.addEnfant(brique);
			scene.addEnfant(balle);
			scene.addModelSceneListener(this);
			
			//Mouvement balle
			move = new MouvementBalle(balle);
			move.avance(50, scene.getHauteur(), 2000);
		}
		
		public function modelChangeX(o:IModelObjet):void {
//			sysout.text += "X : " + o.getX() + "\n";
			boule_img.x = o.getX();
		}
		public function modelChangeY(o:IModelObjet):void {
//			sysout.text += "Y : " + o.getY() + "\n";
			boule_img.y = o.getY();
		}
		public function modelChangeLargeur(o:IModelObjet):void {
			sysout.text += o.getLargeur() + "\n";
		}
		public function modelChangeHauteur(o:IModelObjet):void {
			sysout.text += o.getHauteur() + "\n";
		}
		
		public function collision(objet1:IModelObjet, objet2:IModelObjet):void {
			sysout.text += "COLLISION\n";
			if(objet1 == balle) {
				myCanvas.removeChild(brique_img);
				scene.rmEnfant(objet2);
			}
			else {
				myCanvas.removeChild(brique_img);
				scene.rmEnfant(objet1);
			}
//			move.avance(100, 0, 2000);
		}
		
		public function collisionBord(objet:IModelObjet):void {
			sysout.text += "COLLISION BORD\n";
			if(objet.getX() <= 0) {//gauche de la scene
				sysout.text += "COLLISION BORD GAUCHE\n";
//				move.avance(50, 0, 2000);
			}
			else if(objet.getX() >= scene.getLargeur()) {//droite de la scene
				sysout.text += "COLLISION BORD DROITE\n";
//				move.avance(40, scene.getHauteur(), 2000);
			}
			else if(objet.getY() >= scene.getHauteur()) {//bas de la scene
				sysout.text += "COLLISION BORD BAS\n";
				move.stop();
				move.avance(130, 0, 3000);
			}
			else if(objet.getY() <= 0) {//haut de la scene
				sysout.text += "COLLISION BORD HAUT\n";
				move.avance(260, scene.getHauteur(), 3000);
			}
		}

	}
}