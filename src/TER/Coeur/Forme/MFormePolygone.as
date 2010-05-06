package Coeur.Forme
{
	import Coeur.MUtilitaire;
	
	import Utilitaires.*;
	public class MFormePolygone extends MForme
	{
		protected var somme_angles:Number;
		protected var aretes:Array;
		protected var nombre_arete:Number;
                
		public function MFormePolygone() {
			super();
			this.aretes = new Array();
			sous_classe = MIFormePolygone(this);
			if(sous_classe == null) {
				throw new MErreur(this.nom_classe, "Constructeur", "Les classes qui étendent MFormePolygone doivent implementer MIFormePolygone");
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
		
		public override function deplacement(x:Number, y:Number):void
		{
			//trace("deplacement de ",x,"-",y);
			if(this.aretes.length == this.nombre_arete)
			{
				for(var i:uint=0; i<this.nombre_arete; i++)
				{
					var arete:MArete = aretes[i] as MArete;
					if(arete == null)
					{
						throw new MErreur(this.nom_classe, "deplacement", "Une arete est nulle: la numéro "+i);
					}
					arete.getDepart().deplacement(x, y);
					arete.getArrivee().deplacement(x, y);
					aretes[i] = arete;
				}
				this.x += x;
				this.y += y;
			}
			else throw new MErreur(this.nom_classe, "deplacement", "Pas assez d'aretes");
		}
		
		public function getSommeAngles():Number
		{
			return somme_angles;
		}
		
		public function setSommeAngles(somme_angle:Number):void{
			this.somme_angles = somme_angle;
		}
		
		public function supprimerArete(arete:MArete):void
		{
			aretes.splice(aretes.indexOf(arete), 1);
		}
		
		public function getAretes():Array
		{
			return this.aretes;
		}
		
		public function setAretes(aretes:Array, recopie:Boolean=true):void
		{
			var tableau_tmp:Array = this.aretes;//en cas ou le tableau que l'on passe est mauvais, on sauvegarde l'ancien pour le remettre ensuite
			var min_x:Number = Number.MAX_VALUE;
			var max_x:Number = Number.MIN_VALUE;
			var min_y:Number = Number.MAX_VALUE;
			var max_y:Number = Number.MIN_VALUE;
			
			if(aretes != null && aretes.length == this.nombre_arete)
			{
				for(var i:uint=0; i<nombre_arete; i++)
				{
					var arete:MArete = aretes[i].clone() as MArete;
					if(arete == null)
					{
						this.aretes = tableau_tmp;
						throw new MErreur(this.nom_classe, "setAretes", " Donnée du tableau "+i+" incohérente");
						return;
					}
					if(recopie)
						this.aretes[i] = arete;
					else
						this.aretes[i] = arete.deplacement(this.decalage.getX(), this.decalage.getY());
					
					min_x = MUtilitaire.min(min_x, arete.getDepart().getX());
					min_x = MUtilitaire.min(min_x, arete.getArrivee().getX());
					min_y = MUtilitaire.min(min_y, arete.getDepart().getY());
					min_y = MUtilitaire.min(min_y, arete.getArrivee().getY());
					
					max_x = MUtilitaire.max(max_x, arete.getDepart().getX());
					max_x = MUtilitaire.max(max_x, arete.getArrivee().getX());
					max_y = MUtilitaire.max(max_y, arete.getDepart().getY());
					max_y = MUtilitaire.max(max_y, arete.getArrivee().getY());
				}
			}	
			else
				throw new MErreur(this.nom_classe, "setAretes", "Taille du tableau incohérente");
			
			this.largeur = max_x - min_x;
			this.hauteur = max_y - min_y;
			this.x = min_x - this.decalage.getX();
			this.y = min_y - this.decalage.getY();
		}
		 
		public function ajouterArete(arete:MArete):Boolean
		{
			arete = arete.clone();
			if(aretes.length < nombre_arete)
			{
				aretes.push(arete);
				return true;
			}
			else{
				throw new MErreur(this.nom_classe, "ajouterArete", "Tableau d'aretes deja rempli");
				return false;
			} 
		}
		
		public function getPerimetre():Number
		{
			var perimetre:Number = 0;
			if(aretes.length == nombre_arete)
			{
				for(var i:uint = 0; i<nombre_arete; i++)
				{
					var arete:MArete = aretes[i] as MArete;
					if(arete == null){
						throw new MErreur(this.nom_classe, "getPerimetre", "Une arete n'en est pas une");
						return 0;
					}
					perimetre += arete.longueur();
				}
			}
			else{
				throw new MErreur(this.nom_classe, "getPerimetre", "Le triangle n'est pas complet");
				return 0;
			} 
			
			return perimetre;
		}
		
		public override function affiche():void
		{
			trace(this.nom_classe,": (",x,",",y,")");
			trace("Decalage: (",this.decalage.getX(),",",this.decalage.getY(),")");
			trace(this.nom_classe,": largeur = ",this.largeur,", hauteur=",hauteur);
			for(var i:uint = 0; i<nombre_arete; i++)
			{
				var arete:MArete = aretes[i] as MArete;
				if(arete == null)
					return ;
				arete.affiche();
			}
		}
		
		protected function remplirFormePolygone(miforme:MFormePolygone):void{
			miforme.setAretes(aretes);
			super.remplirForme(miforme);
			miforme.setNombreArete(new Number(nombre_arete));
			miforme.setSommeAngles(new Number(somme_angles));
		}
		
		public override function setX(x:Number):void{
			super.setX(x);
			this.calculAretes();
		}
		
		public override function setY(y:Number):void{
			super.setY(y);
			this.calculAretes();
		}
		
		public override function setHauteur(hauteur:Number):void{
			super.setHauteur(hauteur);
			this.calculAretes();
		}
		public override function setLargeur(largeur:Number):void{
			super.setLargeur(largeur);
			this.calculAretes();
		}
		
		public override function setDecalage(decalage:MCoordonneePositive):void{
			var tmp_decalage_x:Number = decalage.getX() - this.decalage.getX();
			var tmp_decalage_y:Number = decalage.getY() - this.decalage.getY();
			this.decalage = decalage;
			
			for(var i:uint = 0; i<nombre_arete; i++)
			{
				var arete:MArete = aretes[i] as MArete;
				if(arete == null)
					return ;
				arete.getArrivee().deplacement(tmp_decalage_x, tmp_decalage_y);
				arete.getDepart().deplacement(tmp_decalage_x, tmp_decalage_y);
			}
		}
		
		public function calculAretes():void{
			
		}
		
		public function getPointsProjection(vecteur:MVecteur):Array{
 				return getSommet();
 			}
 			
 		public function getSommet():Array{
 			var points:Array = new Array();
 			for(var i:int = 0; i<nombre_arete; i++)
 			{
 				var arete:MArete = aretes[i] as MArete;
 				if(points.indexOf(arete.getArrivee()) == -1){
 					points.push(arete.getArrivee());
 				}
 				if(points.indexOf(arete.getDepart()) == -1){
 					points.push(arete.getDepart());
 				}
 			}
 			return points;
 		}
 		
 		public function getAxesSeparateurs(objet:MIForme):Array{
 			var axes:Array = new Array();
 			if((objet as MFormeRond) == null){
 				for(var i:int = 0; i<nombre_arete; i++)
 				{
 					var a:MArete = aretes[i] as MArete;
 					var pt_a:MCoordonnee = a.getDepart();
 	       			var pt_b:MCoordonnee = a.getArrivee();
 	        		var axe:MVecteur = new MVecteur();
 	        		axe.entreDeuxPoint(pt_a,pt_b);
 	        		axe = axe.getNormal();
 	        		axe.normalise();
 					axes.push(axe);
 				}
 			}
 			return axes;
 		}

	}
}