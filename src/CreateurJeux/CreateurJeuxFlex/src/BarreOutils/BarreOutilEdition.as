package BarreOutils
{
	public class BarreOutilEdition extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/copier.png")] private var copier:Class;
		[Bindable] [Embed("Images/barre_outil/paste.png")] private var coller:Class;
		[Bindable] [Embed("Images/barre_outil/cut.png")] private var couper:Class;
		
		public function BarreOutilEdition()
		{
			super();
			liste_bouton.push({id:"bouton_copier", icon:copier, toolTip:"Copier"});
			liste_bouton.push({id:"bouton_coller", icon:coller, toolTip:"Coller"});
			liste_bouton.push({id:"bouton_couper", icon:couper, toolTip:"Couper"});
		}
		
	}
}