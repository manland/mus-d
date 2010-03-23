package Coeur.Forme
{
	import Coeur.MUtilitaire;
	
	import Utilitaires.*;
	
	public class MFormeTriangle implements MIFormePolygone
	{
		protected var x:Number;
		protected var y:Number;
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var nom_classe:String;
		protected var nombre_arete:Number;
		protected var aretes:Array;
		protected var somme_angle:Number;
		
		public function deplacement(x:Number, y:Number):void
		{
			if(this.aretes.length == this.nombre_arete)
			{
				for(var i:uint=0; i<this.nombre_arete; i++)
				{
					var arete:MArete = aretes[i] as MArete;
					if(arete == null)
					{
						throw new MErreur("MFormeTriangle", "deplacement", "Une arete est nulle: la numéro "+i);
					}
					arete.getDepart().deplacement(x, y);
					arete.getArrivee().deplacement(x, y);
					aretes[i] = arete;
				}
				this.x += x;
				this.y += y;
			}
			else throw new MErreur("MFormeTriangle", "deplacement", "Pas assez d'aretes");
		}
		
		public function getHauteur():Number{
			return this.hauteur;
		}
		
		public function setHauteur(hauteur:Number):void{
			
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
				if(arete == null)
					return ;
				if(arete.getArrivee().getY() > this.y)
					arete.getArrivee().setY( (arete.getArrivee().getY() * pourcentageAugmentation) / 100);
				if(arete.getDepart().getY() > this.y)
					arete.getDepart().setY( (arete.getDepart().getY() * pourcentageAugmentation) / 100);
				//if(arete.getArrivee().estEgal(max))
					//arete.getArrivee().setY(this.y + hauteur);
				//if(arete.getDepart().estEgal(max))
					//arete.getDepart().setY(this.y + hauteur);
			}
			this.hauteur = hauteur;	
		}
		
		public function getLargeur():Number{
			return this.largeur;
		}
		
		public function setLargeur(largeur:Number):void{
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
				if(arete == null)
					return ;
				if(arete.getArrivee().getX() > this.x)
					arete.getArrivee().setX( (arete.getArrivee().getX() * pourcentageAugmentation) / 100);
				if(arete.getDepart().getX() > this.x)
					arete.getDepart().setX( (arete.getDepart().getX() * pourcentageAugmentation) / 100);
				//if(arete.getArrivee().estEgal(max))
					//arete.getArrivee().setX(this.x + largeur);
					
				//if(arete.getDepart().estEgal(max))
					//arete.getDepart().setX(this.x + largeur);
			}
			this.largeur = largeur;			
		}
		
		public function getX():Number{
			return this.x;
		}
		
		public function getY():Number{
			return this.y;
		}
		
		
		public function MFormeTriangle()
		{
			this.nom_classe = "MFormeTriangle";
			this.nombre_arete = 3;
			this.aretes = new Array();
			this.somme_angle = 180;
		}
		
		public function instancie(m1:MCoordonnee, m2:MCoordonnee, m3:MCoordonnee) : void
		{
			var m4:MCoordonnee = new MCoordonnee(m1.getX(), m1.getY());
			var m5:MCoordonnee = new MCoordonnee(m2.getX(), m2.getY());
			var m6:MCoordonnee = new MCoordonnee(m3.getX(), m3.getY());
			
			var a1:MArete = new MArete(m1 ,m2);
			var a2:MArete = new MArete(m5, m3);
			var a3:MArete = new MArete(m6, m4);
			aretes.push(a1);
			aretes.push(a2);
			aretes.push(a3);
			
			this.calculParametres();
			
		}
		
		public function calculParametres():void{
			
			var a1:MArete = this.aretes[0] as MArete;
			var a2:MArete = this.aretes[1] as MArete;
			var a3:MArete = this.aretes[2] as MArete;
			
			if(a1 == null || a2 == null || a3 == null)
				throw new MErreur("MFormeTriangle", "calculParametres", "Une arete est vide")
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
		 
		public function ajouterArete(arete:MArete):Boolean
		{
			arete = new MArete(new MCoordonnee(arete.getDepart().getX(),arete.getDepart().getY()),
								new MCoordonnee(arete.getArrivee().getX(),arete.getArrivee().getY()));
			if(aretes.length < nombre_arete)
			{
				aretes.push(arete);
				if(aretes.length == this.nombre_arete)
					this.calculParametres();
				return true;
			}
			else return false;
		}
		
		public function supprimerArete(arete:MArete):void
		{
			aretes.splice(aretes.indexOf(arete), 1);
		}
		
		public function getAretes():Array
		{
			return this.aretes;
		}
		public function setAretes(aretes:Array):void
		{
			var tableau_tmp:Array = this.aretes;//en cas ou le tableau que l'on passe est mauvais, on sauvegarde l'ancien pour le remettre ensuite
			
			if(aretes.length == this.nombre_arete)
			{
				for(var i:uint=0; i<nombre_arete; i++)
				{
					var arete:MArete = aretes[i] as MArete;
					if(arete == null)
					{
						this.aretes = tableau_tmp;
						throw new MErreur("MFormeTriangle", "setAretes", " Donnée du tableau "+i+" incohérente");
						return;
					}
					this.aretes[i] = aretes[i];
				}
				this.calculParametres();
			}	
			else
				throw new MErreur("MFormeTriangle", "setAretes", "Taille du tableau incohérente");
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
					if(arete == null)
						return 0;
					aire = aire * (demi_perimetre - arete.longueur());
				}
			}
			else return 0;
			
			return Math.sqrt(aire);
		}
		
		public function getPerimetre():Number
		{
			var perimetre:Number = 0;
			if(aretes.length == nombre_arete)
			{
				for(var i:uint = 0; i<nombre_arete; i++)
				{
					var arete:MArete = aretes[i] as MArete;
					if(arete == null)
						return 0;
					perimetre += arete.longueur();
				}
			}
			else return 0;
			
			return perimetre;
		}
		
		public function getNomClasse():String
		{
			return this.nom_classe;
		}
		
		public function getSommeAngles():Number
		{
			return somme_angle;
		}
		
		public function getNombreArete():Number
		{
			return this.nombre_arete;
		}
		public function setNombreArete(nombre_arete:Number):void
		{
			//euh ?
			//if(nombre_arete > this.aretes.length)
				//this.nombre_arete = nombre_arete;
		}
		
		public function affiche():void
		{
			trace("MFormeTriangle : (",x,",",y,")");
			trace("MFormeTriangle : largeur = ",this.largeur,", hauteur=",hauteur);
			for(var i:uint = 0; i<nombre_arete; i++)
			{
				var arete:MArete = aretes[i] as MArete;
				if(arete == null)
					return ;
				arete.affiche();
			}
		}
		
		public function contient(x:Number,y:Number):Boolean{
			for(var i:uint = 0; i<nombre_arete; i++)
			{
				var arete:MArete = aretes[i] as MArete;
				if(arete.contient(x,y))
					return true;
			}
			return false;
		}
		
	}
}