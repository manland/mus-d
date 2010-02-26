package MenuAccordeons
{
	public class ListeObjetStatiques extends ListeObjets
	{
		[Bindable] [Embed("Images/objets_statiques/mur-h-marron.png")] private var mur_h_marron:Class;
		[Bindable] [Embed("Images/objets_statiques/mur-v-marron.png")] private var mur_v_marron:Class;
//		
//		[Bindable] [Embed("Images/objets_statiques/mur-horizontal-gris.svg")] private var mur_h_gris:Class;
//		[Bindable] [Embed("Images/objets_statiques/mur-vertical-gris.svg")] private var mur_v_gris:Class;
		
		
		public function ListeObjetStatiques()
		{
			super();
	//		liste.push({id:"mur_h_gris", label:"", icon:mur_h_gris, toolTip:"Mur"});
	//		liste.push({id:"mur_v_gris", label:"", icon:mur_v_gris, toolTip:"Mur"});
			liste.push({id:"mur_h_marron",label:"",source:"Images/objets_statiques/mur-h-marron.png", icon:mur_h_marron, toolTip:"Mur"});
			liste.push({id:"mur_v_marron", label:"",source:"Images/objets_statiques/mur-v-marron.png", icon:mur_v_marron, toolTip:"Mur"});
		}
		
	}
}