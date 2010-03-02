package Coeur
{
	public class MObjet implements MIObjet
	{
		
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var nom_classe:String;
		protected var ecouteurs:Array;
		
		public function MObjet(x:Number = 0, y:Number = 0, largeur:Number = 0, hauteur:Number = 0, ecouteurs:Array = null)
		{
			this.x = x;
			this.y = y;
			this.largeur = largeur;
			this.hauteur = hauteur;
			this.nom_classe = "MObjet";
			if(ecouteurs == null)
				this.ecouteurs = new Array();
			else
				this.ecouteurs = ecouteurs;
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

	}
}