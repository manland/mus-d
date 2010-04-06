package Graphique.Textures.Degrades
{
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import mx.controls.Text;
	import Graphique.MIObjetGraphique;
	
	public class MDegradeHorizontal extends MDegrade
	{
		public function MDegradeHorizontal() {
			nom_classe = "MDegradeHorizontal";

			box_rotation = Math.PI/2;//à diviser pour faire tourner
		}

	}
}