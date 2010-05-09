package Coeur
{
	import Coeur.Forme.*;
	
	import Controleur.MMouvementPerpetuel;
	
	import Utilitaires.MAxe;
	
	import mx.controls.Text;
	
	
	public class MElement extends MObjet implements MIObjet
	{
		//clone setEcouteur...
		
		public var mouv:MMouvementPerpetuel;
		public var sysout:Text;
		public var effets:Array;
		
		public function MElement()
		{
			this.nom_classe = "MElement";
			this.ecouteurs = new Array();
			this.effets = new Array();
			this.forme = null;
			naitre();
		}
		
		public function affiche():void
		{
			trace(this.nom_classe);
			this.forme.affiche();
		}
		
		public override function actionCollision(objet:MIObjet,axe:MAxe):void {
			fireCollision(axe);	
		}
			
		public function clone():MIObjet{
			var clone_nom_classe:String = new String(nom_classe);
			var clone_forme:MIForme = this.forme.clone();
			
			var clone_mscene:MElement = new MElement();
			clone_mscene.setForme(clone_forme);
			
			return clone_mscene;
		}
		
		//Pas besoins de remplir ici se sera au programmeur en réimplentant ou en écoutant de faire quelque chose quand ça commence
		public function debut():void {}
		public function fin():void {}
	}
}