package Graphique.Degrades
{
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import Coeur.MIObjet;
	
	public class MDegradeObliqueGauche extends MDegrade
	{
		public function MDegradeObliqueGauche()
		{
			nom_classe = "MObliqueGauche";
			matrix = new Matrix();
			
			//a initialisé par utilisateur
			couleurs = [0xFFFFFF, 0x000000];
			alphas = [0, 1];
			ratios = [0, 255];
			
			spread_method = SpreadMethod.PAD;//PAD = normal, REFLECT = reflet en dehor, REPEAT = ce répet
			interpolation = InterpolationMethod.LINEAR_RGB;//RGB = moins de couleur
			focal_pt_ratio = 0;//point de départ pour la fuite peut être utile pour faire une lumière
			
			type = GradientType.LINEAR;//LINEAR = trait, RADIAL = rond
		}
		
		override public function dessiner(objet:MIObjet):void {
			//taille du dégradé != taille de l'affichage
			box_largeur = objet.getLargeur();
			box_hauteur = objet.getHauteur();
			box_rotation = 6*(Math.PI/8);//à diviser pour faire tourner
			
			//placer le dégradé dans ça box
			tx = objet.getX();
			ty = objet.getY();
			
			matrix.createGradientBox(box_largeur, box_hauteur, box_rotation, tx, ty);
			objet.getGraphics().beginGradientFill(type, couleurs, alphas, ratios, matrix, spread_method, 
                            interpolation, focal_pt_ratio);
			objet.getGraphics().drawRect(tx, ty, box_largeur, box_hauteur);
		}

	}
}