package
{
	public class BarreOutilZoom extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/zoom-in.png")] private var btn_zoom_plus:Class;
		[Bindable] [Embed("Images/barre_outil/zoom_out.png")] private var btn_zoom_moins:Class;
		
		
		public function BarreOutilZoom()
		{
			super();
			liste_bouton.push({id:"bouton_zoom_p", icon:btn_zoom_plus, toolTip:"Zoom +"});
			liste_bouton.push({id:"bouton_zoom_m", icon:btn_zoom_moins, toolTip:"Zoom -"});
		}
		
	}
}