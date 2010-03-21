package Coeur.Forme
{
	import Utilitaires.MArete;
	
	public class MFormeTriangle implements MIFormePolygone
	{
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
						throw new Error("Probleme deplacement");
					}
					arete.getDepart().deplacement(x, y);
					arete.getArrivee().deplacement(x, y);
					aretes[i] = arete;
				}
			}
			else throw new Error("Probleme deplacement");
		}
		
		
		/**
		 * 
		 * Idée : faire un constructeur avec 3 arguments pour créer le triangle directement juste avec les coordonnées ... et apres pas besoin de modifier le tableau
		 * => xa, xb, xc donne les aretes : xa-xb; xb-xc; xc-xa
		 * 
		 * on peut passer une position de depart... une longueur darete avec un angle par rapport alorizontal
		 * puis un angle et une longueur pour la 2eme arete .. et on trace le dernier point
		 * 
		 * 
		 * 
		 * **/
		public function MFormeTriangle()
		{
			this.nom_classe = "MFormeTriangle";
			this.nombre_arete = 3;
			this.aretes = new Array();
			this.somme_angle = 180;
		}
		
		/**
		 * si aretes.length == 0 => pâs de verif
		 * sinon si arete.length == nombre_arete-1 verifier que chaque coté de chaque arete a un point en commun
		 * sinon verifier que l'arete qu'on ajour a un point commun avec une autre arete et n'est pas egal a une autre arete ..
		 * 
		 * **/
		public function ajouterArete(arete:MArete):Boolean
		{
			if(aretes.length < nombre_arete)
			{
				aretes.push(arete);
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
						throw new Error("Erreur dans la fonction setAretes de la classe MFormeTriangle : donnée du tableau "+i+" incohérente");
						return;
					}
					this.aretes[i] = aretes[i];
				}
			}	
			else
				throw new Error("Erreur dans la fonction setAretes de la classe MFormeTriangle : taille du tableau incohérente");
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
			if(nombre_arete > this.aretes.length)
				this.nombre_arete = nombre_arete;
		}
		
		public function affiche():void
		{
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