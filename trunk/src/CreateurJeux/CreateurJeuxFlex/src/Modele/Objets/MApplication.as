package Modele.Objets
{
	import Modele.Objets.Scenes.SceneModele;
	
	
	public class MApplication
	{
		private var vecteur_scene:Array;
		
		
		public function MApplication()
		{
			vecteur_scene = [];
		}
		
		public function ajoutScene(scene:SceneModele):void
		{
			vecteur_scene.push(scene);
		}
		
		public function retirerScene(scene:SceneModele):void
		{
			var position_scene:int;
			position_scene=vecteur_scene.indexOf(scene);
			vecteur_scene.splice(position_scene,1);
		}
		
		public function enregistrerFlex(titre:String):String
		{
			var str:String="";
			str+="<?xml version=\"1.0\" encoding=\"utf-8\"?> "+
				" \n <mx:Application xmlns:mx=\"http://www.adobe.com/2006/mxml\" "+
				"layout=\"absolute\" xmlns:TER=\"Graphique.*\" pageTitle=\""+titre+"\"> \n";
				
			for(var i:int; i<vecteur_scene.length; i++)
			{
				str+="\t"+vecteur_scene[i].enregistrer()+"\n";
			}
			
			str+="</mx:Application>";
			return str;
		}
		
		public function enregistrerAir(titre:String):String
		{
			var str:String="";
			str+="<?xml version=\"1.0\" encoding=\"utf-8\"?> "+
				" \n <mx:WindowedApplication title=\""+titre+"\" xmlns:mx=\"http://www.adobe.com/2006/mxml\" "+
				"layout=\"absolute\" xmlns:TER=\"Graphique.*\"> \n";
				
			for(var i:int; i<vecteur_scene.length; i++)
			{
				str+="\t"+vecteur_scene[i].enregistrer()+"\n";
			}
			
			str+="</mx:WindowedApplication>";
			return str;
		}

		
		

	}
}