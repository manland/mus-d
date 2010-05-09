package Coeur
{
	import Coeur.Forme.*;
	
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	import Utilitaires.MErreur;
	import Utilitaires.MVecteur;
	
	import mx.controls.Text;
	import Utilitaires.MUtilitaire;
	
	public class MScene extends MObjet implements MIObjet, MIObjetEcouteur
	{
		/**
		 * 
		 * A faire : vérifier que les set de tableaux sont correctes (castage)
		 * 
		 * */
		
		protected var enfants:Array;
		
		//public var sysout:Text;
		
		public function MScene()
		{
			this.ecouteurs = new Array();
			this.enfants = new Array();
			this.nom_classe = "MScene";
			this.forme = new MFormeRectangle();
			(this.forme as MFormeRectangle).instancie(0,0,300,300);
			naitre();
		}
	
		
		public function affiche():void{
			
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
			var temp:Array = MUtilitaire.enlever(enfants,enfant);
			enfants = temp;
		}
		public function getEnfants():Array{
			return this.enfants;
		}
		
		public function deplacementObjet(objet:MIObjet):void
		{
			var axe:MAxe = null;
			//collision avec les autres objets
			for(var i:uint=0; i<this.enfants.length; i++){
				var obj2:MIObjet = (enfants[i] as MIObjet);
				if(objet != obj2){
					if(objet.estProcheDe(obj2) || obj2.estProcheDe(objet)){				
						axe = objet.axeCollision(obj2);
						if(axe != null){
							collision(objet, (enfants[i] as MIObjet), axe);
						}
					}
				}
			}
			//collision avec les bords de la scene	
			if(this.procheBord(objet)){
				axe = this.axeCollisionBord(objet);
				if( axe != null){
					collision(objet, this, axe);
				}
			}
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
		
		public function clone():MIObjet{
			var clone_nom_classe:String = new String(nom_classe);
			var clone_forme:MIForme = this.forme.clone();
			var clone_mscene:MScene = new MScene();
			clone_mscene.setForme(clone_forme);
			return clone_mscene;
		}
		
		public function cloneObjetEcouteur():MIObjetEcouteur{
			return this.clone() as MIObjetEcouteur;
		}
		
		/**
		 * renvoie l'axe sur lequel effectuer la projection pour savoir s'il y a collision avec l'objet passé en paramètre
		 * <p>renvoie l'axe perpendiculaire au coté de la scène d'ou est proche l'objet</p>
		 * @param objet: objet avec lequel on cherche à trouver la collision
		 * @return l'axe sur lequel effectuer la projection pour savoir s'il y a collision avec l'objet passé en paramètre
		 */
		public function getAxeSeparateur(objet:MIObjet):MVecteur{
			var vecteur:MVecteur = new MVecteur();
			
			var tx:Number = objet.getX();
			var ty:Number = objet.getY();
			var larg:Number = objet.getLargeur();
			var haut:Number = objet.getHauteur();
			
			var pt_a:MCoordonnee;
			var pt_b:MCoordonnee;
			if(tx <= this.getX()){
				pt_a = new MCoordonnee(getX(), getY());
				pt_b = new MCoordonnee(getX(), getY()+ this.getHauteur());
			}else if( tx+larg >= this.getX() + this.getLargeur()){
				pt_a = new MCoordonnee( getX()+getLargeur(), getY());
				pt_b = new MCoordonnee( getX()+getLargeur(), getY()+getHauteur());
			}else if(ty <= this.getY()){
				pt_a = new MCoordonnee(getX(), getY());
				pt_b = new MCoordonnee(getX()+this.getLargeur(), getY());
			}else if (ty+this.getHauteur() >= this.getY() + this.getHauteur()){
				pt_a = new MCoordonnee(getX(), getY()+this.getHauteur());
				pt_b = new MCoordonnee(getX()+this.getLargeur(), getY()+getHauteur());
			}
			
			vecteur.entreDeuxPoint(pt_a,pt_b);	
        	vecteur = vecteur.getNormal();
        	vecteur.normalise();
        	return vecteur;
		}
		
		/**
		 * renvoie le point à projeter pour effectuer la projection de la scène sur l'axe séparateur
		 * <p>renvoie les coordonnées d'un point du coté de la scène d'ou est proche l'objet</p>
		 * @param objet: objet avec lequel on cherche à trouver la collision
		 * @return le point à projeter pour effectuer la projection de la scène sur l'axe séparateur
		 */
		public function getPointProjection(objet:MIObjet):MCoordonnee{
			var pt:MCoordonnee;
			
			var tx:Number = objet.getX();
			var ty:Number = objet.getY();
			var larg:Number = objet.getLargeur();
			var haut:Number = objet.getHauteur();
						
			if(tx <= getX()){
				pt = new MCoordonnee(getX(),getY());
			}else if( tx+larg >= getX() + getLargeur()){
				pt = new MCoordonnee(getX()+getLargeur(),getY());
			}else if(ty <= getY()){
				pt = new MCoordonnee(getX(),getY());
			}else if (ty+haut >= getY() + getHauteur()){
				pt = new MCoordonnee(this.getX(), getY()+getHauteur());
			}
			return pt;
		}
		
		/**
		 * renvoie dans un tableau la valeurs minimale et la valeur maximale de la projection de la scene receveur sur le vecteur passé en paramètre
		 * @param vecteur: vecteur sur lequel on veut projeter la scene
		 * @return un tableau contenant la valeur minimale de projection à l'indice 0 et la valeur maximale de projection à l'indice 1
		 */
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
		
		
		public function axeCollisionBord(objet:MIObjet):MAxe{
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
		
		/**
		 * vérifie si l'objet passé en paramètre est proche d'un bord de la scène
		 *<p>retourne vrai si les coordonnés de l'enveloppe rectangulaire de l'objet chevauchent les coordonnées d'un bord de la scène </p>
		 * @param objet: objet dont on veut savoir s'il est près d'un bord de la scène
		 * @return vrai si l'objet passé en paramètre est proche d'un bord de la scène
		 */
		public function procheBord(objet:MIObjet):Boolean{
			var tx:Number = objet.getX();
			var ty:Number = objet.getY();
			var larg:Number = objet.getLargeur();
			var haut:Number = objet.getHauteur();
			return (tx <= getX() || (tx+larg) >= getX() + getLargeur() || ty <= this.getY() || (ty+haut) >= this.getY()+getHauteur());
		}
		
		public function debut():void{
			for(var i:uint=0; i<enfants.length; i++){
				var objet:MIObjet = enfants[i] as MIObjet;
				if(objet == null){
					throw new MErreur(this.nom_classe, "debut", "un enfant de la scène n'est pas un objet");
				}
				objet.debut();
			}
		}
		
		public function fin():void{
			for(var i:uint=0; i<enfants.length; i++){
				var objet:MIObjet = enfants[i] as MIObjet;
				if(objet == null){
					throw new MErreur(this.nom_classe, "fin", "un enfant de la scène n'est pas un objet");
				}
				objet.fin();
			}
		}
	}
}