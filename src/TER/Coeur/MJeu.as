package Coeur
{
	import Utilitaires.MErreur;
	
	public class MJeu
	{
		static private var instance:MJeu = null;
		private var nom_classe:String;
		private var scene:MScene;
		private var scores:Array;
		private var estCommence:Boolean;
		
		public function MJeu()
		{
			scene = null;
			scores = new Array();
			estCommence = false;
			if(instance == null){
				instance = this;
			}
			else{
				throw new MErreur(this.nom_classe, "MJeu()", "Utiliser getInstance pour obtenir une instance de "+this.nom_classe);
			}
		}
		
		public function ajouterScore(score:MScore):void{
			scores.push(score);
		}
		
		public function enleverScore(score:MScore):void{
			scores.slice(scores.indexOf(score), 1);
		}
		
		public function getScores():Array{
			return this.scores;
		}
		
		public function augmenterScore(numero_score:Number, point:Number){
			var score:MScore = scores[numero_score] as MScore;
			if(score == null)
				throw new MErreur(this.nom_classe, "augmenterScore", "MScore inexistant ou incorrect");
			score.incrementer(point);
		} 
		
		public function baisserScore(numero_score:Number, point:Number){
			var score:MScore = scores[numero_score] as MScore;
			if(score == null)
				throw new MErreur(this.nom_classe, "baisserScore", "MScore inexistant ou incorrect");
			score.decrementer(point);
		} 
		
		public function remettreAZeroScore(numero_score:Number){
			var score:MScore = scores[numero_score] as MScore;
			if(score == null)
				throw new MErreur(this.nom_classe, "remettreAZeroScore", "MScore inexistant ou incorrect");
			score.remiseAZero();
		} 
		
		public static function getInstance():MJeu{
		 	if(instance == null)
		 		instance = new MJeu();
		 	return instance;
		}
		
		public function getNomClasse():String{
			return this.nom_classe;
		}
		
		public function setScene(scene:MScene):void{
			this.scene = scene;
		}
		public function getScene():MScene{
			return this.scene;
		}
		
		public function getEstCommence():Boolean{
			return this.estCommence;
		}
		
		public function debut():void{
			if(scene != null){
				scene.debut();
				estCommence = true;
			}
			else
				throw new MErreur(this.nom_classe, "debut", "Il n'y a pas de scene sur laquelle lancer le jeu");
		}
		
		public function fin():void{
			if(scene != null){
				scene.fin()
				estCommence = false;
			}
			else
				throw new MErreur(this.nom_classe, "fin", "Il n'y a pas de scene sur laquelle lancer le jeu");
		}

	}
}