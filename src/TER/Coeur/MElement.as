package Coeur
{
	import Coeur.Forme.*;
	import Utilitaires.MAxe;
	
	
	public class MElement implements MIObjet
	{
		protected var forme:MIForme;
		protected var bonus:MBonus;
		
		
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var nom_classe:String;
		protected var ecouteurs:Array;
		
		public function MElement()
		{
			this.x = 0;
			this.y = 0;
			this.largeur = 0;
			this.hauteur = 0;
			this.nom_classe = "MElement";
			this.ecouteurs = new Array();
			this.forme = null;
			this.bonus = null;
		}
		
		public function affiche():void
		{
			trace("MElement : (",x,",",y,")");
			this.forme.affiche();
		}
		
		public function getBonus():MBonus
		{
			return this.bonus;
		}
		public function setBonus(bonus:MBonus):void
		{
			this.bonus = bonus;
		}
		
		public function getForme():MIForme
		{
			return this.forme;
		}
		public function setForme(forme:MIForme):void
		{
			this.forme = forme;
			this.x = this.forme.getX();
			this.y = this.forme.getY();
			this.largeur = this.forme.getLargeur();
			this.hauteur = this.forme.getHauteur();
			
			fireChangementTaille();
			fireDeplacementObjet();
		}
		
		public function getX():Number
		{
			return this.x;
		}
		public function setX(x:Number):void
		{
			var difference:Number = x - this.x;
			this.x = x;
			forme.deplacement(difference, 0);
			fireDeplacementObjet();
		}
		
		public function getY():Number
		{
			return this.y;
		}
		public function setY(y:Number):void
		{
			var difference:Number = y - this.y;
			this.y = y;
			forme.deplacement(0, difference);
			fireDeplacementObjet();
		}
		
		public function deplacement(x:Number, y:Number):void
		{
			this.x += x;
			this.y += y;
			this.forme.deplacement(x, y);
			fireDeplacementObjet();
		}
		
		public function setCoordonnees(x:Number, y:Number):void
		{
			var difference_y:Number = y - this.y;
			var difference_x:Number = x - this.x;
			this.x = x;
			this.y = y;
			this.forme.deplacement(difference_x, difference_y);
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
			this.forme.setLargeur(largeur);
			fireChangementTaille();
		}
		
		public function getHauteur():Number
		{
			return this.hauteur;
		}
		public function setHauteur(hauteur:Number):void
		{
			this.hauteur = hauteur;
			this.forme.setHauteur(hauteur);
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
			return getForme().axeCollision(x,y);
		}
		
		public function drag():void
		{
		}
		


	}
}