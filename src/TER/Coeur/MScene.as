package Coeur
{
	import Coeur.Forme.*;
	
	import Utilitaires.MAxe;
	
	public class MScene implements MIObjet, MIObjetEcouteur
	{
		/**
		 * 
		 * A faire : vérifier que les set de tableaux sont correctes (castage)
		 * 
		 * */
		
		
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var ecouteurs:Array;
		protected var forme:MIForme;
		
		protected var nom_classe:String;
		protected var enfants:Array;
		protected var proprietes:Array;
		
		public function MScene()
		{
			this.x = 0;
			this.y = 0;
			this.largeur = 0;
			this.hauteur = 0;
			this.ecouteurs = new Array();
			ecouteurs.push(this);
			this.proprietes = new Array();
			this.enfants = new Array();
			this.nom_classe = "MScene";
			this.forme = null;
		}
		
		public function getForme():MIForme
		{
			return this.forme;
		}
		public function setForme(forme:MIForme):void
		{
			this.forme = forme;
		}
		
		public function getX():Number
		{
			return this.x;
		}
		public function setX(x:Number):void
		{
			this.x = x;
			fireDeplacementObjet();
		}
		
		public function getY():Number
		{
			return this.y;
		}
		public function setY(y:Number):void
		{
			this.y = y;
			fireDeplacementObjet();
		}
		
		public function fireDeplacementObjet():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).deplacementObjet(this);
			}
		}
		
		public function getLargeur():Number
		{
			return this.largeur;
		}
		public function setLargeur(largeur:Number):void
		{
			this.largeur = largeur;
			fireChangementTaille();
		}
		
		public function getHauteur():Number
		{
			return this.hauteur;
		}
		public function setHauteur(hauteur:Number):void
		{
			this.hauteur = hauteur;
			fireChangementTaille();
		}
		
		public function fireChangementTaille():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).changementTaille(this);
			}
		}
		
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		public function setNomClasse(nom_classe:String):void
		{
			this.nom_classe = nom_classe;
		}
		
		public function getEcouteurs():Array
		{
			return this.ecouteurs;
		}
		public function setEcouteurs(ecouteurs:Array):void
		{
			this.ecouteurs = ecouteurs;
		}
		
		public function ajoutObjetEcouteur(objet:MIObjetEcouteur):void {
			ecouteurs.push(objet);
		}
		public function supprimeObjetEcouteur(objet:MIObjetEcouteur):void {
			ecouteurs.slice(ecouteurs.indexOf(objet), 1);
		}
		
		
		public function mourir():void {
			fireMourir();
		}
		public function fireMourir():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetMeurt(this);
			}
		}
		
		public function naitre():void {
			fireNaitre();
		}
		public function fireNaitre():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetNait(this);
			}
		}
		
		public function actionCollision(objet:MIObjet,axe:MAxe):void {
			//a réimplanté
		}
				
		public function estTouchePar(tx:Number, ty:Number):MAxe {
			/* a reprendre*/
			return null;
		}
		
		public function drag():void
		{
		}
		
		public function getProprietes():Array
		{
			return this.proprietes;
		}
		public function setProprietes(proprietes:Array):void
		{
			this.proprietes = proprietes;
		}
		public function ajoutPropriete(propriete:MPropriete) :void
		{
			this.proprietes.push(propriete);
		}
		public function supprimePropriete(propriete:MPropriete) :void
		{
			proprietes.slice(proprietes.indexOf(propriete), 1);
		}
		
		public function drop():void
		{
		}
		
		public function collision(objet1:MIObjet, objet2:MIObjet, axe:MAxe) : void
		{
			objet1.actionCollision(objet2,axe);
			objet2.actionCollision(objet1,axe);
		}
				
		public function ajouterEnfants(enfant:MIObjet):void {
			enfant.ajoutObjetEcouteur(this);
			enfants.push(enfant);
		}
		public function supprimerEnfants(enfant:MIObjet):void 
		{
			enfant.supprimeObjetEcouteur(this);
			enfants.slice(enfants.indexOf(enfant), 1);
		}
		public function getEnfants():Array{
			return this.enfants;
		}
		public function setEnfants(enfants:Array):void{
			this.enfants = enfants;
		}
		
		
		public function deplacement(x:Number, y:Number):void
		{
			trace("Il y a un deplacement");
		}
		public function setCoordonnees(x:Number, y:Number):void
		{
			trace("Il y a un deplacement");
		}
		
		public function deplacementObjet(objet:MIObjet):void
		{
			trace("Mscene : deplacementObjet");
		}
		
		public function changementTaille(objet:MIObjet):void
		{
		}
		
		public function objetMeurt(objet:MIObjet):void
		{
		}
		
		public function objetNait(objet:MIObjet):void
		{
		}
		
		public function affiche():void
		{
			trace("MScene");
		}
		
		public function clone():MIObjet{

			var clone_x:Number = new Number(x);
			var clone_y:Number = new Number(y);
			var clone_largeur:Number = new Number(largeur);
			var clone_hauteur:Number = new Number(hauteur);
			var clone_nom_classe:String = new String(nom_classe);
			var clone_forme:MIForme = this.forme.clone();
			
			var clone_ecouteurs:Array = new Array().concat(ecouteurs);
			var clone_enfants:Array = new Array().concat(enfants);
			var clone_proprietes:Array = new Array().concat(proprietes);
			
			var clone_mscene:MScene = new MScene();
			clone_mscene.setHauteur(clone_hauteur);
			clone_mscene.setLargeur(clone_largeur);
			clone_mscene.setX(clone_x);
			clone_mscene.setY(clone_y);
			clone_mscene.setForme(clone_forme);
			clone_mscene.setEcouteurs(clone_ecouteurs);
			clone_mscene.setEnfants(clone_enfants);
			clone_mscene.setProprietes(clone_proprietes);
			return clone_mscene;
		}
	}
}