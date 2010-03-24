package Graphique
{
	import Coeur.MIObjetEcouteur;
	import mx.core.UIComponent;
	import Coeur.MIObjet;
	import Graphique.Textures.MITexture;
	import Coeur.MElement;
	import Coeur.MStatique;
	import Coeur.MControle;
	import Coeur.MDynamique;
	import Graphique.Textures.MCouleur;
	import mx.controls.Text;
	import Coeur.Forme.MIForme;
	import flash.events.TimerEvent;
	
	public class MGraphiqueAbstrait extends UIComponent implements MIObjetGraphique, MIObjetEcouteur
	{
		protected var objet:MIObjet;
		protected var forme:MIForme;
		protected var ma_texture:MITexture;
		
		public var type:String;
		public var texture:String;
		public var rgb:String;
		
		public var sysout:Text;
		
		public function MGraphiqueAbstrait()
		{
			objet = new MElement();
			objet.ajoutObjetEcouteur(this);
			ma_texture = new MCouleur(this);
		}
		
		public function getObjet():MIObjet {
			return objet;
		}
		
		public function getGraphique():UIComponent {
			return this;
		}
		
		public function setObjet(objet:MIObjet):void {
			if(this.objet != null) {
				this.objet.supprimeObjetEcouteur(this);
			}
			this.objet = objet;
			this.objet.ajoutObjetEcouteur(this);
		}
		
		public function getTexture():MITexture {
			return ma_texture;
		}
		
		public function setTexture(texture:MITexture):void {
			this.ma_texture = texture;
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
		
		protected function dessiner():void {}
		
		override protected function commitProperties():void {
            super.commitProperties();
            if(type != null) {
            	if(type == "MStatique") {
            		setObjet(new MStatique());
            	}
            	else if(type == "MControle") {
            		setObjet(new MControle());
            	}
            	else if(type == "MDynamique") {
            		setObjet(new MDynamique());
            	}
            	
            	if(forme != null) {
            		getObjet().setForme(forme);
            	}
            }
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
		
		public function redessiner(e:TimerEvent=null):void {
			invalidateDisplayList();
		}

	}
}