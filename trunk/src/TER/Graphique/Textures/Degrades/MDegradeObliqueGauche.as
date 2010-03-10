package Graphique.Textures.Degrades
{
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import Coeur.MIObjet;
	import Graphique.MIObjetGraphique;
	import mx.controls.Text;
	
	public class MDegradeObliqueGauche extends MDegrade
	{
		public function MDegradeObliqueGauche(objet:MIObjetGraphique)
		{
			super(objet);
			
			nom_classe = "MObliqueGauche";

			box_rotation = 6*(Math.PI/8);//à diviser pour faire tourner
		}

	}
}