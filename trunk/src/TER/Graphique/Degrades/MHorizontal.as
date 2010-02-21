package Graphique.Degrades
{
	import Graphique.MDegrade;
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	
	public class MHorizontal extends MDegrade
	{
		public function MHorizontal()
		{
			matrix = new Matrix();
			
			//a initialisé par utilisateur
			couleurs = [0xFFFFFF, 0x000000];
			alphas = [0, 1];
			ratios = [0, 255];
			
			spread_method = SpreadMethod.PAD;//PAD = normal, REFLECT = reflet en dehor, REPEAT = ce répet
			interpolation = InterpolationMethod.LINEAR_RGB;//RGB = moins de couleur
			focal_pt_ratio = 0;//point de départ pour la fuite peut être utile pour faire une lumière
			
			type = GradientType.LINEAR;//LINEAR = trait, RADIAL = rond
			
			//taille du dégradé != taille de l'affichage
			box_largeur = 100;
			box_hauteur = 100;
			box_rotation = Math.PI;//à diviser pour faire tourner
			
			//placer le dégradé dans ça box
			tx = 0;
			ty = 0;
		}

	}
}