package Coeur
{
	import Coeur.Forme.*;
	
	public class MScene implements MIObjet, MIObjetEcouteur
	{
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
		
		public function actionCollision(objet:MIObjet):void {
			//a réimplanté
		}
		public function actionCollisionBord():void {
			//a réimplanté
		}
		
		public function estTouchePar(tx:Number, ty:Number):Boolean {
			if(tx >= x && tx <= x + largeur) {
				if(ty >= y && ty <= y + hauteur) {
					return true
				}
			}
			return false;
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
		
		public function collision(objet1:MIObjet, objet2:MIObjet) : void
		{
			objet1.actionCollision(objet2);
			objet2.actionCollision(objet1);
		}
		
		public function collisionBord(objet:MIObjet) : void
		{
			objet.actionCollisionBord();
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
	}
}