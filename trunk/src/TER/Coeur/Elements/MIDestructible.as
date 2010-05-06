package Coeur.Elements
{
	import Coeur.MIObjet;
	import Utilitaires.MAxe;
	
	public interface MIDestructible
	{
		function collision(objet_collisionne:MIObjet,axe:MAxe):void;
	}
}