package MenuAccordeons
{
	import mx.controls.TileList;

	public class ListeObjetControle extends ListeObjets
	{
		[Bindable] [Embed("Images/objets_controles/voiture.png")] private var voiture:Class;
		
		
		public function ListeObjetControle()
		{
			super();
			liste.push({id:"voiture", label:"", source:"Images/objets_controles/voiture.png",largeur:"64", hauteur:"64", icon:voiture,type:"ObjetControle", toolTip:"voiture"});
		}
	}
}	