package Coeur.Forme
{
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
		
//		public function tourne(centre:MCoordonnee, angle_degre:Number):void{
//			var pt:MCoordonnee = new MCoordonnee(getX(),getY());
//			pt.tourne(centre,angle_degre);
//			setX(pt.getX());
//			setY(pt.getY());
//		}
		
		public function getSommeAngles():Number
		{
			return somme_angles;
		}
		
		public function setSommeAngles(somme_angle:Number):void{
			this.somme_angles = somme_angle;
		}
		
		public function supprimerArete(arete:MArete):void
		{
			var temp:Array = MUtilitaire.enlever(aretes,arete);
			aretes = temp;
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
					
					min_x = Math.min(min_x, arete.getDepart().getX());
					min_x = Math.min(min_x, arete.getArrivee().getX());
					min_y = Math.min(min_y, arete.getDepart().getY());
					min_y = Math.min(min_y, arete.getArrivee().getY());
					
					max_x = Math.max(max_x, arete.getDepart().getX());
					max_x = Math.max(max_x, arete.getArrivee().getX());
					max_y = Math.max(max_y, arete.getDepart().getY());
					max_y = Math.max(max_y, arete.getArrivee().getY());
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
 			
 		public function getSommet():Array{
 			var points:Array = new Array();
 			for(var i:int = 0; i<nombre_arete; i++)
 			{
 				var arete:MArete = aretes[i] as MArete;
 				var contient_d:Boolean = false;
 				var contient_a:Boolean = false;
 				for(var i:int = 0; i<points.length; i++){
 					var pt:MCoordonnee = points[i] as MCoordonnee;
 					if(pt.estEgal(arete.getArrivee()))
 						contient_a = true;
 					if(pt.estEgal(arete.getDepart()))
 						contient_d = true;
 				}
 				if(!contient_a)
 					points.push(arete.getArrivee());
 				if(!contient_d)
 					points.push(arete.getDepart());
 			}
 			return points;
 		}
 		
 		public override function tourne(centre:MCoordonnee,angle_degre:Number):void{
 			for(var i:int = 0; i<nombre_arete; i++)
 			{
 				var arete:MArete = aretes[i] as MArete;
 				if(arete != null)
				{
					arete.tourne(centre,angle_degre);
				}
 			}
 		}
 		
 		public function recalculeCoordonneeTaille():void{
 			var minX:Number = Number.POSITIVE_INFINITY;
 			var minY:Number = Number.POSITIVE_INFINITY;
 			var maxX:Number = Number.NEGATIVE_INFINITY;
 			var maxY:Number = Number.NEGATIVE_INFINITY;
 			this.sysout.text += "\n recalcule: "+x+" - "+y;
 			
 			for(var i:int = 0; i<nombre_arete; i++)
 			{
 				var arete:MArete = aretes[i] as MArete;
 				if(arete != null)
				{
						minX = Math.min(arete.getArrivee().getX(), minX);
						minY = Math.min(arete.getArrivee().getY(), minY);
						maxX = Math.max(arete.getArrivee().getX(), maxX);
						maxY = Math.max(arete.getArrivee().getY(), maxY);
						minX = Math.min(arete.getDepart().getX(), minX);
						minY = Math.min(arete.getDepart().getY(), minY);
						maxX = Math.max(arete.getDepart().getX(), maxX);
						maxY = Math.max(arete.getDepart().getY(), maxY);
				}				
 			}
 			this.sysout.text += "\n recalcule: "+minX+" - "+minY;
 			super.setX( minX);
 			super.setY( minY);
 			this.sysout.text += "\n recalcule: "+x+" - "+y;
 			super.setLargeur(maxX - minX);
 			super.setHauteur(maxY - minY);	 			
 		}
 		
 		//collision:
 		/**
		 * @inheritDoc
		 */
 		public function getAxesSeparateurs(objet:MIForme):Array{
 			var axes:Array = new Array();
 			for(var i:int = 0; i<nombre_arete; i++)
 			{//pour chaque arrête
 				var a:MArete = aretes[i] as MArete;
 				var pt_a:MCoordonnee = a.getDepart();
        			var pt_b:MCoordonnee = a.getArrivee();
         		var axe:MVecteur = new MVecteur();
         		//l'axe séparateur potentiel est perpendiculaire à l'arrête
         		axe.entreDeuxPoint(pt_a,pt_b);
         		axe = axe.getNormal();
         		axe.normalise();
 				axes.push(axe);
 			}
 			return axes;
 		}
 		/**
		 * @inheritDoc
		 */
		public function getPointsParticuliers():Array{
 			return getSommet();
 		}
 		/**
		 * @inheritDoc
		 */
 		public function getPointsProjection(vecteur:MVecteur):Array{
 			return getSommet();
 		}
	}
}