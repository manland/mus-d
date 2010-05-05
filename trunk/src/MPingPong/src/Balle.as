package
{
	import Controleur.MMouvementPerpetuel;
	
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.MIObjetGraphiqueEcouteur;
	
	import Utilitaires.MArete;
	import Utilitaires.MAxe;
	import Utilitaires.MCoordonnee;
	
	public class Balle extends MGraphiqueRond implements MIObjetGraphiqueEcouteur
	{
		public var mouv:MMouvementPerpetuel;
		public var sceneParent:Jeux;
		
		public function Balle(sParent:Jeux)
		{
			this.sceneParent = sParent;
			
			this.x = 40;
           	this.y = 40;
           	
           	mouv = new MMouvementPerpetuel();
           	mouv.instancieAvecAngleEtVitesse(this.getObjet(), 50, 100);
           	
           	this.ajouterEcouteur(this);
		}
		
		public function graphiqueSeDessine(graphique:MIObjetGraphique):void {
        	
        }
                
        public function graphiqueMeurt(graphique:MIObjetGraphique):void {
        	
        }
        
        public function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void {
        	this.mouv.rebondir(axe);
        }
        
        public function graphiqueSeDeplace(x:Number, y:Number):void {

        	if(x<=0) {
        		sceneParent.scoreJ2 = sceneParent.scoreJ2+1;
       			sceneParent.labelScoreJ2.text = ""+sceneParent.scoreJ2;
       			mouv.stopper();
        	}
        	else if(x+this.width>sceneParent.width) { 
        		sceneParent.scoreJ1 = sceneParent.scoreJ1+1;
       			sceneParent.labelScoreJ1.text = ""+sceneParent.scoreJ1;
       			mouv.stopper();
        	}
        	
        	var b:Number = sceneParent.height-120;
        	if(y+this.hauteur>sceneParent.height-120) {
        		var axe:MAxe = new MAxe;
        		axe.instancieAvecArete(new MArete(new MCoordonnee(0, b), new MCoordonnee(sceneParent.width, b)));
        		this.mouv.rebondir(axe);
        	}
        	
        	
        }
        
        public function graphiqueChangeTaille(objet:MIObjetGraphique):void {
        	
        }

	}
}