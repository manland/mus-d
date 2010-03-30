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
	
	public class MDegrade implements MITexture {
		
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
		
		public var sysout:Text;
		
		protected var nom_classe:String;
		protected var objet:MIObjetGraphique;
		
		private var a_decorer:MITexture = null;
        
		public function MDegrade(objet:MIObjetGraphique) {
			this.objet = objet;
			
			nom_classe = "MDegrade";
			matrix = new Matrix();
			
			//a initialisé par utilisateur
			couleurs = [0xFF0000, 0x000000];
			alphas = [1, 1];
			ratios = [0, 255];
			
			spread_method = SpreadMethod.PAD;//PAD = normal, REFLECT = reflet en dehor, REPEAT = ce répet
			interpolation = InterpolationMethod.LINEAR_RGB;//RGB = moins de couleur
			focal_pt_ratio = 0;//point de départ pour la fuite peut être utile pour faire une lumière
			
			type = GradientType.LINEAR;//LINEAR = trait, RADIAL = rond
			
			//taille du dégradé != taille de l'affichage
			box_largeur = objet.getObjet().getLargeur();
			box_hauteur = objet.getObjet().getHauteur();
			box_rotation = 0;//à diviser pour faire tourner
			
			//placer le dégradé dans ça box
			tx = objet.getObjet().getX();
			ty = objet.getObjet().getY();
		}
		
		public function setADecorer(texture:MITexture):MITexture {
			a_decorer = texture;
			return this;
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
			//taille du dégradé != taille de l'affichage
			box_largeur = objet.getObjet().getLargeur();
			box_hauteur = objet.getObjet().getHauteur();
			
			//placer le dégradé dans ça box
			tx = objet.getObjet().getX();
			ty = objet.getObjet().getY();
			matrix.createGradientBox(box_largeur, box_hauteur, box_rotation, tx, ty);
		    graphics.beginGradientFill(type, couleurs, alphas, ratios, matrix, spread_method, 
				interpolation, focal_pt_ratio);
		}
		
		public function setCouleurs(c:Array):void {
			couleurs = c;
		}

		public function setAlphas(c:Array):void {
			alphas = c;
		}
		
		public function setRatios(c:Array):void {
			ratios = c;
		}
		
		public function setSpreadMethod(s:String):void {
			spread_method = s;
		}
		
		public function setInterpolation(s:String):void {
			interpolation = s;
		}
		
		public function setFocalPtRatio(n:Number):void {
			focal_pt_ratio = n;
		}

		public function setBoxLargeur(n:Number):void {
			box_largeur = n;
		}
		
		public function setBoxHauteur(n:Number):void {
			box_hauteur = n;
		}

		public function setBoxRotation(n:Number):void {
			box_rotation = n;
		}

		public function setTx(n:Number):void {
			tx = n;
		}
		
		public function setTy(n:Number):void {
			ty = n;
		}
		
		public function setType(s:String):void {
			type = s;
		}
		
		public function toString():String {
			return nom_classe+" : couleurs="+couleurs+"; alphas="+alphas+"; ratios="+ratios+"; spread_method="+spread_method+"; interpolation="+interpolation+"; focal_pt_ratio="+focal_pt_ratio+"; matrix="+matrix+"; box_largeur="+box_largeur+"; box_hauteur="+box_hauteur+"; box_rotation="+box_rotation+"; tx="+tx+"; ty="+ty+"; type="+type+";";
		}
	}
	
}