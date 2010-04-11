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
	import Graphique.Textures.MBordure;
	import Utilitaires.MErreur;
	import mx.olap.aggregators.MaxAggregator;
	import Utilitaires.MAxe;
	
	public class MGraphiqueAbstrait extends UIComponent implements MIObjetGraphique, MIObjetEcouteur
	{
		private var sous_classe:MIObjetGraphique;
		protected var objet:MIObjet;
		protected var forme:MIForme;
		protected var ma_texture:MITexture;
		protected var ma_bordure:MBordure;
		protected var nom_classe:String;
		protected var ecouteurs:Array = new Array();
		
		public var type:String;
		
		public var sysout:Text;
		
		public function MGraphiqueAbstrait()
		{
			objet = new MElement();
			objet.ajoutObjetEcouteur(this);
			ma_texture = new MCouleur();
			ma_bordure = null;
			nom_classe = "MGraphiqueAbstrait";
			sous_classe = MIObjetGraphique(this);
			if(sous_classe == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent MGraphiqueAbstrait doivent implementer MIObjetGraphique");
			}
		}
	
		public function ajouterEcouteur(ecouteur:MIObjetGraphiqueEcouteur):void {
			ecouteurs.push(ecouteur);
		}
		
		public function fireSeDessine():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).graphiqueSeDessine(this);
			}
		}
		
		public function fireMeurt():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).graphiqueMeurt(this);
			}
		}
		
		public function fireCollision(axe:MAxe):void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).graphiqueCollision(this, axe);
			}
		}
		
		public function objetCollision(objet:MIObjet, axe:MAxe):void {
			fireCollision(axe);
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
			changementTaille(objet);
			deplacementObjet(objet);
		}
		
		public function setTexture(t:MITexture):void {
			texture = t;
		}
		
		public function getTexture():MITexture {
			return ma_texture;
		}
		
		public function set texture(texture:MITexture):void {
			ma_texture = texture;
			ma_texture.setObjetADessiner(this);
			invalidateDisplayList();
		}
		
		public function get texture():MITexture {
			return ma_texture;
		}
		
		public function ajouterTexture(texture:MITexture):void {
			if(ma_texture == null) {
				ma_texture = texture;
			}
			else {
				ma_texture = texture.setADecorer(ma_texture);
				ma_texture.setObjetADessiner(this);
				invalidateDisplayList();
			}
		}
		
		public function setBordure(b:MBordure):void {
			bordure = b;
		}
		
		public function getBordure():MBordure {
			return ma_bordure;
		}
		
		public function set bordure(bordure:MBordure):void {
			ma_bordure = bordure;
			ma_bordure.setObjetADessiner(this);
			invalidateDisplayList();
		}
		
		public function get bordure():MBordure {
			return ma_bordure;
		}
		
		public function ajouterBordure(bordure:MBordure):void {
			if(ma_bordure == null) {
				ma_bordure = bordure;
			}
			else {
				var bordure_temp:MITexture = bordure.setADecorer(ma_bordure);
				ma_bordure = bordure_temp as MBordure;
				ma_bordure.setObjetADessiner(this);
				invalidateDisplayList();
			}
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
			fireMeurt();
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
			invalidateDisplayList();
		}
		
		public function redessiner(e:TimerEvent=null):void {
			invalidateDisplayList();
		}
		
		public function clone():MIObjetGraphique {
			return null;
		}
		
		public function getNomClasse():String {
			return nom_classe;
		}

	}
}