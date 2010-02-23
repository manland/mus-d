package
{
	public class BarreOutilFichier extends BarreOutil
	{
		[Bindable] [Embed("Images/barre_outil/new_fic.png")] private var btn_nouveau:Class;
		[Bindable] [Embed("Images/barre_outil/enregistrer.png")] private var btn_enregistrer:Class;
		
		public function BarreOutilFichier()
		{
			super();
			liste_bouton.push({id:"bouton_nouveau", icon:btn_nouveau, toolTip:"Nouveau"});
			liste_bouton.push({id:"bouton_enregistrer", icon:btn_enregistrer, toolTip:"Enregistrer"});
		}
		
	}
}