package Graphique.Textures
{
	import flash.display.Graphics;
	import Graphique.MIObjetGraphique;
	
	public class MBordure extends MTextureAbstraite implements MITexture {

		private var epaisseur:Number;
		private var couleur:uint;
		private var alpha:Number;
		private var amelioration_pixel:Boolean;
		private var scale_mode:String;
		private var caps:String;
		private var joints:String;
		private var miter_limit:Number;
		
		public function MBordure(epaisseur:Number=1, couleur:uint=0x000000) {
			nom_classe = "MBordure";
			this.couleur = couleur;
			this.epaisseur = epaisseur;
			this.alpha = 1;
			this.amelioration_pixel = false;
			this.scale_mode = "normal";
			this.caps = null;
			this.joints = null;
			this.miter_limit = 3;
		}
		
		public function appliquer(graphics:Graphics):void {
			if(a_decorer != null) {
				a_decorer.appliquer(graphics);
			}
			graphics.lineStyle(epaisseur, couleur, alpha, amelioration_pixel, scale_mode, caps, joints, miter_limit);
		}
		
		public function clone():MITexture {
			var clone:MBordure = new MBordure(new Number(epaisseur), couleur);
			if(a_decorer != null) {
				clone.setADecorer(a_decorer.clone());
			}
			return clone;
		}
	}
}