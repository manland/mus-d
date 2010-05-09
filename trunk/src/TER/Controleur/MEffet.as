package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MErreur;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class MEffet
	{
		protected var sous_classe:MIEffet;
		/**
		 * nom de la classe
		 */
		protected var nom_classe:String;	
		/**
		 * Timer utilisé pour mesurer les unités de temps
		 */
		protected var timer:Timer;				
		/**
		 * objet sur lequel s'applique l'effet courant
		 */
		protected var objet:MIObjet;
		
		public function MEffet()
		{
			nom_classe = "MEffet";
			sous_classe = MIEffet(this);
			if(sous_classe == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent MEffet doivent implementer MIEffet");
			}
		}
		
		//nom:
		/**
		 * renvoie la chaine qui représente le nom de la classe de l'effet receveur
		 * @return la chaine qui représente le nom de la classe de l'effet receveur
		 */
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		//objet:
		/**
		 * renvoie l'objet sur lequel s'applique l'effet receveur
		 * @return l'objet sur lequel s'applique l'effet receveur
		 */
		public function getObjet():MIObjet{
			return this.objet;
		}	
		/**
		 * remplace l'objet sur lequel s'applique l'effet receveur par celui passé en paramètre
		 * @param le nouvel objet sur lequel on veut que s'applique l'effet receveur
		 */
		public function setObjet(objet:MIObjet):void{
			this.objet = objet;
		}
		
		//timer:
		/**
		 * renvoie le timer de l'effet receveur
		 * @return le timer de l'effet receveur
		 */
		public function getTimer():Timer{
			return this.timer;
		}
		/**
		 * remplace le timer de l'effet receveur par celui passé en paramètre
		 * @param le nouveau timer de l'effet receveur
		 */	
		public function setTimer(timer:Timer):void{
			this.timer = timer;
		}	
		
		/**
		 * crée pour l'attribut "timer" de l'objet receveur un nouveau Timer qui appelle la fonction avanceUneUnite lorsqu'il finit et le lance
		 * @param temps: temps de durée du Timer
		 * @param repetition: nombre de fois ou le Timer va recommencer
		 */	
		protected function lancerTimer(temps:Number, repetition:Number):void{
			//remise a zéro si ce n'est pas fait
			if(timer != null) {
				stopper();
			}
			setTimer(new Timer(temps, repetition));
			getTimer().addEventListener(TimerEvent.TIMER, (this as MIEffet).appliqueUnite);
			getTimer().start();
		}
		
		/**
		 * stoppe l'effet receveur
		 */
		public function stopper():void{
			getTimer().stop();
		}

	}
}