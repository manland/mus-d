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
			liste.push({id:"balle_foot", label:"", source:"Images/objets_dynamiques/balle-foot.png",largeur:"64", hauteur:"64", icon:balle_foot, type:"ObjetDynamique", toolTip:"Balle foot"});
			liste.push({id:"balle_billard", label:"", source:"Images/objets_dynamiques/balle-billard.png", largeur:"64", hauteur:"64",icon:balle_billard, type:"ObjetDynamique", toolTip:"Balle billard"});
		}
		
	}
}