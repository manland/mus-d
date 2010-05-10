package Coeur
{
	import Coeur.Forme.*;
	
	import Utilitaires.*;
	
	import mx.controls.Text;
	
	public class MObjet
	{
		public var sysout:Text;
		protected var sous_classe:MIObjet;
		/**
		 * nom de la classe
		 */
		protected var nom_classe:String;
		/**
		 * forme de l'objet
		 */
		protected var forme:MIForme;
		/**
		 * écouteurs de l'objet
		 */
		protected var ecouteurs:Array;
		
		/**
		 * Constructeur qui empeche l'instanciation directe et oblige les sous classes de celle ci à implémenter MIObjet
		 */
		public function MObjet()
		{
			this.nom_classe = "MObjet";
			sous_classe = MIObjet(this);
			if(sous_classe == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent MObjet doivent implementer MIObjet");
			}
		}
		//nom:
		/**
		 * renvoie la chaine qui représente le nom de la classe de l'objet receveur
		 * @return la chaine qui représente le nom de la classe de l'objet receveur
		 */
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		// forme:
		/**
		 * renvoie la forme de l'objet receveur
		 * @return la forme de l'objet receveur
		 */
		public function getForme():MIForme
		{
			return this.forme;
		}	
		/**
		 * change la forme de l'objet receveur par celle passée en paramètre
		 * @param forme: nouvelle forme de l'objet receveur
		 */	
		public function setForme(forme:MIForme):void
		{
			if(forme != null){
				this.forme = forme;
				
				fireChangementTaille();
				fireDeplacementObjet();
			}
		}
		
		//coordonnées:
		/**
		 * préviens les écouteurs de l'objet receveur que celui-ci vient de se déplacer. Cette fonction est appelée dès que l'objet
		 * change de position
		 */
		public function fireDeplacementObjet():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).deplacementObjet(this as MIObjet);
			}
		}
		/**
		 * déplace l'objet receveur des valeurs passées en paramètre
		 * @param x: valeur d'abscisse qu'il faut ajouter à l'abscisse de l'objet
		 * @param y: valeur d'ordonnée qu'il faut ajouter à l'ordonnée de l'objet
		 */
		public function deplacement(x:Number, y:Number):void
		{
			if(forme != null)
				forme.deplacement(x, y);
			fireDeplacementObjet();
		}
		/**
		 * déplace l'objet receveur selon le mouvement circulaire dont les valeurs sont passées en paramètre
		 * @param centre: centre du mouvement circulaire
		 * @param angle_degre : angle en degré du mouvement circulaire
		 */
		public function deplacementCirculaire(centre:MCoordonnee, angle_degre:Number):void{
			if(forme != null)
				forme.deplacementCirculaire(centre, angle_degre);
			fireDeplacementObjet();
		}
		public function tourne(centre:MCoordonnee,angle_degre:Number):void{
			getForme().tourne(centre, angle_degre);
			//sysout.text += "\n tourne objet: "+getX()+" - "+getY();
			fireDeplacementObjet();
			fireChangementTaille();
		}
		/**
		 * retourne la valeur d'abscisse de l'objet receveur
		 * @return valeur d'abscisse de l'objet receveur
		 */
		public function getX():Number
		{
			if(forme != null)
				return forme.getX();
			else throw new MErreur(this.nom_classe, "getX", "pas de forme encore définie");
		}
		/**
		 * retourne la valeur d'abscisse de l'objet receveur
		 * @return valeur d'abscisse de l'objet receveur
		 */
		public function setX(x:Number):void
		{
			if(forme != null){
				forme.setX(x);
				fireDeplacementObjet();
			}
		}
		
		public function getY():Number
		{
			if(forme != null)
				return forme.getY();
			else throw new MErreur(this.nom_classe, "getY", "pas de forme encore définie");
		}
		public function setY(y:Number):void
		{
			if(forme != null){
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
			if(forme != null){
				forme.setLargeur(forme.getLargeur() + l);
				forme.setHauteur(forme.getHauteur() + h);
				fireChangementTaille();
			}
		}
				
		public function getLargeur():Number
		{
			if(forme != null)
				return forme.getLargeur();
			else throw new MErreur(this.nom_classe, "getLargeur", "pas de forme encore définie");
		}
		public function setLargeur(largeur:Number):void
		{
			if(forme != null){
				this.forme.setLargeur(largeur);
				fireChangementTaille();
			}
		}
		
		public function getHauteur():Number
		{
			if(forme != null)
				return forme.getHauteur();
			else throw new MErreur(this.nom_classe, "getHauteur", "pas de forme encore définie");
		}
		public function setHauteur(hauteur:Number):void
		{
			if(forme != null){
				this.forme.setHauteur(hauteur);
				fireChangementTaille();
			}
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
			var temp:Array = MUtilitaire.enlever(ecouteurs,objet);
			ecouteurs = temp;
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
				
			if(x2+l2 < this.getX() || x2 > this.getX()+this.getLargeur()
			|| y2+h2 < this.getY() || y2 > this.getY()+this.getHauteur())
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
		
		//Début et fin du jeu
		public function fireDebutJeu():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).debutDuJeu(sous_classe);
			}
		}
		
		public function fireFinJeu():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).finDuJeu(sous_classe);
			}
		}
		
		public function debutDuJeu(objet:MIObjet):void {fireDebutJeu();}
		public function finDuJeu(objet:MIObjet):void {fireFinJeu();}
	}
}