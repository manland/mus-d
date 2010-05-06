package Coeur
{
	import Coeur.Forme.*;
	
	import Controleur.MMouvementPerpetuel;
	
	import Utilitaires.MAxe;
	import Utilitaires.MErreur;
	
	import mx.controls.Text;
	
	
	public class MElement extends MObjet implements MIObjet
	{
		//clone setEcouteur...
		
		public var mouv:MMouvementPerpetuel;
		public var sysout:Text;
		
		public function MElement()
		{
			this.x = 0;
			this.y = 0;
			this.largeur = 0;
			this.hauteur = 0;
			this.nom_classe = "MElement";
			this.ecouteurs = new Array();
			this.forme = null;
			naitre();
		}
		
		public function affiche():void
		{
			trace("MElement : (",x,",",y,") ====> largeur=[",largeur,"] hauteur=[",hauteur,"]");
			this.forme.affiche();
		}
		
		public override function actionCollision(objet:MIObjet,axe:MAxe):void {
			fireCollision(axe);	
			mouv.rebondir(axe);		
		}
			
		public function clone():MIObjet{

			var clone_x:Number = new Number(x);
			var clone_y:Number = new Number(y);
			var clone_largeur:Number = new Number(largeur);
			var clone_hauteur:Number = new Number(hauteur);
			var clone_nom_classe:String = new String(nom_classe);
			var clone_forme:MIForme = this.forme.clone();
			
			var clone_mscene:MElement = new MElement();
			clone_mscene.setForme(clone_forme);
			clone_mscene.setHauteur(clone_hauteur);
			clone_mscene.setLargeur(clone_largeur);
			clone_mscene.setX(clone_x);
			clone_mscene.setY(clone_y);
			
			return clone_mscene;
		}

	}
}