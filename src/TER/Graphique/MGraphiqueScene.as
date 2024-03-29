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
	import Graphique.Textures.MBordure;
	import Utilitaires.MAxe;
	import flash.display.Sprite;
	import mx.core.IUIComponent;
	import Utilitaires.MErreur;
	import mx.events.ResizeEvent;
	import mx.core.Container;
	import Utilitaires.MUtilitaire;
	
	public class MGraphiqueScene extends Canvas implements MIObjetGraphique, MIObjetEcouteur {
		protected var objet:MScene;
		protected var forme:MFormeRectangle;
		protected var ma_texture:MITexture;
		protected var ma_bordure:MBordure;
		protected var nom_classe:String;
		protected var ecouteurs:Array = new Array();
		public var rgb:String;
		
		public var sysout:Text;
		
		public function MGraphiqueScene(x:int=0, y:int=0, largeur:int=30, hauteur:int=10) {
			super();
			objet = new MScene();
			callLater(mettreObjetGraphiqueDansObjetModele);
			objet.ajoutObjetEcouteur(this);
			forme = new MFormeRectangle();
			(forme as MFormeRectangle).instancie(x, y, largeur, hauteur);
			objet.setForme(forme);
			width = largeur;
			height = hauteur;
			this.x = x;
			this.y = y;
			ma_texture = new MCouleur(0xFFFFFF);
			ma_bordure = null;
			nom_classe = "MGraphiqueScene";
			horizontalScrollPolicy = "off";
			verticalScrollPolicy = "off";
			addEventListener(ResizeEvent.RESIZE, resize);
		}
		
		private function mettreObjetGraphiqueDansObjetModele():void {
			this.objet.setObjetGraphique(this);
		}
		
		public function ajouterEcouteur(ecouteur:MIObjetGraphiqueEcouteur):void {
			ecouteurs.push(ecouteur);
		}
		
		/**
		 * Permet de supprimer un écouteur de cet objet graphique.
		 * @param ecouteur l'écouteur à enlever de la liste des écouteurs de cet objet graphique.
		 * @see MIObjetGraphiqueEcouteur
		 * @see MGraphiqueAbstrait#ecouteurs
		 * @see MGraphiqueAbstrait#ajouterEcouteur()
		 */
		public function supprimerEcouteur(ecouteur:MIObjetGraphiqueEcouteur):void {
			var temp:Array = MUtilitaire.enlever(ecouteurs,ecouteur);
			ecouteurs = temp;
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
		
		public function fireCollision(objet:MIObjetGraphique, axe:MAxe):void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).graphiqueCollision(objet, axe);
			}
		}
		
		/**
		 * Prévient les écouteurs que cet objet graphique a été prévenue du début du jeu.
		 * @see MGraphiqueAbstrait#ecouteurs
		 */
		public function fireDebutDuJeu():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).debutDuJeuGraphique(this);
			}
		}
		
		/**
		 * Prévient les écouteurs que cet objet graphique a été prévenue de la fin du jeu.
		 * @see MGraphiqueAbstrait#ecouteurs
		 */
		public function fireFinDuJeu():void {
			for(var i:int=0; i<ecouteurs.length; i++) {
				(ecouteurs[i] as MIObjetGraphiqueEcouteur).finDuJeuGraphique(this);
			}
		}
		
		/**
		 * Permet de faire "mourir" cette scene.
		 * <p>Autrement dit cela permet de retirer cet objet du visuel, et donc appelle mourir de l'objet model.</p>
		 * @see Coeur.MIObjet#mourir()
		 */
		public function mourir():void {
			objet.mourir();
		}
		
		public function objetCollision(objet:MIObjet, axe:MAxe):void {
			fireCollision(objet.getObjetGraphique(), axe);
		}
		
		override public function addChild(child:DisplayObject):DisplayObject {
			var obj:DisplayObject = super.addChild(child);
			var graphique:MIObjetGraphique = child as MIObjetGraphique;
			if(graphique != null) {
				objet.ajouterEnfants(graphique.getObjet());
			}
			if(obj == null) {
				throw new MErreur("MGraphiqueScene", "addChild", "l'objet retourner par super est null. Vous devez essayer d'ajouter un objet qui n'est pas un UIComponent ou MIObjetGraphique.");
			}
			return obj as UIComponent;
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject {
			var obj:DisplayObject = super.removeChild(child);
			var graphique:MIObjetGraphique = child as MIObjetGraphique;
			if(graphique != null) {
				objet.supprimerEnfants(graphique.getObjet());
			}
			if(obj == null) {
				throw new MErreur("MGraphiqueScene", "removeChild", "l'objet retourner par super est null. Vous devez essayer de retirer un objet qui n'est pas dans cette scene.");
			}
			redessiner();
			return obj as UIComponent;
		}
		
		public function setObjet(objet:MIObjet):void {
			var nouvel_scene:MScene = objet as MScene;
			if(nouvel_scene != null) {
				if(this.objet != null) {
					this.objet.supprimeObjetEcouteur(this);
				}
				this.objet = nouvel_scene;
				this.objet.setObjetGraphique(this);
				this.objet.ajoutObjetEcouteur(this);
				this.objet.setForme(forme);
				changementTaille(nouvel_scene);
				deplacementObjet(nouvel_scene);
			}
			else {
				throw new MErreur(nom_classe, "setObjet", "Vous ne pouvez pas positionner un objet qui n'est pas une MScene.");
			}
		}
		
		public function getObjet():MIObjet {
			return objet;
		}
		
		public function getGraphique():UIComponent {
			return this;
		}
		
		public function getForme():MIForme {
			return forme;
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
		
		public function ajouterTexture(texture:MITexture):void {
			ma_texture = texture.setADecorer(ma_texture);
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
			var bordure_temp:MITexture = bordure.setADecorer(ma_bordure);
			ma_bordure = bordure_temp as MBordure;
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
		
		public function debutDuJeu(objet:MIObjet):void {
			fireDebutDuJeu();
		}
		
		public function finDuJeu(objet:MIObjet):void {
			fireFinDuJeu();
		}
		
		public function set largeur(largeur:Number):void {
			width = largeur;
		}
		
		public function get largeur():Number {
			return objet.getLargeur();
		}
		
		public function set hauteur(hauteur:Number):void {
			height = hauteur;
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
			if(isNaN(percentWidth)) {
				super.width = width;
			}
			if(objet.getLargeur() != width) {
				objet.setLargeur(width);
			}
		}
		
		override public function set height(height:Number):void {
			if(isNaN(percentHeight)) {
				super.height = height;
			}
			if(objet.getHauteur() != height) {
				objet.setHauteur(height);
			}
		}
		
		override public function set measuredWidth(value:Number):void {
			super.measuredWidth = value;
			if(!isNaN(percentWidth)) {
				objet.setLargeur(value);
			}
		}
		
		override public function set measuredHeight(value:Number):void {
			super.measuredHeight = value;
			if(!isNaN(percentHeight)) {
				objet.setHauteur(value);
			}
		}
		
		public function resize(event:ResizeEvent):void {
			measuredWidth = width;
			measuredHeight = height;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			dessiner();
		}
		
		protected function dessiner():void {
			fireSeDessine();
			graphics.clear();
			ma_texture.appliquer(graphics);
			if(ma_bordure != null) {
				ma_bordure.appliquer(graphics);
			}
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		
		override protected function commitProperties():void {
            super.commitProperties();
            if(forme.getAretes().length == 0) {
            	forme.instancie(x, y, width, height);
            }
			invalidateDisplayList();
		}
		
		public function clone():MIObjetGraphique {
			var graphique_temp:MGraphiqueScene = new MGraphiqueScene();
//			graphique_temp.setObjet(objet.clone() as MScene);
			graphique_temp.getObjet().setX(objet.getX());
			graphique_temp.getObjet().setY(objet.getY());
			graphique_temp.getObjet().setLargeur(objet.getLargeur());
			graphique_temp.getObjet().setHauteur(objet.getHauteur());
			if(ma_bordure != null) {
				graphique_temp.setBordure(ma_bordure.clone() as MBordure);
			}
			if(ma_texture != null) {
				var texture_temp:MITexture = ma_texture.clone();
				graphique_temp.setTexture(texture_temp);
				graphique_temp.redessiner();
			}
			return graphique_temp;
		}
		
		public function getNomClasse():String {
			return nom_classe;
		}
	}
}