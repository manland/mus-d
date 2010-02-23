package Graphique.Degrades
{
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import Coeur.MIObjet;
	
	public class MDegradeRadial extends MDegrade
	{
		public function MDegradeRadial() {
			nom_classe = "MRadial";
			matrix = new Matrix();
			
			//a initialisé par utilisateur
			couleurs = [0xFFFFFF, 0x000000];
			alphas = [0, 1];
			ratios = [0, 255];
			
			spread_method = SpreadMethod.PAD;//PAD = normal, REFLECT = reflet en dehor, REPEAT = ce répet
			interpolation = InterpolationMethod.LINEAR_RGB;//RGB = moins de couleur
			focal_pt_ratio = 0;//point de départ pour la fuite peut être utile pour faire une lumière
			
			type = GradientType.RADIAL;//LINEAR = trait, RADIAL = rond
			
			//placer le dégradé dans ça box
			tx = 0;
			ty = 0;
		}
		
		override public function dessiner(objet:MIObjet):void {
			//taille du dégradé != taille de l'affichage
			box_largeur = objet.getLargeur();
			box_hauteur = objet.getHauteur();
//			box_rotation = Math.PI;//à diviser pour faire tourner
			
			matrix.createGradientBox(box_largeur, box_hauteur, box_rotation, tx, ty);
			objet.getGraphics().beginGradientFill(type, couleurs, alphas, ratios, matrix, spread_method, 
                            interpolation, focal_pt_ratio);
			objet.getGraphics().drawRect(tx, ty, box_largeur, box_hauteur);
		}
	}
}