package Graphisme.PanelDegrades
{
	import Erreurs.Erreur;
	
	import Graphique.MGraphiqueScene;
	import Graphique.MIObjetGraphique;
	import Graphique.Textures.Degrades.MDegrade;
	
	import flash.events.MouseEvent;
	
	import mx.containers.Grid;
	import mx.containers.GridItem;
	import mx.containers.GridRow;
	import mx.containers.Panel;

	public class HistoriqueDegrades extends Panel
	{
		// tableau contenant les degradés :
		private var tab_scene:Array;
		
		private var grille:Grid;
		private var ligne_degrade1:GridRow;
		private var ligne_degrade2:GridRow;
		
		private var fenetre_degrade:FenetreDegrade;
		private var erreur:Erreur;
		
		public function HistoriqueDegrades(fenetre_degrade:FenetreDegrade,erreur:Erreur)
		{
			super();
			this.styleName = "stylePanelDegrade";
			this.fenetre_degrade = fenetre_degrade;
			this.erreur = erreur;
			this.title = "Mes dégradés";
			tab_scene = new Array();
			initialisation();
		}
		
		
		public function initialisation():void
		{
			grille = new Grid();
			ligne_degrade1 = new GridRow();
			ligne_degrade2 = new GridRow();
			
			grille.addChild(ligne_degrade1);
			grille.addChild(ligne_degrade2);
			this.addChild(grille);
		}
		
		public function mettreAJour():void
		{
			ligne_degrade1.removeAllChildren();
			ligne_degrade2.removeAllChildren();
			for(var i:int=0;i<tab_scene.length;i++)
			{
				if(i<4)
				{
					var item_scene:GridItem = new GridItem();
					var scene:MGraphiqueScene = ((MIObjetGraphique)(tab_scene[i]));
					scene.width=20;
					scene.height=20;
					scene.setTexture(scene.getTexture().clone());
					scene.addEventListener(MouseEvent.CLICK,clicSurHistorique);
					item_scene.addChild(scene.getGraphique());
					ligne_degrade1.addChild(item_scene);
				}
				else
				{
					var item_scene:GridItem = new GridItem();
					var scene:MGraphiqueScene = ((MIObjetGraphique)(tab_scene[i]));
					scene.width=20;
					scene.height=20;
					scene.setTexture(scene.getTexture().clone());
					scene.addEventListener(MouseEvent.CLICK,clicSurHistorique);
					item_scene.addChild(scene.getGraphique());
					ligne_degrade2.addChild(item_scene);
				}
			}
		}

		public function estDejaDansHistorique(degrade:MDegrade):Boolean
		{
			var deja_present:Boolean = false;
			
			for(var i:int=0;i<tab_scene.length;i++)
			{
				var deg_du_tableau:MDegrade =((MIObjetGraphique)(tab_scene[i])).texture as MDegrade;
				if(couleursEgale(deg_du_tableau,degrade) &&
					deg_du_tableau.getFocalPtRatio() == degrade.getFocalPtRatio() &&
					deg_du_tableau.getBoxRotation() == degrade.getBoxRotation() &&
					deg_du_tableau.getInterpolation() == degrade.getInterpolation() &&
					deg_du_tableau.getSpreadMethod() == degrade.getSpreadMethod() &&
					deg_du_tableau.getType() == degrade.getType()
				  )
				  {
				  	erreur.sysout.text+="ici \n";
				  	deja_present = true;
				  }			
			}
			return deja_present;
		}
		
		public function couleursEgale(degrade1:MDegrade,degrade2:MDegrade):Boolean
		{
			var ok:Boolean =false;
			if(degrade1.getCouleurs().length>degrade2.getCouleurs().length || degrade1.getCouleurs().length<degrade2.getCouleurs().length)
			{
				ok=false;
			} 
			else
			{
				for(var i:int=0; i<degrade1.getCouleurs().length;i++)
				{
					for(var j:int=0;j<degrade2.getCouleurs().length;j++)
					{
						if(degrade1.getCouleurs()[i]==degrade2.getCouleurs()[j] &&
						   degrade1.getAlphas()[i]==degrade2.getAlphas()[j] &&
						   degrade1.getRatios()[i]==degrade2.getRatios()[j]
						   )
						   {
						   	ok=true;
						   }
					}
				}
			}
			return ok;	
		}

		// ----------------------------------------------------------------
		// 				Evenements :
		// ----------------------------------------------------------------
		public function clicSurHistorique(event:MouseEvent):void
		{
			fenetre_degrade.mettreAJour(((MIObjetGraphique)(event.currentTarget)).clone());
		}
		
		// accesseurs : 
		public function getTableauScene():Array {return tab_scene;}		

		
	}
}