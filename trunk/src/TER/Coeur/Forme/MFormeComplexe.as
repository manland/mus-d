package Coeur.Forme
{
	import Utilitaires.*;
	public class MFormeComplexe
	{
		private var sous_classe:MIFormePolygone;
		
		protected var largeur:Number;
		protected var hauteur:Number;
		protected var nom_classe:String;
		protected var somme_angle:Number;
		protected var aretes:Array;
		protected var nombre_arete:Number;
		protected var x:Number;
		protected var y:Number;
                
		public function MFormeComplexe() {
			this.aretes = new Array();
			sous_classe = MIFormePolygone(this);
			if(sous_classe == null) {
				throw("Les classes qui étendent MGraphique doivent implementer MIGraphique");
			}
		}
		public function getNombreArete():Number
		{
			return this.nombre_arete;
		}
		public function setNombreArete(nombre_arete:Number):void
		{
			this.nombre_arete = nombre_arete;
		}
		
		public function getX():Number{
			return this.x;
		}
		public function setX(x:Number):void{
			this.x = x;
		}
		
		public function getY():Number{
			return this.y;
		}
		public function setY(y:Number):void{
			this.y = y;
		}
		
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
			this.hauteur = hauteur;	
		}
		
		public function getLargeur():Number{
			return this.largeur;
		}		
		public function setLargeur(largeur:Number):void{
			this.largeur = largeur;			
		}
		
		public function getSommeAngles():Number
		{
			return somme_angle;
		}
		
		public function setSommeAngles(somme_angle:Number):void{
			this.somme_angle = somme_angle;
		}
		
		public function getNomClasse():String
		{
			return this.nom_classe;
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
			
			if(aretes != null && aretes.length == this.nombre_arete)
			{
				for(var i:uint=0; i<nombre_arete; i++)
				{
					var arete:MArete = aretes[i] as MArete;
					if(arete == null)
					{
						this.aretes = tableau_tmp;
						throw new MErreur("MFormeComplexe", "setAretes", " Donnée du tableau "+i+" incohérente");
						return;
					}
					this.aretes[i] = aretes[i];
				}
			}	
			else
				throw new MErreur("MFormeComplexe", "setAretes", "Taille du tableau incohérente");
		}

	}
}