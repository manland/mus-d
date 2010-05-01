package Controleur
{
	import Coeur.MIObjet;
	
	import Utilitaires.MAxe;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Text;

	public class MMouvementPerpetuel implements MIEffet
	{
		private var nom_classe:String 
		private var objet:MIObjet;
		private var timer:Timer;
		private var unite_x:Number;
		private var unite_y:Number;
		private var vitesse_px_s_X:Number;
		private var vitesse_px_s_Y:Number;
		
		public var sysout:Text;
		
		public function MMouvementPerpetuel(){
			this.nom_classe = "MMouvementPerpetuel";
		}
		
		public function instancie(objet:MIObjet,vitesse_px_s_X:Number, vitesse_px_s_Y:Number):void
		{
			this.objet = objet;
			this.vitesse_px_s_X = vitesse_px_s_X;
			this.vitesse_px_s_Y = vitesse_px_s_Y;
		}
		
		/**
		 * instancie le mouvement à partir de l'angle en degré avec l'horizontal et sa vitesse en px par seconde
		 * rappel: les angles se mesurent dans le sens contraire les aiguilles d'une montre => 30° = 30° au dessus de l'horizontale
		 * */
		public function instancieAvecAngleEtVitesse(objet:MIObjet, angle:Number, vitesse:Number):void
		{
			var x:Number;
			var y:Number;
			var radian:Number;
			
			radian = angle * Math.PI / 180;
			x = vitesse * Math.cos(radian);
			y = vitesse * Math.sin(radian);
			
			this.instancie(objet, x, y);
		}
		
		public function lancer():void{
			//remise a zéro si ce n'est pas fait
			if(timer != null) {
				stopper();
			}
			//calcul du déplacement à faire en une unité de temps
			setUnite_x(vitesse_px_s_X * 0.02);
			setUnite_y(vitesse_px_s_Y * 0.02);
			
			//on lance le timer toutes les 20 ms indéfiniment
			lancerTimer(20, 0);
		}
		
		protected function lancerTimer(temps:Number, repetition:Number):void{
			setTimer(new Timer(temps, repetition));
			getTimer().addEventListener(TimerEvent.TIMER, avanceUneUnite);
			getTimer().start();
		}
		
		protected function avanceUneUnite(e:TimerEvent):void{
			getObjet().avance(unite_x, unite_y);			
		}
		
		public function stopper():void{
			getTimer().stop();
		}
		
		
		public function rebondir(axe_obstacle:MAxe ):void{
			if(axe_obstacle.estHorizontal()){ //x
				
				setUnite_y( -1 * getUnite_y());
			}
			else if(axe_obstacle.estVertical()){ //y
				setUnite_x( -1 * getUnite_x());
			}	
			else if(axe_obstacle.estObliqueMontant()){// y = x
				var i:Number = getUnite_x();	
				setUnite_x( getUnite_y());
				setUnite_y(i);
			}
			else if(axe_obstacle.estObliqueDescendant()){// y = -x
				var i:Number = getUnite_x();	
				setUnite_x( - getUnite_y());
				setUnite_y(- i);
			}
//			getObjet().setX(getObjet().getX() + unite_x);
//			getObjet().setY(getObjet().getY() + unite_y);
		}
		
		public function clone():MIEffet{
			var mouv:MMouvementPerpetuel = new MMouvementPerpetuel();
			mouv.instancie(this.objet,new Number(this.vitesse_px_s_X),new Number(this.vitesse_px_s_Y));
			return mouv;
		}
		
		/* getteurs et setteurs */
		public function getObjet():MIObjet{
			return this.objet;
		}	
		public function setObjet(objet:MIObjet):void{
			this.objet = objet;
		}	
		
		public function getTimer():Timer{
			return this.timer;
		}	
		public function setTimer(timer:Timer):void{
			this.timer = timer;
		}	
		
		public function getUnite_x():Number{
			return this.unite_x;
		}
		public function setUnite_x(unite_x:Number):void{
			this.unite_x = unite_x; 
		}
		
		public function getUnite_y():Number{
			return this.unite_y;
		}		
		public function setUnite_y(unite_y:Number):void{
			this.unite_y = unite_y; 
		}
		
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		public function setNomClasse(nom_classe:String):void
		{
			this.nom_classe = nom_classe;
		}
		
		
	}
}