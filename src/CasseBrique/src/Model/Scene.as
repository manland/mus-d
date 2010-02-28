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
		
		public function Scene(largeur:Number=100, hauteur:Number=100)
		{
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
			Jeux.getSysout().text += "Scene:rmEnfant:nb enfants:"+enfants.length+"\n";
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
						collision(o, enfant);
					}
				}
			}
			if(o.getX() <= 0 || o.getX() >= largeur) {
				collisionBord(o);
			}
		}
		
		public function modelChangeY(o:IModelObjet):void {
			for(var i:int = 0; i < enfants.length; i = i + 1) {
				var enfant:IModelObjet = enfants[i] as IModelObjet;
				if(enfant != o) {
					if(o.estTouchePar(enfant.getX(), enfant.getY())) {
						collision(o, enfant);
					}
				}
			}
			if(o.getY() <= 0 || o.getY() >= hauteur) {
				collisionBord(o);
			}
		}
		
		public function modelChangeLargeur(o:IModelObjet):void {
			
		}
		
		public function modelChangeHauteur(o:IModelObjet):void {
			
		}
		
		public function modelMeurt(o:IModelObjet):void {
			Jeux.getSysout().text += "Scene:modelMeurt:nb enfants:"+enfants.length+"\n";
			rmEnfant(o);
		}
		
		public function modelNait(o:IModelObjet):void {
			
		}
		
		public function collision(objet1:IModelObjet, objet2:IModelObjet):void {
			objet1.actionCollision(objet2);
			objet2.actionCollision(objet1);
		}
		
		public function collisionBord(objet:IModelObjet):void {
			objet.actionCollisionBord();
		}
		
		public function getLargeur():Number {
			return largeur;
		}
		public function getHauteur():Number {
			return hauteur;
		}

	}
}