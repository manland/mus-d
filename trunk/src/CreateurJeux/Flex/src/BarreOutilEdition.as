package
{
	public class BarreOutilEdition extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/copier.png")] private var btn_copier:Class;
		[Bindable] [Embed("Images/barre_outil/paste.png")] private var btn_coller:Class;
		[Bindable] [Embed("Images/barre_outil/cut.png")] private var btn_couper:Class;
		
		public function BarreOutilEdition()
		{
			super();
			liste_bouton.push({id:"bouton_copier", icon:btn_copier, toolTip:"Copier"});
			liste_bouton.push({id:"bouton_coller", icon:btn_coller, toolTip:"Coller"});
			liste_bouton.push({id:"bouton_couper", icon:btn_couper, toolTip:"Couper"});
		}
		
	}
}