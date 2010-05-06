package Graphisme.BarreOutils
{
	import Graphique.MIObjetGraphique;
	
	import Graphisme.Onglets.TabOnglet;
	
	import flash.events.Event;
	
	import mx.controls.Button;
	import mx.events.FlexEvent;
	import mx.events.ItemClickEvent;
	
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
			this.addEventListener(ItemClickEvent.ITEM_CLICK,clicItem);
			this.addEventListener(FlexEvent.CREATION_COMPLETE,miseAJour);
			tab_onglet.addEventListener(Event.CHANGE,miseAJour);
		}
		
		public function clicItem(event:ItemClickEvent):void
		{	
			if(event.index==0) // zoom+
			{
				((Button)(getChildAt(1))).enabled=true;
				tab_onglet.getOnglet().scaleX+=1;
				tab_onglet.getOnglet().scaleY+=1;
			}
			else if(event.index==1) // zoom-
			{
				if(tab_onglet.getOnglet().scaleX>1)
				{
					tab_onglet.getOnglet().scaleX-=1;
					tab_onglet.getOnglet().scaleY-=1;
				}
				else
				{
					((Button)(getChildAt(1))).enabled=false;
				}
			}
		}
		
		public function miseAJour(event:Event):void
		{
			if(tab_onglet.getOnglet().scaleX>1)
			{
				((Button)(getChildAt(1))).enabled=true;
			}
			else
			{
				((Button)(getChildAt(1))).enabled=false;
				((Button)(getChildAt(1))).styleName="btnZoomMoins";
			}
		}
		
	}
}