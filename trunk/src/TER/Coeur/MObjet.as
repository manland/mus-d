package Coeur
{
	import Coeur.Forme.*;
	
	import Graphique.MIObjetGraphique;
	
	import Utilitaires.*;
	
	/**
	 * classe représentant un objet du jeu coté modèle, un objet possède principalement des coordonnées, une taille, 
	 * une forme, des écouteurs et un objet graphique lui est associé coté vue
	 */
	public class MObjet
	{
		protected var sous_classe:MIObjet;
		/**
		 * nom de la classe de l'objet receveur
		 */
		protected var nom_classe:String;
		/**
		 * forme de l'objet receveur
		 */
		protected var forme:MIForme;
		/**
		 * écouteurs de l'objet receveur
		 */
		protected var ecouteurs:Array;
		/**
		 * l'objet graphique qui lui est associé coté vue et qui écoute l'objet receveur
		 */
		protected var objet_graphique:MIObjetGraphique;
		
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
		 * <p> appelle les fonctions fireDeplacementObjet et fireChangementTaille </p>
		 * @see Coeur.MObjet.fireChangementTaille
		 * @see Coeur.MObjet.fireDeplacementObjet
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
		
		//objet graphique
		/**
		 * retourne l'objet graphique qui lui est associé coté vue et qui écoute l'objet receveur
		 */
		public function getObjetGraphique():MIObjetGraphique{
			return this.objet_graphique;
		}
		/**
		 * remplace l'objet graphique qui lui est associé coté vue et qui écoute l'objet receveur par celui passé en paramètre
		 * @param objet_graphique: nouvel objet graphique qui écoute celui ci
		 */
		public function setObjetGraphique(objet_graphique:MIObjetGraphique):void{
			this.objet_graphique = objet_graphique;
		}
		
		//coordonnées:
		/**
		 * préviens les écouteurs de l'objet receveur que celui-ci vient de se déplacer. Cette fonction doit être appelée
		 *  dès que l'objet change de position
		 */
		public function fireDeplacementObjet():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).deplacementObjet(this as MIObjet);
			}
		}
		/**
		 * déplace l'objet receveur des valeurs d'abscisse et d'ordonnée passées en paramètre
		 * <p> appelle la fonction fireDeplacementObjet</p>
		 * @see Coeur.MObjet.fireDeplacementObjet
		 * @param x: valeur d'abscisse en pixel qu'il faut ajouter à l'abscisse de l'objet
		 * @param y: valeur d'ordonnée en pixel qu'il faut ajouter à l'ordonnée de l'objet
		 */
		public function deplacement(x:Number, y:Number):void
		{
			if(forme != null)
				forme.deplacement(x, y);
			fireDeplacementObjet();
		}
		/**
		 * déplace l'objet receveur selon le mouvement circulaire dont l'angle et le centre sont passées en paramètre
		 * <p> appelle la fonction fireDeplacementObjet</p>
		 * @see Coeur.MObjet.fireDeplacementObjet
		 * @param centre: coordonnée du centre du mouvement circulaire
		 * @param angle_degre : angle en degré du mouvement circulaire
		 */
		public function deplacementCirculaire(centre:MCoordonnee, angle_degre:Number):void{
			if(forme != null)
				forme.deplacementCirculaire(centre, angle_degre);
			fireDeplacementObjet();
		}
		/**
		 * fait effectuer la rotation de centre et d'angle passés en paramètre à l'objet receveur
		 * <p> appelle les fonctions fireDeplacementObjet et fireChangementTaille </p>
		 * @see Coeur.MObjet.fireChangementTaille
		 * @see Coeur.MObjet.fireDeplacementObjet
		 * @param centre: coordonnées du centre de la rotation que l'on veut faire effectuer à l'objet receveur
		 * @param angle_degre: angle en degré de la rotation que l'on veut faire effectuer à l'objet receveur
		 */
		public function tourne(centre:MCoordonnee,angle_degre:Number):void{
			getForme().tourne(centre, angle_degre);
			fireDeplacementObjet();
			fireChangementTaille();
		}
		/**
		 * retourne la valeur d'abscisse de l'objet receveur si elle existe sinon génère une erreur
		 * @return valeur d'abscisse en pixel de l'objet receveur
		 */
		public function getX():Number
		{
			if(forme != null)
				return forme.getX();
			else throw new MErreur(this.nom_classe, "getX", "pas de forme encore définie");
		}
		/**
		 * remplace la valeur d'abscisse de l'objet receveur par celle passée en paramètre
		 * <p> appelle la fonction fireDeplacementObjet</p>
		 * @see Coeur.MObjet.fireDeplacementObjet
		 * @return nouvelle valeur d'abscisse en pixel de l'objet receveur
		 */
		public function setX(x:Number):void
		{
			if(forme != null){
				forme.setX(x);
				fireDeplacementObjet();
			}
		}
		/**
		 * retourne la valeur d'ordonnée de l'objet receveur si elle existe sinon génère une erreur
		 * @return valeur d'ordonnée en pixel de l'objet receveur
		 */
		public function getY():Number
		{
			if(forme != null)
				return forme.getY();
			else throw new MErreur(this.nom_classe, "getY", "pas de forme encore définie");
		}
		/**
		 * remplace la valeur d'ordonnée de l'objet receveur par celle passée en paramètre
		  * <p> appelle la fonction fireDeplacementObjet</p>
		 * @see Coeur.MObjet.fireDeplacementObjet
		 * @return nouvelle valeur d'ordonnée en pixel de l'objet receveur
		 */
		public function setY(y:Number):void
		{
			if(forme != null){
				forme.setY(y);
				fireDeplacementObjet();
			}
		}
		
		// taille:	
		/**
		 * préviens les écouteurs de l'objet receveur que celui-ci vient de changer de taille. Cette fonction doit être appelée
		 *  dès que l'objet change de taille
		 */
		public function fireChangementTaille():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).changementTaille(this as MIObjet);
			}
		}		
		/**
		 * redimensionne l'objet receveur en ajoutant à sa largeur et hauteur les valeurs passées en paramètre
		 * <p> appelle la fonctions fireChangementTaille </p>
		 * @see Coeur.MObjet.fireChangementTaille 
		 * @param l: valeur en pixel à ajouter à la largeur de l'objet receveur
		 * @param h: valeur en pixel à ajouter à la hauteur de l'objet receveur
		 */
		public function redimensionnement(l:Number,h:Number):void{
			if(forme != null){
				forme.setLargeur(forme.getLargeur() + l);
				forme.setHauteur(forme.getHauteur() + h);
				fireChangementTaille();
			}
		}
		/**
		 * retourne la largeur de l'objet receveur si elle existe sinon génère une erreur
		 * @return largeur en pixel de l'objet receveur
		 */		
		public function getLargeur():Number
		{
			if(forme != null)
				return forme.getLargeur();
			else throw new MErreur(this.nom_classe, "getLargeur", "pas de forme encore définie");
		}
		/**
		 * remplace la largeur de l'objet receveur par celle passée en paramètre
		 * <p> appelle la fonctions fireChangementTaille </p>
		 * @see Coeur.MObjet.fireChangementTaille 
		 * @param largeur: nouvelle largeur en pixel de l'objet receveur
		 */
		public function setLargeur(largeur:Number):void
		{
			if(forme != null){
				this.forme.setLargeur(largeur);
				fireChangementTaille();
			}
		}
		/**
		 * retourne la hauteur de l'objet receveur si elle existe sinon génère une erreur
		 * @return hauteur en pixel de l'objet receveur
		 */		
		public function getHauteur():Number
		{
			if(forme != null)
				return forme.getHauteur();
			else throw new MErreur(this.nom_classe, "getHauteur", "pas de forme encore définie");
		}
		/**
		 * remplace la hauteur de l'objet receveur par celle passée en paramètre
		 * <p> appelle la fonctions fireChangementTaille </p>
		 * @see Coeur.MObjet.fireChangementTaille 
		 * @param largeur: nouvelle hauteur en pixel de l'objet receveur
		 */
		public function setHauteur(hauteur:Number):void
		{
			if(forme != null){
				this.forme.setHauteur(hauteur);
				fireChangementTaille();
			}
		}
		
		//écouteurs:
		/**
		 * retourne la liste d'écouteurs de l'objet receveur
		 * @return array contenant les écouteurs de type MIObjetEcouteur de l'objet receveur
		 */
		public function getEcouteurs():Array
		{
			return this.ecouteurs;
		}
		/**
		 * ajoute l'objet écouteur passé en paramètre aux écouteurs de l'objet receveur
		 * @param m: objet écouteur que l'on veut ajouter aux écouteurs de l'objet receveur
		 */
		public function ajoutObjetEcouteur(objet:MIObjetEcouteur):void {
			ecouteurs.push(objet);
		}
		/**
		 * enlève l'objet écouteur passé en paramètre des écouteurs de l'objet receveur
		 * @param m: objet écouteur que l'on veut enlever des écouteurs de l'objet receveur
		 */
		public function supprimeObjetEcouteur(objet:MIObjetEcouteur):void {
			var temp:Array = MUtilitaire.enlever(ecouteurs,objet);
			ecouteurs = temp;
		}	
		
		//mort:
		/**
		 * fonction à appeler lorsque l'on veut détruire l'objet receveur
		 * <p> appelle la fonctions fireMourir </p>
		 * @see Coeur.MObjet.fireMourir 
		 */
		public function mourir():void {
			fireMourir();
		}
		/**
		 * fonction à appeler lorsque l'objet receveur meurt. Préviens les écouteurs de l'objet receveur que celui ci meurt
		 */
		public function fireMourir():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetMeurt(this as MIObjet);
			}
		}
		
		//création:
		/**
		 * fonction à appeler lorsque l'objet receveur nait
		 * <p> appelle la fonctions fireNaitre </p>
		 * @see Coeur.MObjet.fireNaitre 
		 */
		public function naitre():void {
			fireNaitre();
		}
		/**
		 * fonction à appeler lorsque l'objet receveur nait. Préviens les écouteurs de l'objet receveur que celui ci nait
		 */
		public function fireNaitre():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetNait(this as MIObjet);
			}
		}
		
		//collision
		/**
		 * fonction à appeler lorsqu'une collision est detectée sur l'objet receveur. Prévient les écouteur de l'objet receveur que celui-ci collisionne
		 * @param objet: objet avec lequel collisionne l'objet receveur
		 * @param axe: axe selon lequel collisionne l'objet receveur
		 */
		public function fireCollision(objet:MIObjet, axe:MAxe):void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetCollision(objet, axe);
			}
		}
		/**
		 * fonction appelée lorsqu'une collision est detectée sur l'objet
		 * <p> appelle la fonctions fireCollision </p>
		 * @see Coeur.MObjet.fireCollision 
		 * @param objet: objet avec lequel la collision a lieu
		 */
		public function actionCollision(objet:MIObjet,axe:MAxe):void {
			fireCollision(objet, axe);			
		}
		/**
		 * vérifie si l'objet passé en paramètre est proche de l'objet receveur
		 * <p>retourne vrai si les coordonnés de l'enveloppe rectangulaire de l'objet receveur chevauchent celles de l'objet passé en paramètre </p>
		 * @param objet: objet dont on veut savoir s'il est près de l'objet receveur
		 * @return vrai si l'objet passé en paramètre est proche de l'objet receveur
		 */
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
		/**
 		 * retourne l'axe selon lequel collisionne l'objet receveur et celui passé en paramètre ou null si ils ne collisionnent pas
 		 * <p> cette fonction appelle la fonction d'axeCollision de sa forme</p>
 		 * @see Coeur.MForme.axeCollision
 		 * @param objet: objet pour lequel on cherche l'axe de collision
 		 * @return axe selon lequelle a lieu la collision entre l'objet receveur et celui passé en paramètre ou null s'il n'y a pas collision
 		 */	
		public function axeCollision(objet:MIObjet):MAxe{
			var axe:MAxe = null;
			axe = this.getForme().axeCollision(objet.getForme());
			if(axe == null)
				axe = objet.getForme().axeCollision(this.getForme());
			return axe;			
		}
		
		//Début et fin du jeu
		/**
		 * Fonction à appeler lorsque le jeu débute. Préviens les écouteurs de l'objet receveur que le jeu a commencé.
		 */
		public function fireDebutJeu():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).debutDuJeu(sous_classe);
			}
		}
		/**
		 * Fonction à appeler lorsque le jeu termine. Préviens les écouteurs de l'objet receveur que le jeu est terminé.
		 */
		public function fireFinJeu():void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).finDuJeu(sous_classe);
			}
		}
		/**
		 * fonction à appeler au début du jeu. Appelle fireDebutJeu
		 * @see Coeur.MIObjet.fireDebutJeu
		 */
		public function debutDuJeu(objet:MIObjet):void {fireDebutJeu();}
		/**
		 * fonction à appeler à la fin du jeu. Appelle fireDebutJeu
		 * @see Coeur.MIObjet.fireFinJeu
		 */
		public function finDuJeu(objet:MIObjet):void {fireFinJeu();}
		
	}
}