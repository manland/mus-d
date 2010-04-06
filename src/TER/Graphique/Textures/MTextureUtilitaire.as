package Graphique.Textures
{
	import flash.filters.ColorMatrixFilter;
	import flash.display.Graphics;
	import Graphique.MIObjetGraphique;
	import flash.filters.ConvolutionFilter;
	
	public class MTextureUtilitaire
	{
		
		public static function ajusterCouleur(objet:MIObjetGraphique, nouvelle_valeur_rouge:Number=0, nouvelle_valeur_vert:Number=0, nouvelle_valeur_bleu:Number=0, nouvelle_valeur_alpha:Number=0):void {
			var matrix:Array = new Array();
			matrix = matrix.concat([1, 0, 0, 0, nouvelle_valeur_rouge]); // red
			matrix = matrix.concat([0, 1, 0, 0, nouvelle_valeur_vert]); // green
			matrix = matrix.concat([0, 0, 1, 0, nouvelle_valeur_bleu]); // blue
			matrix = matrix.concat([0, 0, 0, 1, nouvelle_valeur_alpha]); 	// alpha
			var cmf:ColorMatrixFilter = new ColorMatrixFilter(matrix); 
			
			var filtersArray:Array = new Array();
			filtersArray.push(objet.getGraphique().filters);
			filtersArray.push(cmf);
			
			objet.getGraphique().filters = filtersArray;
		}
		
		public static function ajusterContraste(objet:MIObjetGraphique, value_entre_0_et_1:Number=0):void {
			var a:Number = value_entre_0_et_1 * 11;
			var b:Number = 63.5 - (value_entre_0_et_1 * 698.5);
			var cmf:ColorMatrixFilter = new ColorMatrixFilter([a, 0, 0, 0, b, 0, a, 0, 0, b, 0, 0, a, 0, b, 0, 0, 0, 1, 0]);
			var filtersArray:Array = new Array();
			filtersArray.push(cmf);
			objet.getGraphique().filters = filtersArray;
		}
		
		public static function ajusterSaturation(objet:MIObjetGraphique, value_entre_0_et_1:Number=1):void {
			var red:Number = 0.3086; // luminance contrast value for red
			var green:Number = 0.694; // luminance contrast value for green
			var blue:Number = 0.0820; // luminance contrast value for blue
			var a:Number = (1-value_entre_0_et_1) * red + value_entre_0_et_1;
			var b:Number = (1-value_entre_0_et_1) * green;
			var c:Number = (1-value_entre_0_et_1) * blue;
			var d:Number = (1-value_entre_0_et_1) * red;
			var e:Number = (1-value_entre_0_et_1) * green + value_entre_0_et_1;
			var f:Number = (1-value_entre_0_et_1) * blue;
			var g:Number = (1-value_entre_0_et_1) * red ;
			var h:Number = (1-value_entre_0_et_1) * green;
			var i:Number = (1-value_entre_0_et_1) * blue + value_entre_0_et_1;
			var cmf:ColorMatrixFilter = new ColorMatrixFilter([a, b, c, 0, 0, d, e, f, 0, 0, g, h, i, 0 ,0, 0, 0, 0, 1, 0]);
			var filtersArray:Array = new Array();
			filtersArray.push(cmf);
			objet.getGraphique().filters = filtersArray;
		}
		
		public static function negative(objet:MIObjetGraphique):void {
			var cmf:ColorMatrixFilter = new ColorMatrixFilter([-1, 0, 0, 0, 255, 0, -1, 0, 0, 255, 0, 0, -1, 0, 255, 0, 0, 0, 1, 0]);
			var filtersArray:Array = new Array();
			filtersArray.push(cmf);
			objet.getGraphique().filters = filtersArray;
		}
		
		public static function gaufrage(objet:MIObjetGraphique):void {
			var emboss:ConvolutionFilter = new ConvolutionFilter(3, 3, [-2, -1, 0, -1, 1, 1, 0, 1, 2]);
			var filtersArray:Array = new Array();
			filtersArray.push(emboss);
			objet.getGraphique().filters = filtersArray;
		}

	}
}