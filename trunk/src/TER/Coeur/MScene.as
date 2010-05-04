package Coeur
{
	import Coeur.Forme.*;
	
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	import Utilitaires.MErreur;
	import Utilitaires.MVecteur;
	
	import mx.controls.Text;
	
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
		
		public var sysout:Text;
		
		public function MScene()
		{
			this.x = 0;
			this.y = 0;
			this.largeur = 300;
			this.hauteur = 300;
			this.ecouteurs = new Array();
			this.proprietes = new Array();
			this.enfants = new Array();
			this.nom_classe = "MScene";
			this.forme = new MFormeRectangle();
			(this.forme as MFormeRectangle).instancie(x,y,largeur,hauteur);
			naitre();
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
		
		public function avance(x:Number,y:Number):void
		{
			this.x = this.x + x;
			this.y = this.y + y;
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
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as MIObjetEcouteur).objetCollision(this, axe);
			}
		}
		
		public function actionCollision(objet:MIObjet,axe:MAxe):void {
			//a réimplanté ou à écouter
			fireCollision(axe);
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
			//collision avec les autres objets
			for(var i:uint=0; i<this.enfants.length; i++){
				var obj2:MIObjet = (enfants[i] as MIObjet);
				if(objet != obj2){
					if(objet.estProcheDe(obj2)){					
						axe = objet.axeCollision(obj2);
						if(axe != null){
							collision(objet, (enfants[i] as MIObjet), axe);
						}
					}
				}
			}
			//collision avec les bords de la scene
//			if((objet.getForme() as MFormeCompose) != null)
//				sysout.text += "\n composé";
			if(this.estProcheDe(objet)){
				axe = this.axeCollision(objet);
				if( axe != null){
					collision(objet, this, axe);
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
			clone_mscene.setProprietes(this.proprietes);
			return clone_mscene;
		}
		
		public function cloneObjetEcouteur():MIObjetEcouteur{
			return this.clone() as MIObjetEcouteur;
		}
		
		public function getAxeSeparateur(objet:MIObjet):MVecteur{
			var vecteur:MVecteur = new MVecteur();
			
			var tx:Number = objet.getX();
			var ty:Number = objet.getY();
			var larg:Number = objet.getLargeur();
			var haut:Number = objet.getHauteur();
			
			var pt_a:MCoordonnee;
			var pt_b:MCoordonnee;
			if(tx <= this.x){
				pt_a = new MCoordonnee(getX(), getY());
				pt_b = new MCoordonnee(getX(), getY()+hauteur);
			}else if( tx+larg >= this.x + largeur){
				pt_a = new MCoordonnee( getX()+largeur, getY());
				pt_b = new MCoordonnee( getX()+largeur, getY()+hauteur);
			}else if(ty <= this.y){
				pt_a = new MCoordonnee(getX(), getY());
				pt_b = new MCoordonnee(getX()+largeur, getY());
			}else if (ty+hauteur >= this.y + hauteur){
				pt_a = new MCoordonnee(getX(), getY()+hauteur);
				pt_b = new MCoordonnee(getX()+largeur, getY()+hauteur);
			}
			
			vecteur.entreDeuxPoint(pt_a,pt_b);	
        	vecteur = vecteur.getNormal();
        	vecteur.normalise();
        	return vecteur;
		}
		
		public function getPointProjection(objet:MIObjet):MCoordonnee{
			var pt:MCoordonnee;
			
			var tx:Number = objet.getX();
			var ty:Number = objet.getY();
			var larg:Number = objet.getLargeur();
			var haut:Number = objet.getHauteur();
						
			if(tx <= this.x){
				pt = new MCoordonnee(getX(),getY());
			}else if( tx+larg >= this.x + largeur){
				pt = new MCoordonnee(getX()+largeur,getY());
			}else if(ty <= this.y){
				pt = new MCoordonnee(getX(),getY());
			}else if (ty+haut >= this.y + hauteur){
				pt = new MCoordonnee(this.x,this.y+hauteur);
			}
			return pt;
		}
		
		public function seProjeteSur(vecteur:MVecteur, objet:MIObjet):Number{
			var pt:MCoordonnee = getPointProjection(objet);
			
			var scalaire:Number = vecteur.getX()*pt.getX() + pt.getY()*vecteur.getY();
				
			var projection:MVecteur = new MVecteur();
			
			projection.instancie(scalaire * vecteur.getX(),scalaire * vecteur.getY());
			
         	if(projection.getX()*vecteur.getX() >= 0 && projection.getY() * vecteur.getY() >= 0){
             	return projection.getNorme();
          	}
         	else{
             	return -projection.getNorme();
          	}
		}
		
		public function axeCollision(objet:MIObjet):MAxe{
			var forme:MIForme = objet.getForme();
			var vecteur:MVecteur = getAxeSeparateur(objet);
			
			//valeur minimale et maximale des projections de l'objet sur l'axe séparateur
			var min:Number;
			var max:Number;
			
			var res:Array = forme.seProjeteSur(vecteur);
			
			min = res.pop();
			max = res.pop();
		
			var val:Number = this.seProjeteSur(vecteur,objet);
			var espacement:Number = (Math.max(max,val)-Math.min(min,val) )- (max-min);
				
			if(espacement > 0){
				return null;
			}
			
			var axe:MAxe = new MAxe();
			axe.orthogonalA(vecteur);
			return axe;
		}
		
		public function estProcheDe(objet:MIObjet):Boolean{
			var tx:Number = objet.getX();
			var ty:Number = objet.getY();
			var larg:Number = objet.getLargeur();
			var haut:Number = objet.getHauteur();
//			if((objet.getForme() as MFormeCompose) != null)
//				sysout.text += "\n x: "+tx+" y: "+ty+" lar: "+larg+" haut: "+haut;
			return (tx <= this.x || (tx+larg) >= this.x + largeur || ty <= this.y || (ty+haut) >= this.y + hauteur);
		}
		
		
	}
}