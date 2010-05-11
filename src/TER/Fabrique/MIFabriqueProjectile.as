package Fabrique {
	import Coeur.Elements.MElementAEtat;
	import Graphique.MIObjetGraphique;
	
	public interface MIFabriqueProjectile {
		
		function creer(tireur:MElementAEtat):MIObjetGraphique;

	}
}