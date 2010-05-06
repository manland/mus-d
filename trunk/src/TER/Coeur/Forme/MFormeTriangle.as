package Coeur.Forme
{
	import Coeur.MUtilitaire;
	
	import Utilitaires.*;
	
	public class MFormeTriangle extends MFormePolygone implements MIFormePolygone
	{
		private var point1:MCoordonnee;
		private var point2:MCoordonnee;
		private var point3:MCoordonnee;
		
		public function MFormeTriangle()
		{
			this.nom_classe = "MFormeTriangle";
			this.nombre_arete = 3;
			this.somme_angles = 180;
		}
		
		public override function affiche():void{
			super.affiche();
			point1.affiche();
			point2.affiche();
			point3.affiche();
		}
		
		private function remplitPoint():void{
			var points:Array = new Array();
			
			for(var i:uint=0; i<this.aretes.length; i++){
				var arete:MArete = aretes[i] as MArete;
				if(arete == null)
					throw new MErreur(this.nom_classe, "remplitPoint", "une arete est nulle");
				
				var ajouter_depart:Boolean = true;
				var ajouter_arrivee:Boolean = true;
				for(var j:uint=0; j < points.length; j++){
					var point:MCoordonnee = points[j] as MCoordonnee;
					if(point == null)
						throw new MErreur(this.nom_classe, "remplitPoint", "Erreur complètement inattendue sur un MCoordonnee....");
					
					if(point.estEgal(arete.getDepart()))
						ajouter_depart = false;
					if(point.estEgal(arete.getArrivee()))
						ajouter_arrivee = false;
				}
				if(ajouter_depart){
					points.push(arete.getDepart());
				}
				if(ajouter_arrivee){
					points.push(arete.getArrivee());
				}
			}
			if(points.length != 3)
				throw new MErreur(this.nom_classe, "remplitPoint", "Il y a un probleme sur le nombre de points différents");
			else{
				this.point1 = points[0].clone();
				this.point2 = points[1].clone();
				this.point3 = points[2].clone();
			}
		}
		
		public function getPoint1():MCoordonnee{
			return this.point1;
		}
		public function getPoint2():MCoordonnee{
			return this.point2;
		}
		public function getPoint3():MCoordonnee{
			return this.point3;
		}
		
		private function setPoint1(point1:MCoordonnee):void{
			this.point1 = point1;
		}
		private function setPoint2(point2:MCoordonnee):void{
			this.point2 = point2;
		}
		private function setPoint3(point3:MCoordonnee):void{
			this.point3 = point3;
		}
		
		public function setPoint(ancien_point:MCoordonnee, nouveau_point:MCoordonnee):void{
			ancien_point = ancien_point.clone();
			nouveau_point = nouveau_point.clone();
			if(aretes.length != 3){
				throw new MErreur(this.nom_classe, "setPoint", "Pas assez de points pour setter le nouveau point");
			}
			for(var i:uint=0; i < aretes.length; i++){
				var arete:MArete = aretes[i] as MArete;
				if(arete == null)
					throw new MErreur(this.nom_classe, "remplitPoint", "Ceci n'est pas une arete ....");
				if(ancien_point.estEgal(arete.getDepart())){
					arete.getDepart().setX(new Number(nouveau_point.getX()));
					arete.getDepart().setY(new Number(nouveau_point.getY()));
				}
				if(ancien_point.estEgal(arete.getArrivee())){
					arete.getArrivee().setX(new Number(nouveau_point.getX()));
					arete.getArrivee().setY(new Number(nouveau_point.getY()));
				}
			}
			this.calculAretes();
			this.remplitPoint();
		}
		
		public override function setX(x:Number):void{
			if(x != this.x)
			{
				var difference:Number = x - this.x;
				this.deplacement(difference, 0);
				if(objet != null)
					objet.setX(x);
			}
		}
		public override function setY(y:Number):void{
			if(y != this.y)
			{
				var difference:Number = y - this.y;
				this.deplacement(0, difference);
				if(objet != null)
					objet.setY(y);
			}
		}
		public override function setSommeAngles(somme_angle:Number):void{
		}
		
		public override function setHauteur(hauteur:Number):void{
			
			var a1:MArete = this.aretes[0] as MArete;
			var a2:MArete = this.aretes[1] as MArete;
			var a3:MArete = this.aretes[2] as MArete;
			if(a1 == null || a2 == null || a3 == null)
				throw new MErreur(this.nom_classe,"setHauteur","Une des arêtes est nulle");
			
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
			this.remplitPoint();
			super.setHauteur(hauteur);
		}
		
		public override function setLargeur(largeur:Number):void{
			var a1:MArete = this.aretes[0] as MArete;
			var a2:MArete = this.aretes[1] as MArete;
			var a3:MArete = this.aretes[2] as MArete;
			if(a1 == null || a2 == null || a3 == null)
				throw new MErreur(this.nom_classe,"setLargeur","Une des arêtes est nulle");
			
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
			this.remplitPoint();
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
			
			this.calculAretes();
			this.remplitPoint();
			
		}
		
		//calcul hauteur et largeur du triangle apres intanciation
		public override function calculAretes():void{
			
			var a1:MArete = this.aretes[0] as MArete;
			var a2:MArete = this.aretes[1] as MArete;
			var a3:MArete = this.aretes[2] as MArete;
			
			if(a1 == null || a2 == null || a3 == null)
				throw new MErreur(this.nom_classe, "calculParametres", "Une arete est vide");
			else
			{
				trace("ici");
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
				this.x -= this.decalage.getX();
				this.y -= this.decalage.getY();
				
				if(objet != null){
					objet.setX(x);
					objet.setY(y);
					objet.setLargeur(largeur);
					objet.setHauteur(hauteur);
				}
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
			arete = arete.clone();
			arete.deplacement(this.decalage.getX(), this.decalage.getY());
			if(aretes.length < nombre_arete)
			{
				aretes.push(arete);
				if(aretes.length == this.nombre_arete){
					this.calculAretes();
					this.remplitPoint()
				}
				return true;
			}
			else{
				throw new MErreur(this.nom_classe, "ajouterArete", "Tableau d'aretes deja rempli");
				return false;
			} 
		}
		
		public override function setAretes(aretes:Array, recopie:Boolean=true):void{
			super.setAretes(aretes,recopie);
			this.calculAretes();
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
		
		public override function deplacement(x:Number,y:Number):void
		{
			super.deplacement(x,y);
			point1.deplacement(x,y);
			point2.deplacement(x,y);
			point3.deplacement(x,y);
		}
		
		public override function setNombreArete(nombre_arete:Number):void
		{
		}
		
		public function clone():MIForme{
			var clone_miforme:MFormeTriangle = new MFormeTriangle();
			clone_miforme.setPoint1(this.point1.clone());
			clone_miforme.setPoint2(this.point2.clone());
			clone_miforme.setPoint3(this.point3.clone());
			super.remplirFormePolygone(clone_miforme);
			clone_miforme.setAretes(aretes);
			return clone_miforme; 
		}
		
	}
}