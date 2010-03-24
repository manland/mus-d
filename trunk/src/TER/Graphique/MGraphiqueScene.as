package Graphique {
	import Coeur.*;
	import mx.containers.Canvas;
	import mx.core.UIComponent;
	import flash.events.TimerEvent;
	import Graphique.Textures.MITexture;
	import Coeur.Forme.MIForme;
	import Graphique.Textures.MCouleur;
	
	public class MGraphiqueScene extends Canvas implements MIObjetGraphique {
		protected var objet:MIObjet;
		protected var forme:MIForme;
		protected var ma_texture:MITexture;
		
		public var texture:String;
		public var rgb:String;
		
		public function MGraphiqueScene() {
			super();
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
			ma_texture.appliquer();
			graphics.moveTo(x, y);
			graphics.drawRect(x, y, width, height);
			graphics.endFill();
		}
		
		override protected function commitProperties():void {
            super.commitProperties();
            if(texture != null) {
            	if(texture == "MCouleur") {
            		if(rgb != null) {
            			setTexture(new MCouleur(this, uint("0x"+rgb)));
            		}
            	}
            	else if(texture == "MDegrade") {
            		
            	}
            	else if(texture == "MImage") {
            		
            	}
            }
			invalidateDisplayList();
		}
	}
}