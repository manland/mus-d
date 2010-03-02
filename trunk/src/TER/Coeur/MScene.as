package Coeur
{
	
	public class MScene extends MObjet implements MIObjet, MIObjetEcouteur
	{
		protected var enfants:Array;
		protected var propriete:MPropriete;
		
		public function MScene(enfants:Array = null, propriete:MPropriete = null)
		{
			this.propriete = propriete;
			this.nom_classe = "MScene";
			if(enfants == null)
				this.enfants = new Array();
			else 
				this.enfants = enfants;
		}
		
		public function getPropriete():MPropriete
		{
			return this.propriete;
		}
		public function setPropriete(propriete:MPropriete):void
		{
			this.propriete = propriete;
		}
		
		public function drop():void
		{
		}
		
		public function collision(objet1:MIObjet, objet2:MIObjet) : void
		{
			objet1.actionCollision(objet2);
			objet2.actionCollision(objet1);
		}
		
		public function collisionBord(objet:MIObjet) : void
		{
			objet.actionCollisionBord();
		}
		
		
		public function ajoutEnfants(objet:MIObjet):void {
			objet.ajoutObjetEcouteur(this);
			enfants.push(objet);
		}
		public function supprimerEnfants(objet:MIObjet):void 
			enfants.slice(enfants.indexOf(objet), 1);
		}
		
		
		public function deplacementObjet(objet:MIObjet):void
		{
		}
		
		public function changementTaille(objet:MIObjet):void
		{
		}
		
		public function objetMeurt(objet:MIObjet):void
		{
		}
		
		public function objetNait(objet:MIObjet):void
		{
		}
	}
}