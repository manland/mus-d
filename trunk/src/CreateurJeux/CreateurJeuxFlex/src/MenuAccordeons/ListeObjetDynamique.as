package MenuAccordeons
{
	import mx.controls.TileList;

	public class ListeObjetDynamique extends ListeObjets
	{
		[Bindable] [Embed("Images/objets_dynamiques/balle-foot.png")] private var balle_foot:Class;
		[Bindable] [Embed("Images/objets_dynamiques/balle-billard.png")] private var balle_billard:Class
	
		public function ListeObjetDynamique()
		{
			super();
			liste.push({id:"balle_foot", label:"", source:"Images/objets_dynamiques/balle-foot.png", icon:balle_foot, toolTip:"Balle foot"});
			liste.push({id:"balle_billard", label:"", source:"Images/objets_dynamiques/balle-billard.png", icon:balle_billard, toolTip:"Balle billard"});
		}
		
	}
}