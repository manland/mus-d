package
{
	import Controleur.MMouvementPerpetuel;
	
	import Graphique.MGraphiqueRond;
	import Graphique.MIObjetGraphique;
	import Graphique.MIObjetGraphiqueEcouteur;
	import Graphique.Textures.MBordure;
	import Graphique.Textures.MImage;
	
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
           	
           	this.id = "rond_jaune0";
           	this.hauteur = 25;
           	this.largeur = 25;
           	this.setTexture(new MImage("Images/rond/rond-jaune.png"));
           	this.setBordure(new MBordure(0.5,0x0));
           	
          	mouv = new MMouvementPerpetuel();
           	mouv.instancieAvecAngleEtVitesse(this.getObjet(), 30, 150);	
           	this.ajouterEcouteur(this);
		}
		
		public function graphiqueSeDessine(graphique:MIObjetGraphique):void {
        	
        }
                
        public function graphiqueMeurt(graphique:MIObjetGraphique):void {
        	
        }
        
        public function graphiqueCollision(graphique:MIObjetGraphique, axe:MAxe):void {
        	this.mouv.rebondir(axe);
        }
        
        public function graphiqueSeDeplace(graphique:MIObjetGraphique):void {

			var x:Number = graphique.getObjet().getX();
			var y:Number = graphique.getObjet().getY();
			
        	if(x<=0) {
        		sceneParent.scoreJ2 = sceneParent.scoreJ2+1;
       			sceneParent.labelScoreJ2.text = ""+sceneParent.scoreJ2;
       			mouv.stopper();
				sceneParent.replacerBalle("J2")
       			mouv.lancer();
        	}
        	else if(x+this.width>sceneParent.width) {
        		sceneParent.scoreJ1 = sceneParent.scoreJ1+1;
       			sceneParent.labelScoreJ1.text = ""+sceneParent.scoreJ1;
       			mouv.stopper();
       			sceneParent.replacerBalle("J1");
       			mouv.lancer();
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
        
        public function debutDuJeuGraphique(graphique:MIObjetGraphique):void {

        }
        
		public function finDuJeuGraphique(graphique:MIObjetGraphique):void {
			
		}

	}
}