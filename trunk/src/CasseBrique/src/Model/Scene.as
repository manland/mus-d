package Model
{
	import mx.controls.Text;
	
	public class Scene implements IModelChangeListener
	{
		private var sysout:Text;
		
		private var enfants:Array;
		private var ecouteurs:Array;
		private var largeur:Number;
		private var hauteur:Number;
		
		public function Scene(t:Text, largeur:Number=100, hauteur:Number=100)
		{
			sysout = t;
			
			this.largeur = largeur;
			this.hauteur = hauteur;
			enfants = new Array();
			ecouteurs = new Array();
		}
		
		public function addEnfant(e:IModelObjet):void {
			e.addModelChangeListener(this);
			enfants.push(e);
		}
				
		public function rmEnfant(e:IModelObjet):void {
			enfants.splice(enfants.indexOf(e), 1);
		}
		
		public function addModelSceneListener(m:IModelSceneListener):void {
			ecouteurs.push(m);
		}
		
		public function modelChangeX(o:IModelObjet):void {
			for(var i:int = 0; i < enfants.length; i = i + 1) {
				var enfant:IModelObjet = enfants[i] as IModelObjet;
				if(enfant != o) {
					if (o.estTouchePar(enfant.getX(), enfant.getY())) {
						fireCollision(o, enfant);
					}
				}
			}
			if(o.getX() <= 0 || o.getX() >= largeur) {
				fireCollisionBord(o);
			}
		}
		
		public function modelChangeY(o:IModelObjet):void {
			for(var i:int = 0; i < enfants.length; i = i + 1) {
				var enfant:IModelObjet = enfants[i] as IModelObjet;
				if(enfant != o) {
					if(o.estTouchePar(enfant.getX(), enfant.getY())) {
						fireCollision(o, enfant);
					}
				}
			}
			if(o.getY() <= 0 || o.getY() >= hauteur) {
				fireCollisionBord(o);
			}
		}
		
		public function modelChangeLargeur(o:IModelObjet):void {
			
		}
		
		public function modelChangeHauteur(o:IModelObjet):void {
			
		}
		
		public function fireCollision(objet1:IModelObjet, objet2:IModelObjet):void {
			sysout.text += "Scene:fireCollision\n";
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IModelSceneListener).collision(objet1, objet2);
			}
		}
		
		public function fireCollisionBord(objet:IModelObjet):void {
			for(var i:int = 0; i < ecouteurs.length; i = i + 1) {
				(ecouteurs[i] as IModelSceneListener).collisionBord(objet);
			}
		}
		
		public function getLargeur():Number {
			return largeur;
		}
		public function getHauteur():Number {
			return hauteur;
		}

	}
}