package Decor
{
	import Coeur.MIObjet;
	
	import Graphique.MGraphiqueScene;
	import Graphique.Textures.MCouleur;
	
	import Utilitaires.MAxe;
	
	import mx.controls.Text;

	public class MaGraphiqueScene extends MGraphiqueScene
	{
		private var nombre_ennemi:Number = 0;
		private var taille_mur:Number = 20;
		private var taille_ennemi:Number = -1;
		private var taille_pacman:Number = -1;
		private var taille_nourriture:Number = -1;
		private var score:Text;
		private var etat:Text;
		
		private var mes_ennemis:Array;
		
		public function MaGraphiqueScene(x:int=0, y:int=0, largeur:int=30, hauteur:int=10)
		{
			super(x, y, largeur, hauteur);
			this.mes_ennemis = new Array();
			setTexture(new MCouleur(0x000000));
		}
		
		
		public function creerScene(score:Text,etat:Text):void{
			if(this.taille_ennemi == -1)
				this.taille_ennemi = taille_mur / 2;
			var decalage_ennemi:Number = (this.taille_mur - taille_ennemi) /2;
			
			if(this.taille_pacman == -1)
				this.taille_pacman = taille_mur / 2;
			var decalage_pacman:Number = (this.taille_mur - taille_pacman) /2;
			
			if(this.taille_nourriture == -1)
				this.taille_nourriture = taille_mur / 4;
			var decalage_nourriture:Number = (this.taille_mur - taille_nourriture) / 2;
			
			
			var nombre_bloc_x:Number = this.largeur / taille_mur;
			var nombre_bloc_y:Number = this.hauteur / taille_mur;
			
			this.score = score;
			this.etat = etat;
			var ennemis:Array = new Array();
			
			var coordonnee_pacman_x:Number;
			var coordonnee_pacman_y:Number;
			var pacman_ok:Boolean = false;
			
			while(!pacman_ok){
				coordonnee_pacman_x = Math.round(Math.random()*(nombre_bloc_x -1));
				coordonnee_pacman_y = Math.round(Math.random()*(nombre_bloc_y- 1));
				if(coordonnee_pacman_x%2 ==0)
					pacman_ok = true;
			}
			var pacman:MPacman = new MPacman(this, coordonnee_pacman_x*taille_mur+decalage_pacman, coordonnee_pacman_y*taille_mur+decalage_pacman, etat, taille_pacman);

			for(var i:uint =0; i< nombre_ennemi; i++){
				var coordonnee_ennemi_x:Number;
				var coordonnee_ennemi_y:Number;
				var ennemi_ok:Boolean = false;
				while(!ennemi_ok){
					coordonnee_ennemi_x = Math.round(Math.random()*(nombre_bloc_x-1));
					coordonnee_ennemi_y = Math.round(Math.random()*(nombre_bloc_y-1));
					if(coordonnee_ennemi_x != coordonnee_pacman_x && coordonnee_ennemi_y != coordonnee_pacman_y
					 && coordonnee_ennemi_x%2 ==0){
						var taille_tableau:Number = ennemis.length;
						ennemi_ok = true;
						for(var i:uint=0; i<taille_tableau; i++){
							var ennemi_tmp:Ennemi = ennemis[i] as Ennemi;
							if(ennemi_tmp == null)
								trace("Erreur");
							else if(ennemi_tmp.x == coordonnee_ennemi_x && ennemi_tmp.y == coordonnee_ennemi_y)
								ennemi_ok = false;
						}
					}
				}
				ennemis.push(new Ennemi(this, coordonnee_ennemi_x, coordonnee_ennemi_y, taille_ennemi, null));
			}
			/* trace(nombre_bloc_x, "-", nombre_bloc_y);
			trace(coordonnee_pacman_x,"-", coordonnee_pacman_y);
			
			for(var a:uint = 0; a<nombre_ennemi; a++){
				var ennemi_tmp:Ennemi = ennemis[a] as Ennemi;
				if(ennemi_tmp != null)
					trace(ennemi_tmp.x,"-",ennemi_tmp.y);
			} */
			var cpt:Number = 0;
			for(var i:uint=0; i<(nombre_bloc_x); i++){
				var random1:Number = Math.round(Math.random() * (nombre_bloc_y-3) + 1);
				var random2:Number = Math.round(Math.random() * (nombre_bloc_y-3) + 1);
				for( var j:uint=0; j<(nombre_bloc_y); j++){
					if( (i%2 == 1) && (j>0) && (j<(nombre_bloc_y-1)) && j!= random1 && j!= random2 ){
						this.addChild(new Mur(this,i*taille_mur, j * taille_mur, taille_mur, 0x834E2F));
					}
					else if(coordonnee_pacman_x == i && coordonnee_pacman_y == j){
						this.addChild(pacman);
					}
					else{
						var ajout:Boolean = true;
						for(var a:uint = 0; a<nombre_ennemi; a++){
							var ennemi_tmp:Ennemi = ennemis[a] as Ennemi;
							if(ennemi_tmp == null)
								trace("Erreur");
							if(ennemi_tmp.x == i && ennemi_tmp.y == j){
								var mon_ennemi:Ennemi = new Ennemi(this, i*taille_mur+decalage_ennemi, j*taille_mur+decalage_ennemi, taille_ennemi, pacman);
								mes_ennemis.push(mon_ennemi);
								this.addChild(mon_ennemi);
								ajout=false;
							}
						}
						if(ajout){
							this.addChild(new Nourriture(this,i*taille_mur+decalage_nourriture, j * taille_mur+decalage_nourriture, score, taille_nourriture));
							cpt++;
						}
					}
				}	
			}
		}
		
		public override function objetCollision(objet:MIObjet, axe:MAxe):void {
			super.objetCollision(objet,axe);
		}
		
		public function set nombreEnnemi(nombre_ennemi:Number):void {
			this.nombre_ennemi = nombre_ennemi;
		}
		public function set tailleMur(taille_mur:Number):void {
			this.taille_mur = taille_mur;
		}
		public function set tailleEnnemi(taille_ennemi:Number):void {
			this.taille_ennemi = taille_ennemi;
		}
		public function set taillePacman(taille_pacman:Number):void {
			this.taille_pacman = taille_pacman;
		}
		
		
	}
}