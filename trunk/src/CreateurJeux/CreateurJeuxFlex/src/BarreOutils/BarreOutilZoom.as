package BarreOutils
{
	public class BarreOutilZoom extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/zoom-in.png")] private var zoom_plus:Class;
		[Bindable] [Embed("Images/barre_outil/zoom_out.png")] private var zoom_moins:Class;
		
		
		public function BarreOutilZoom()
		{
			super();
			liste_bouton.push({id:"bouton_zoom_p", icon:zoom_plus, toolTip:"Zoom +"});
			liste_bouton.push({id:"bouton_zoom_m", icon:zoom_moins, toolTip:"Zoom -"});
		}
		
	}
}