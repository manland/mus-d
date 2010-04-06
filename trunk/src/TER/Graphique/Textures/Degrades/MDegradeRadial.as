package Graphique.Textures.Degrades
{
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import Coeur.MIObjet;
	import Graphique.MIObjetGraphique;
	import mx.controls.Text;
	
	public class MDegradeRadial extends MDegrade
	{
		public function MDegradeRadial() {
			nom_classe = "MDegradeRadial";
			
			spread_method = SpreadMethod.REPEAT;
			type = GradientType.RADIAL;//LINEAR = trait, RADIAL = rond
		}
	}
}