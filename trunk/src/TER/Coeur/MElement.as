package Coeur
{
	import Coeur.Forme.*;
	
	import Controleur.MMouvementPerpetuel;
	
	import Utilitaires.MAxe;
	import Utilitaires.MErreur;
	import Utilitaires.MVecteur;
	
	import mx.controls.Text;
	
	
	public class MElement implements MIObjet
	{
		//clone setEcouteur...
		
		
		
		protected var forme:MIForme;
		protected var bonus:MBonus;
		
		
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var nom_classe:String;
		protected var ecouteurs:Array;
		
		public var mouv:MMouvementPerpetuel;
		public var sysout:Text;
		
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
			this.mouv = new MMouvementPerpetuel();
			mouv.instancie(this, 100, 100);
			mouv.lancer();
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
		
		public function avance(x:Number,y:Number):void
		{
			this.x = this.x + x;
			this.y = this.y + y;
			forme.deplacement(x,y);
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
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetCollision(this, axe);
			}
		}
		
		public function actionCollision(objet:MIObjet,axe:MAxe):void {
			//a réimplanté ou à écouter
			mouv.rebondir(axe);
			fireCollision(axe);
			
		}
			
		public function drag():void
		{
		}
		
		public function clone():MIObjet{

			var clone_x:Number = new Number(x);
			var clone_y:Number = new Number(y);
			var clone_largeur:Number = new Number(largeur);
			var clone_hauteur:Number = new Number(hauteur);
			var clone_nom_classe:String = new String(nom_classe);
			var clone_forme:MIForme = this.forme.clone();
			
			var clone_mscene:MElement = new MElement();
			clone_mscene.setForme(clone_forme);
			clone_mscene.setHauteur(clone_hauteur);
			clone_mscene.setLargeur(clone_largeur);
			clone_mscene.setX(clone_x);
			clone_mscene.setY(clone_y);
			
//			clone_mscene.ecouteurs = this.ecouteurs; //memes ecouteurs
			return clone_mscene;
		}
		
		
		public function estProcheDe(objet:MIObjet):Boolean{
			var x2:Number = objet.getX();
			var y2:Number = objet.getY();
			var h2:Number = objet.getHauteur();
			var l2:Number = objet.getLargeur();
			
			if(x2 >= x && x2 <= x+largeur && y2 >= y && y2 <= y+hauteur)
				return true;
			else if(x2+l2 >= x && x2+l2 <= x+largeur && y2 >= y && y2 <= y+hauteur)
				return true;
			else if(x2 >= x && x2 <= x+largeur && y2+h2 >= y && y2+h2 <= y+hauteur)
				return true;	
			else if(x2+l2 >= x && x2+l2 <= x+largeur && y2+h2 >= y && y2+h2 <= y+hauteur)
				return true;
			else				
				return false;
		}
		
		//retourne l'axe de la collision avec l'objet passé en param ou null s'il n'y a pas collision
		public function axeCollision(objet:MIObjet):MAxe{
			var axe:MAxe = null;
			var forme1:MIForme = this.getForme();
			var forme2:MIForme = objet.getForme();
			
			var axesSeparateur:Array = forme1.getAxesSeparateurs(forme2);
			axesSeparateur = axesSeparateur.concat(forme2.getAxesSeparateurs(forme1));
			
			//valeur minimale et maximale des projections des deux figures sur les axes séparateurs
			var min1:Number;
			var max1:Number;
			var min2:Number;
			var max2:Number;
			
			// on stocke l'axe sur lequel l'espacement est maximum pour connaitre l'axe de collision
			var espacement_max:Number = Number.NEGATIVE_INFINITY;
			var vecteur_coll:MVecteur = (axesSeparateur[1] as MVecteur);
			
			for(var i:int = 0; i < axesSeparateur.length; i = i + 1) {
				var vecteur:MVecteur = (axesSeparateur[i] as MVecteur);
				var res:Array = forme1.seProjeteSur(vecteur);
				min1 = res.pop();
				max1 = res.pop();
				res = forme2.seProjeteSur(vecteur);
				min2 = res.pop();
				max2 = res.pop();
				var espacement:Number = (Math.max(max1, max2)-Math.min(min1, min2) )- (max2-min2+max1-min1)
				
				if(espacement > 0){
					return null;
				}
				else if(espacement > espacement_max){
					espacement_max = espacement;
					vecteur_coll = vecteur;
				}
			}
			axe = new MAxe();
			axe.orthogonalA(vecteur_coll);
						
			return axe;
		}

	}
}