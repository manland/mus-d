package Coeur.Elements {
	import flash.events.TimerEvent;
	import Utilitaires.MErreur;
	import Graphique.MGraphiqueScene;
	import mx.states.AddChild;
	import Fabrique.MFabriqueProjectile;
	import Graphique.MIObjetGraphique;
	
	public class MTireur extends MElementAEtat {
		private var degat_projectile:int;
		private var scene:MGraphiqueScene;
		
		public function MTireur(point_vie:int, point_degat:int, degat_projectile:int, scene:MGraphiqueScene) {
			this.degat_projectile = degat_projectile;
			this.scene = scene;
			setEtatDestructible(new MEtatDestructibleProjectile(this));
			setEtatDeplacable(new MEtatDeplacable(this));
			setPointVie(point_vie);
			setPointDegat(point_degat);
			nom_classe = "MTireur";
		}
		
		public function tirer(direction:String, vitesse:int):void {
			var projectile:MIObjetGraphique = MFabriqueProjectile.MFabriqueProjectileRectangle(this, direction);
			scene.addChild(projectile.getGraphique());
			(projectile.getObjet() as MProjectile).lancer();
		}

	}
}