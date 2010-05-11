package Coeur
{
	import Coeur.Forme.*;
	
	import Controleur.MMouvementPerpetuel;
	
	import Utilitaires.MAxe;
	
	
	/**
	 * classe représentant un élement du jeu coté modèle
	 */
	public class MElement extends MObjet implements MIObjet
	{
		/**
		 * effet appliqué à l'élément
		 */
		public var effets:Array;
		
		/**
		 * crée une instance de MElement
		 * <p> appelle "naitre" </p>
		 * @see Coeur.MObjet.naitre
		 */
		public function MElement()
		{
			this.nom_classe = "MElement";
			this.ecouteurs = new Array();
			this.effets = new Array();
			this.forme = null;
			naitre();
		}
		/**
		 * crée une nouvelle instance clone de l'élément receveur et la retourne
		 */
		public function clone():MIObjet{
			var clone_nom_classe:String = new String(nom_classe);
			var clone_forme:MIForme = this.forme.clone();
			
			var clone:MElement = new MElement();
			clone.setForme(clone_forme);
			
			return clone;
		}
		
		//Pas besoins de remplir ici se sera au programmeur en réimplentant ou en écoutant de faire quelque chose quand ça commence
		/**
		 * fonction à appeler au début du jeu
		 * <p> appelle la fonction "fireDebutJeu" </p>
		 * @see Coeur.MObjet.fireDebutJeu
		 */
		public function debut():void {fireDebutJeu();}
		/**
		 * fonction à appeler à la fin du jeu
		 * <p> appelle la fonction "fireFinJeu" </p>
		 * @see Coeur.MObjet.fireFinJeu
		 */
		public function fin():void {fireFinJeu();}
	}
}