package Graphique.Textures.Degrades {
	import Coeur.*;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.geom.Matrix;
	import flash.display.GradientType;
	import flash.display.Shape;
	import Graphique.Textures.MITexture;
	import Graphique.MIObjetGraphique;
	import mx.controls.Text;
	import flash.display.Graphics;
	import Graphique.Textures.MTextureAbstraite;
	
	public class MDegrade extends MTextureAbstraite implements MITexture {
		
        protected var couleurs:Array;
		protected var alphas:Array;
		protected var ratios:Array;
		protected var spread_method:String;
		protected var interpolation:String;
		protected var focal_pt_ratio:Number;
		protected var matrix:Matrix;
		protected var box_largeur:Number;
		protected var box_hauteur:Number;
		protected var box_rotation:Number;
		protected var tx:Number;
		protected var ty:Number;
		protected var type:String;
        
		public function MDegrade(couleurs:Array=null, alphas:Array=null, ratios:Array=null, spread_method:String=SpreadMethod.PAD, interpolation:String=InterpolationMethod.LINEAR_RGB, focal_pt_ratio:Number=0, type:String=GradientType.LINEAR, box_rotation:Number=0) {
			this.objet = null;
			
			nom_classe = "MDegrade";
			matrix = new Matrix();
			
			//a initialisé par utilisateur
			if(couleurs != null) {
				this.couleurs = couleurs;
			}
			else {
				this.couleurs = [0xFF0000, 0x000000];
			}
			if(alphas != null) {
				this.alphas = alphas;
			}
			else {
				this.alphas = [1, 1];
			}
			if(ratios != null) {
				this.ratios = ratios;
			}
			else {
				this.ratios = [0, 255];
			}
			
			this.spread_method = spread_method;//PAD = normal, REFLECT = reflet en dehor, REPEAT = ce répet
			this.interpolation = interpolation;//RGB = moins de couleur
			this.focal_pt_ratio = focal_pt_ratio;//point de départ pour la fuite peut être utile pour faire une lumière
			
			this.type = type;//LINEAR = trait, RADIAL = rond
			
			
			this.box_rotation = box_rotation;//à diviser pour faire tourner
		}
		
		override public function setObjetADessiner(objet:MIObjetGraphique):void {
			super.setObjetADessiner(objet);
			//taille du dégradé != taille de l'affichage
			box_largeur = objet.getObjet().getLargeur();
			box_hauteur = objet.getObjet().getHauteur();
			
			//placer le dégradé dans ça box
			tx = 0;
			ty = 0;
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
			
			box_largeur = objet.getObjet().getLargeur();
			box_hauteur = objet.getObjet().getHauteur();
			tx = 0;
			ty = 0;
			
			matrix.createGradientBox(box_largeur, box_hauteur, box_rotation, tx, ty);
		    graphics.beginGradientFill(type, couleurs, alphas, ratios, matrix, spread_method, 
				interpolation, focal_pt_ratio);
		}
		
		public function getCouleurs():Array {
			return couleurs;
		}
		public function setCouleurs(c:Array):void {
			couleurs = c;
		}

		public function getAlphas():Array {
			return alphas;
		}
		public function setAlphas(c:Array):void {
			alphas = c;
		}
		
		public function getRatios():Array {
			return ratios;
		}
		public function setRatios(c:Array):void {
			ratios = c;
		}
		
		public function getSpreadMethod():String {
			return spread_method;
		}
		public function setSpreadMethod(s:String):void {
			spread_method = s;
		}
		
		public function getInterpolation():String {
			return interpolation;
		}
		public function setInterpolation(s:String):void {
			interpolation = s;
		}
		
		public function getFocalPtRatio():Number {
			return focal_pt_ratio;
		}
		public function setFocalPtRatio(n:Number):void {
			focal_pt_ratio = n;
		}

		public function getBoxRotation():Number {
			return box_rotation;
		}
		public function setBoxRotation(n:Number):void {
			box_rotation = n;
		}
		
		public function getType():String {
			return type;
		}
		public function setType(s:String):void {
			type = s;
		}
		
		public function toString():String {
			return nom_classe+" : couleurs="+couleurs+"; alphas="+alphas+"; ratios="+ratios+"; spread_method="+spread_method+"; interpolation="+interpolation+"; focal_pt_ratio="+focal_pt_ratio+"; matrix="+matrix+"; box_largeur="+box_largeur+"; box_hauteur="+box_hauteur+"; box_rotation="+box_rotation+"; tx="+tx+"; ty="+ty+"; type="+type+";";
		}
		
		public function clone():MITexture {
			var clone:MDegrade = new MDegrade();
			var clone_couleurs:Array = new Array();
			for(var i:int=0; i<couleurs.length; i++) {
				clone_couleurs[i] = couleurs[i];
			}
			clone.setCouleurs(clone_couleurs);
			var clone_alphas:Array = new Array();
			for(var j:int=0; j<alphas.length; j++) {
				clone_alphas[j] = new Number(alphas[j]);
			}
			clone.setAlphas(clone_alphas);
			var clone_ratios:Array = new Array();
			for(var h:int=0; h<ratios.length; h++) {
				clone_ratios[h] = new Number(ratios[h]);
			}
			clone.setRatios(clone_ratios);
			clone.setSpreadMethod(new String(spread_method));
			clone.setInterpolation(new String(interpolation));
			clone.setFocalPtRatio(new Number(focal_pt_ratio));
			clone.setBoxRotation(new Number(box_rotation));
			clone.setType(new String(type));
			if(a_decorer != null) {
				clone.setADecorer(a_decorer.clone());
			}
			return clone;
		}
	}
	
}