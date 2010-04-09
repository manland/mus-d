package Coeur
{
	import Coeur.Forme.*;
	
	import Utilitaires.MAxe;
	import Utilitaires.MErreur;
	
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
			var tableau_tmp:Array = this.ecouteurs;//en cas ou le tableau que l'on passe est mauvais, on sauvegarde l'ancien pour le remettre ensuite
			
			for(var i:uint=0; i<ecouteurs.length; i++)
			{
				var ecouteur:MIObjetEcouteur = ecouteurs[i] as MIObjetEcouteur;
				if(ecouteur == null)
				{
					this.ecouteurs = tableau_tmp;
					throw new MErreur(this.nom_classe, "setEcouteurs", " Donnée du tableau "+i+" incohérente");
					return;
				}
				this.ecouteurs[i] = ecouteur;
			}
				
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
		
		public function fireCollision(axe:MAxe):void {
			throw new MErreur("MElement", "fireCollision", "Yououuupi");
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetCollision(this, axe);
			}
		}
		
		public function actionCollision(objet:MIObjet,axe:MAxe):void {
			//a réimplanté ou à écouter
			fireCollision(axe);
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
			var tableau_tmp:Array = this.proprietes;//en cas ou le tableau que l'on passe est mauvais, on sauvegarde l'ancien pour le remettre ensuite
			
			for(var i:uint=0; i<proprietes.length; i++)
			{
				var propriete:MPropriete = proprietes[i] as MPropriete;
				if(propriete == null)
				{
					this.proprietes = tableau_tmp;
					throw new MErreur(this.nom_classe, "setProprietes", " Donnée du tableau "+i+" incohérente");
					return;
				}
				this.proprietes[i] = propriete.clone();
			}
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
		
		public function objetCollision(objet:MIObjet, axe:MAxe):void {
			//ne surtout rien faire sans quoi il y aurais boucle infinie !!!! Du à la fonction du sessous !!??
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
			var tableau_tmp:Array = this.enfants;//en cas ou le tableau que l'on passe est mauvais, on sauvegarde l'ancien pour le remettre ensuite
			
			for(var i:uint=0; i<enfants.length; i++)
			{
				var enfant:MIObjet = enfants[i] as MIObjet;
				if(enfant == null)
				{
					this.enfants = tableau_tmp;
					throw new MErreur(this.nom_classe, "setEnfants", " Donnée du tableau "+i+" incohérente");
					return;
				}
				this.enfants[i] = enfant.clone();
			}
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
			var axe:MAxe = null;
			for(var i:uint=0; i<this.enfants.length; i++){
				axe = (enfants[i] as MIObjet).axeCollision(objet);
				if(axe != null){
					objet.actionCollision((enfants[i] as MIObjet), axe);
					(enfants[i] as MIObjet).actionCollision(objet,axe);
				}
			}
			trace("Mscene : deplacementObjet");
		}
		
		public function changementTaille(objet:MIObjet):void
		{
		}
		
		public function objetMeurt(objet:MIObjet):void
		{
			this.supprimerEnfants(objet);
		}
		
		public function objetNait(objet:MIObjet):void
		{
			this.ajouterEnfants(objet);
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
			
			var clone_mscene:MScene = new MScene();
			clone_mscene.setHauteur(clone_hauteur);
			clone_mscene.setLargeur(clone_largeur);
			clone_mscene.setX(clone_x);
			clone_mscene.setY(clone_y);
			clone_mscene.setForme(clone_forme);
			clone_mscene.ecouteurs = this.ecouteurs;
			clone_mscene.setEnfants(this.enfants);
			clone_mscene.setProprietes(this.proprietes);
			return clone_mscene;
		}
		
		public function cloneObjetEcouteur():MIObjetEcouteur{
			return this.clone() as MIObjetEcouteur;
		}
		
		public function axeCollision(objet:MIObjet):MAxe{
			return null;
		}
	}
}