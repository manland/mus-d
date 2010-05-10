package Decor
{
	import Coeur.MIObjet;
	import Coeur.MScene;
	
	import Utilitaires.MAxe;

	public class MaScene extends MScene
	{
		public function MaScene()
		{
			super();
		}
		
		
		public override function collision(objet1:MIObjet, objet2:MIObjet, axe:MAxe) : void
		{
			super.collision(objet1, objet2, axe);
			//trace(objet1.getNomClasse(), "AAAAAAAAAA", objet2.getNomClasse());
		}
	}
}