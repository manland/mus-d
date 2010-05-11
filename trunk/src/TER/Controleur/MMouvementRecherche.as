package Controleur
{
	import Coeur.MIObjet;
	
	import flash.events.TimerEvent;
	
	public class MMouvementRecherche extends MEffet implements MIEffet
	{
		private var objet_chercher:MIObjet;
		private var vitesse:Number;
		private var temps:Number;
		private var derniere_action:String;
		public function MMouvementRecherche(objet:MIObjet, objet_chercher:MIObjet, vitesse:Number, temps:Number)
		{
			super();
			this.objet = objet;
			this.vitesse = vitesse;
			this.temps = temps;
			this.objet_chercher = objet_chercher;
		}
		
		public function lancer():void{
			this.lancerTimer(temps,0);
		}
		
		public function allerDroite():void{
			this.derniere_action = "droite";
			getObjet().deplacement(vitesse, 0);
		}
		public function allerGauche():void{
			this.derniere_action = "gauche";
			getObjet().deplacement(-vitesse, 0);
		}
		public function allerNord():void{
			this.derniere_action = "nord";
			getObjet().deplacement(0, -vitesse);
		}
		public function allerSud():void{
			this.derniere_action = "sud";
			getObjet().deplacement(0, vitesse);
		}
		
		
		public function appliqueUnite(e:TimerEvent):void{
			if(getObjet().getX() > objet_chercher.getX() && derniere_action!="droite"){
				allerGauche();
			}
			else if(getObjet().getX() < objet_chercher.getX() && derniere_action != "gauche"){
				allerDroite();
			}
			else if(getObjet().getY() > objet_chercher.getY()){
				allerNord();
			}
			else if(getObjet().getY() < objet_chercher.getY()){
				allerSud();
			}
		}
		public function annuler():void{
			if(derniere_action == "droite"){
				allerGauche();
				if(getObjet().getY() > objet_chercher.getY()){
					allerNord();
				}
				else if(getObjet().getY() < objet_chercher.getY()){
					allerSud();
				}
			}
			else if(derniere_action == "sud"){
				allerNord();
				if(getObjet().getX() > objet_chercher.getX()){
					allerGauche();
				}
				else if(getObjet().getX() < objet_chercher.getX()){
					allerDroite();
				}
			}
			else if(derniere_action == "gauche"){
				allerDroite();
				if(getObjet().getY() > objet_chercher.getY()){
					allerNord();
				}
				else if(getObjet().getY() < objet_chercher.getY()){
					allerSud();
				}
			}
			else if(derniere_action == "nord"){
				allerSud();
				if(getObjet().getX() > objet_chercher.getX()){
					allerGauche();
				}
				else if(getObjet().getX() < objet_chercher.getX()){
					allerDroite();
				}
			}
		}
		
		public function clone():MIEffet{
			return null;
		}
		
	}
}