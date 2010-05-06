package Coeur
{
	import Coeur.Forme.*;
	
	import Utilitaires.*;
	
	public class MObjet
	{
		protected var sous_classe:MIObjet;
		
		protected var nom_classe:String;
		
		protected var forme:MIForme;
		
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;

		protected var ecouteurs:Array;
		
		public function MObjet()
		{
			this.nom_classe = "MObjet";
			sous_classe = MIObjet(this);
			if(sous_classe == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent MObjet doivent implementer MIObjet");
			}
		}
		//nom:
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		// forme:
		public function getForme():MIForme
		{
			return this.forme;
		}		
		public function setForme(forme:MIForme):void
		{
			if(forme != null){
				this.forme = forme;
				this.x = this.forme.getX();
				this.y = this.forme.getY();
				this.largeur = this.forme.getLargeur();
				this.hauteur = this.forme.getHauteur();
				this.forme.setObjet(this as MIObjet);
				
				fireChangementTaille();
				fireDeplacementObjet();
			}
		}
		
		//coordonnées:
		public function fireDeplacementObjet():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).deplacementObjet(this as MIObjet);
			}
		}
		
		public function deplacement(x:Number, y:Number):void
		{
			this.x += x;
			this.y += y;
			if(forme != null)
				this.forme.deplacement(x, y);
			fireDeplacementObjet();
		}
		
		public function getX():Number
		{
			return this.x;
		}
		public function setX(x:Number):void
		{
			if(x != this.x){
				this.x = x;
				if(forme != null)
					forme.setX(x);
				fireDeplacementObjet();
			}
		}
		
		public function getY():Number
		{
			return this.y;
		}
		public function setY(y:Number):void
		{
			if(y != this.y){
				this.y = y;
				if(forme != null)
					forme.setY(y);
				fireDeplacementObjet();
			}
		}
		// taille:	
		public function fireChangementTaille():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).changementTaille(this as MIObjet);
			}
		}		
		
		public function redimensionnement(l:Number,h:Number):void{
			this.largeur = this.largeur + l; 
			this.hauteur = this.hauteur + h;
			fireChangementTaille();
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
		
		//écouteurs:
		public function getEcouteurs():Array
		{
			return this.ecouteurs;
		}
		
		public function ajoutObjetEcouteur(objet:MIObjetEcouteur):void {
			ecouteurs.push(objet);
		}
		public function supprimeObjetEcouteur(objet:MIObjetEcouteur):void {
			ecouteurs.slice(ecouteurs.indexOf(objet), 1);
		}	
		
		//mort:
		public function mourir():void {
			fireMourir();
		}
		public function fireMourir():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetMeurt(this as MIObjet);
			}
		}
		//création:
		public function naitre():void {
			fireNaitre();
		}
		public function fireNaitre():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetNait(this as MIObjet);
			}
		}
		//collision
		public function fireCollision(axe:MAxe):void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetCollision(this as MIObjet, axe);
			}
		}
		
		public function actionCollision(objet:MIObjet,axe:MAxe):void {
			fireCollision(axe);			
		}
		
		public function estProcheDe(objet:MIObjet):Boolean{
			var x2:Number = objet.getX();
			var y2:Number = objet.getY();
			var h2:Number = objet.getHauteur();
			var l2:Number = objet.getLargeur();
				
			if(x2+l2 < x || x2 > x+largeur || y2+h2 < y || y2 > y+hauteur)
				return false
			else				
				return true;
		}
		
		public function axeCollision(objet:MIObjet):MAxe{
			var axe:MAxe = null;
			axe = this.getForme().axeCollision(objet.getForme());
			if(axe == null)
				axe = objet.getForme().axeCollision(this.getForme());
			return axe;			
		}
		
		

	}
}