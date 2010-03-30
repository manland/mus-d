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
	
	public class MGraphiqueScene extends Canvas implements MIObjetGraphique {
		protected var objet:MScene;
		protected var forme:MFormeRectangle;
		protected var ma_texture:MITexture;
		
		public var texture:MITexture;
		public var rgb:String;
		
		public var sysout:Text;
		
		public function MGraphiqueScene() {
			super();
			objet = new MScene();
			forme = new MFormeRectangle();
			objet.setForme(forme);
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
		
		public function redessiner(e:TimerEvent=null):void {
			invalidateDisplayList();
		}
		
		public function getTexture():MITexture {
			return ma_texture;
		}
		
		public function setTexture(texture:MITexture):void {
			this.ma_texture = texture;
			invalidateDisplayList();
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
            if(texture != null) {
            	setTexture(texture);
            }
			invalidateDisplayList();
		}
	}
}