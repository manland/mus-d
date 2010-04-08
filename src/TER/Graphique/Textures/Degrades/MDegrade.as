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
        
		public function MDegrade() {
			this.objet = null;
			
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
		}
		
		override public function setObjetADessiner(objet:MIObjetGraphique):void {
			this.objet = objet;
			//taille du dégradé != taille de l'affichage
			box_largeur = objet.getObjet().getLargeur();
			box_hauteur = objet.getObjet().getHauteur();
			box_rotation = 0;//à diviser pour faire tourner
			
			//placer le dégradé dans ça box
			tx = objet.getObjet().getX();
			ty = objet.getObjet().getY();
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
		
		public function clone():MITexture {
			var clone:MDegrade = new MDegrade();
			var clone_couleurs:Array = new Array();
			for(var i:int=0; i<couleurs.length; i++) {
				clone_couleurs[i] = couleurs[i];
			}
			clone.setCouleurs(clone_couleurs);
			var clone_alphas:Array = new Array();
			for(var i:int=0; i<alphas.length; i++) {
				clone_alphas[i] = new Number(alphas[i]);
			}
			clone.setAlphas(clone_alphas);
			var clone_ratios:Array = new Array();
			for(var i:int=0; i<ratios.length; i++) {
				clone_ratios[i] = new Number(ratios[i]);
			}
			clone.setRatios(clone_ratios);
			clone.setSpreadMethod(new String(spread_method));
			clone.setInterpolation(new String(interpolation));
			clone.setFocalPtRatio(new Number(focal_pt_ratio));
			clone.setBoxHauteur(new Number(box_hauteur));
			clone.setBoxLargeur(new Number(box_largeur));
			clone.setBoxRotation(new Number(box_rotation));
			clone.setTx(new Number(tx));
			clone.setTy(new Number(ty));
			clone.setType(new String(type));
			if(a_decorer != null) {
				clone.setADecorer(a_decorer.clone());
			}
			return clone;
		}
	}
	
}