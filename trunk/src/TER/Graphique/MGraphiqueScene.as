package Graphique {
	import Coeur.*;
	import mx.containers.Canvas;
	import mx.core.UIComponent;
	import flash.events.TimerEvent;
	import Graphique.Textures.MITexture;
	import Coeur.Forme.MIForme;
	import Graphique.Textures.MCouleur;
	import Coeur.Forme.MFormeRectangle;
	import flash.display.DisplayObject;
	import mx.controls.Text;
	
	public class MGraphiqueScene extends Canvas implements MIObjetGraphique, MIObjetEcouteur {
		protected var objet:MScene;
		protected var forme:MFormeRectangle;
		protected var ma_texture:MITexture;
		
		public var rgb:String;
		
		public var sysout:Text;
		
		public function MGraphiqueScene() {
			super();
			objet = new MScene();
			objet.ajoutObjetEcouteur(this);
			forme = new MFormeRectangle();
			objet.setForme(forme);
			ma_texture = new MCouleur(0xFFFFFF);
			
			horizontalScrollPolicy = "auto";
			verticalScrollPolicy = "auto";
		}
		
		override public function addChild(child:DisplayObject):DisplayObject {
			var obj:DisplayObject = super.addChild(child);
			var graphique:MIObjetGraphique = child as MIObjetGraphique;
			if(graphique != null) {
				objet.ajouterEnfants(graphique.getObjet());
			}
			return obj;
		}
		
		public function getObjet():MIObjet {
			return objet;
		}
		
		public function getGraphique():UIComponent {
			return this;
		}
		
		public function setTexture(t:MITexture):void {
			texture = t;
		}
		
		public function getTexture():MITexture {
			return ma_texture;
		}
		
		public function set texture(une_texture:MITexture):void {
			ma_texture = une_texture;
			ma_texture.setObjetADessiner(this);
			invalidateDisplayList();
		}
		
		public function get texture():MITexture {
			return ma_texture;
		}
		
		public function redessiner(e:TimerEvent=null):void {
			invalidateDisplayList();
		}
		
		public function deplacementObjet(objet:MIObjet):void {
			x = objet.getX();
			y = objet.getY();
			invalidateDisplayList();
		}
		
		public function changementTaille(objet:MIObjet):void {
			width = objet.getLargeur();
			height = objet.getHauteur();
			invalidateDisplayList();
		}
		
		public function objetMeurt(objet:MIObjet):void {
			parent.removeChild(this);
		}
		
		public function objetNait(objet:MIObjet):void {
		}
		
		public function set largeur(largeur:Number):void {
			super.width = largeur;
			if(objet.getLargeur() != largeur) {
				objet.setLargeur(largeur);
			}
		}
		
		public function get largeur():Number {
			return objet.getLargeur();
		}
		
		public function set hauteur(hauteur:Number):void {
			super.height = hauteur;
			if(objet.getHauteur() != hauteur) {
				objet.setHauteur(hauteur);
			}
		}
		
		public function get hauteur():Number {
			return objet.getHauteur();
		}
		
		override public function set x(x:Number):void {
			super.x = x;
			if(objet.getX() != x) {
				objet.setX(x);
			}
		}
		
		override public function set y(y:Number):void {
			super.y = y;
			if(objet.getY() != y) {
				objet.setY(y);
			}
		}
		
		override public function set width(width:Number):void {
			super.width = width;
			if(objet.getLargeur() != width) {
				objet.setLargeur(width);
			}
		}
		
		override public function set height(height:Number):void {
			super.height = height;
			if(objet.getHauteur() != height) {
				objet.setHauteur(height);
			}
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight );
			dessiner();
		}
		
		protected function dessiner():void {
			graphics.clear();
			ma_texture.appliquer(graphics);
			graphics.moveTo(forme.getX(), forme.getY());
			graphics.drawRect(forme.getX(), forme.getY(), forme.getLargeur(), forme.getHauteur());
//			if(sysout != null) {
//				sysout.text += "objet => x:"+forme.getX()+" y:"+forme.getY()+" largeur:"+forme.getLargeur()+" hauteur:"+forme.getHauteur()+"\n";
//				sysout.text += "gaphique => x:"+x+" y:"+y+" largeur:"+width+" hauteur:"+height+"\n";
//			}
			graphics.endFill();
		}
		
		override protected function commitProperties():void {
            super.commitProperties();
            forme.instancie(x, y, width, height);
//            if(ma_texture != null) {
//            	setTexture(texture);
//            }
			invalidateDisplayList();
		}
	}
}