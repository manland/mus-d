package Coeur.Forme
{
	import Coeur.MUtilitaire;
	
	import Utilitaires.*;
	
	public class MFormeTriangle extends MFormePolygone implements MIFormePolygone
	{
		
		public function MFormeTriangle()
		{
			this.nom_classe = "MFormeTriangle";
			this.nombre_arete = 3;
			this.somme_angles = 180;
		}
		
		public override function setX(x:Number):void{
		}
		public override function setY(y:Number):void{
		}
		public override function setSommeAngles(somme_angle:Number):void{
		}
		
		public override function setHauteur(hauteur:Number):void{
			
			var a1:MArete = this.aretes[0] as MArete;
			var a2:MArete = this.aretes[1] as MArete;
			var a3:MArete = this.aretes[2] as MArete;
			
			var max:MCoordonnee = MUtilitaire.maxMCoordonneeY(a1.getDepart(), a1.getArrivee());
			max = MUtilitaire.maxMCoordonneeY(max, MUtilitaire.maxMCoordonneeY(a2.getDepart(), a2.getArrivee()));
			max = MUtilitaire.maxMCoordonneeY(max, MUtilitaire.maxMCoordonneeY(a3.getDepart(), a3.getArrivee()));
			
			var pourcentageAugmentation:Number = ((this.y + hauteur) * 100) / max.getY();
			
			for(var i:uint = 0; i<nombre_arete; i++)
			{
				var arete:MArete = aretes[i] as MArete;
				if(arete == null){
					throw new MErreur(this.nom_classe, "setHauteur", "Une arete est vide");
					return ;
				}
				if(arete.getArrivee().getY() > this.y)
					arete.getArrivee().setY( (arete.getArrivee().getY() * pourcentageAugmentation) / 100);
				if(arete.getDepart().getY() > this.y)
					arete.getDepart().setY( (arete.getDepart().getY() * pourcentageAugmentation) / 100);
			}
			super.setHauteur(hauteur);
		}
		
		public override function setLargeur(largeur:Number):void{
			var a1:MArete = this.aretes[0] as MArete;
			var a2:MArete = this.aretes[1] as MArete;
			var a3:MArete = this.aretes[2] as MArete;
			
			var max:MCoordonnee = MUtilitaire.maxMCoordonneeX(a1.getDepart(), a1.getArrivee());
			max = MUtilitaire.maxMCoordonneeX(max, MUtilitaire.maxMCoordonneeX(a2.getDepart(), a2.getArrivee()));
			max = MUtilitaire.maxMCoordonneeX(max, MUtilitaire.maxMCoordonneeX(a3.getDepart(), a3.getArrivee()));
			
			var pourcentageAugmentation:Number = ((this.x + largeur) * 100) / max.getX();
			
			for(var i:uint = 0; i<nombre_arete; i++)
			{
				var arete:MArete = aretes[i] as MArete;
				if(arete == null){
					throw new MErreur(this.nom_classe, "setHauteur", "Une arete est vide");
					return ;
				}
				if(arete.getArrivee().getX() > this.x)
					arete.getArrivee().setX( (arete.getArrivee().getX() * pourcentageAugmentation) / 100);
				if(arete.getDepart().getX() > this.x)
					arete.getDepart().setX( (arete.getDepart().getX() * pourcentageAugmentation) / 100);
			}
			super.setLargeur(largeur);		
		}
		
		public function instancie(m1:MCoordonnee, m2:MCoordonnee, m3:MCoordonnee) : void
		{
			var m4:MCoordonnee = new MCoordonnee(m1.getX(), m1.getY());
			var m5:MCoordonnee = new MCoordonnee(m2.getX(), m2.getY());
			var m6:MCoordonnee = new MCoordonnee(m3.getX(), m3.getY());
			
			var a1:MArete = new MArete(m1 ,m2);
			var a2:MArete = new MArete(m5, m3);
			var a3:MArete = new MArete(m6, m4);
			this.ajouterArete(a1);
			this.ajouterArete(a2);
			this.ajouterArete(a3);
			
			this.calculParametres();
			
		}
		
		//calcul hauteur et largeur du triangle apres intanciation
		public function calculParametres():void{
			
			var a1:MArete = this.aretes[0] as MArete;
			var a2:MArete = this.aretes[1] as MArete;
			var a3:MArete = this.aretes[2] as MArete;
			
			if(a1 == null || a2 == null || a3 == null)
				throw new MErreur(this.nom_classe, "calculParametres", "Une arete est vide");
			else
			{
			
				this.x = MUtilitaire.min(a1.getDepart().getX(), a1.getArrivee().getX());
				this.x = MUtilitaire.min(this.x , MUtilitaire.min(a2.getDepart().getX(), a2.getArrivee().getX()));
				this.x = MUtilitaire.min(this.x , MUtilitaire.min(a3.getDepart().getX(), a3.getArrivee().getX()));
				this.y = MUtilitaire.min(a1.getDepart().getY(), a1.getArrivee().getY());
				this.y = MUtilitaire.min(this.y , MUtilitaire.min(a2.getDepart().getY(), a2.getArrivee().getY()));
				this.y = MUtilitaire.min(this.y , MUtilitaire.min(a3.getDepart().getY(), a3.getArrivee().getY()));
				
				
				
				var max_x:Number = MUtilitaire.max(a1.getDepart().getX(), a1.getArrivee().getX());
				max_x = MUtilitaire.max(max_x , MUtilitaire.max(a2.getDepart().getX(), a2.getArrivee().getX()));
				max_x = MUtilitaire.max(max_x , MUtilitaire.max(a3.getDepart().getX(), a3.getArrivee().getX()));
				
				var max_y:Number = MUtilitaire.max(a1.getDepart().getY(), a1.getArrivee().getY());
				max_y = MUtilitaire.max(max_y , MUtilitaire.max(a2.getDepart().getY(), a2.getArrivee().getY()));
				max_y = MUtilitaire.max(max_y , MUtilitaire.max(a3.getDepart().getY(), a3.getArrivee().getY()));
				
				this.largeur = max_x - this.x;
				this.hauteur = max_y - this.y;
			}
			
		}
		
		/**
		 * si aretes.length == 0 => pâs de verif
		 * sinon si arete.length == nombre_arete-1 verifier que chaque coté de chaque arete a un point en commun
		 * sinon verifier que l'arete qu'on ajour a un point commun avec une autre arete et n'est pas egal a une autre arete ..
		 * 
		 * **/
		 
		public override function ajouterArete(arete:MArete):Boolean
		{
			var b:Boolean = super.ajouterArete(arete);
			if(aretes.length == this.nombre_arete)
				this.calculParametres();
			return b;
		}
		
		public override function setAretes(aretes:Array):void{
			trace("setArete",aretes.length);
			super.setAretes(aretes);
			this.calculParametres();
		}


		//retourne 0 si soucis ... pas assez de coté ou un membre du tableau n'est pas une arete
		public function getAire():Number
		{
			var demi_perimetre:Number =getPerimetre() / 2; 
			var aire:Number = demi_perimetre;
			if(aretes.length == nombre_arete)
			{
				for(var i:uint = 0; i<nombre_arete; i++)
				{
					var arete:MArete = aretes[i] as MArete;
					if(arete == null){
						throw new MErreur(this.nom_classe, "getAire", "Une arete n'en est pas une");
						return 0;
					}
					aire = aire * (demi_perimetre - arete.longueur());
				}
			}
			else{
				throw new MErreur(this.nom_classe, "getAire", "Le triangle n'est pas complet");
				return 0;
			} 
			
			return Math.sqrt(aire);
		}
		
		public override function setNombreArete(nombre_arete:Number):void
		{
		}
		
		public function axeCollision(x:Number,y:Number):MAxe{
			var axe:MAxe = new MAxe();
			for(var i:uint = 0; i<nombre_arete; i++)
			{
				var arete:MArete = aretes[i] as MArete;
				if(arete.contient(x,y)){
					axe.instancie2(arete);
					return axe;
				}
			}
			return null;
		}
		
		public function clone():MIForme{
			var clone_miforme:MFormeTriangle = new MFormeTriangle();
			this.remplirFormePolygone(clone_miforme);
			return clone_miforme; 
		}
		
	}
}