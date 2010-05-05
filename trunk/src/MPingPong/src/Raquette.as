package
{
	import Controleur.MClavier;
	import Controleur.MIEcouteurClavier;
	
	import Graphique.MGraphiqueRectangle;
	
	public class Raquette extends MGraphiqueRectangle implements MIEcouteurClavier
	{
		private var sceneParent:Jeux;
		private var joueur:String;
		
		public function Raquette(parent:Jeux, joueur:String, x:int, y:int, l:int, h:int)
		{
			super(x, y, l, h);
			this.joueur = joueur;
			sceneParent = parent;
			
			var ecouteurJ:MClavier = MClavier.getInstance();
			ecouteurJ.ajouterEcouteur(this);
		}
	
		public function flecheBas():void {
		   if(y+this.hauteur<sceneParent.height-120) {
		   		y = y+10;
		   }
		}
		   
		public function flecheHaut():void {
			if(y>=0) {
		   		y = y-10;
		   		if(y<0) { y = 0; }
		    }
		}
		
		public function flecheGauche():void {
		
		}
		
		public function flecheDroite():void {
		
		}
		
		public function entree():void {
		
		}
		
		public function espace():void {
		
		}
		
		public function touche(touche:uint):void {
			var J1Haut:uint = sceneParent.getLeMenu().getLesCommandes().codeHautJ1;
			var J1Bas:uint = sceneParent.getLeMenu().getLesCommandes().codeBasJ1;
			var J2Haut:uint = sceneParent.getLeMenu().getLesCommandes().codeHautJ2;
			var J2Bas:uint = sceneParent.getLeMenu().getLesCommandes().codeBasJ2;
			
			if(joueur=="J1") 
			{
				if(touche==J1Haut) {
					if(y>=0) {
				   		y = y-10;
				   		if(y<0) { y = 0; }
			    	}
				}
				
				if(touche==J1Bas) {
					if(y+this.hauteur<sceneParent.height-120) {
			   			y = y+10;
			  		 }
				}
			}

			if(joueur=="J2") {
				if(touche==J2Haut) {
					if(y>=0) {
				   		y = y-10;
				   		if(y<0) { y = 0; }
			    	}
				}
				
				if(touche==J2Bas) {
					if(y+this.hauteur<sceneParent.height-120) {
			   			y = y+10;
			  		 }
				}
			}
			
		}
	}
}