package BarreOutils
{
	import Onglets.TabOnglet;
	
	public class BarreOutilZoom extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/zoom-in.png")] private var zoom_plus:Class;
		[Bindable] [Embed("Images/barre_outil/zoom_out.png")] private var zoom_moins:Class;
		
		private var tab_onglet:TabOnglet;
		
		public function BarreOutilZoom(tab_onglet:TabOnglet)
		{
			super(tab_onglet);
			this.tab_onglet=tab_onglet;
			liste_bouton.push({id:"bouton_zoom_p", icon:zoom_plus, toolTip:"Zoom +"});
			liste_bouton.push({id:"bouton_zoom_m", icon:zoom_moins, toolTip:"Zoom -"});
		}
		
	}
}