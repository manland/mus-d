package Graphique.Textures.Degrades
{
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
	import flash.display.InterpolationMethod;
	import flash.display.GradientType;
	import Coeur.MIObjet;
	import Graphique.MIObjetGraphique;
	import mx.controls.Text;
	
	public class MDegradeObliqueDroite extends MDegrade
	{
		public function MDegradeObliqueDroite() {
			nom_classe = "MObliqueDroite";
			
			box_rotation = Math.PI/8;//à diviser pour faire tourner
		}
	}
}