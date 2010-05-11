package Graphisme.Onglets
{
	import Erreurs.Erreur;
	
	import Graphique.MIObjetGraphique;
	
	import Graphisme.PanelOptions.PanelOption;
	
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.containers.Canvas;

	public class OperationSurObjet
	{
		private var panel_opt:PanelOption;
		private var erreur:Erreur;
		private var onglet:Onglet;		
		private var cadre:Canvas;		
		private var objet:MIObjetGraphique;
		private var clone:MIObjetGraphique;
		private var pos_x:Number;
		private var pos_y:Number;
		
		public function OperationSurObjet(panel_opt:PanelOption,onglet:Onglet,erreur:Erreur)
		{
			super();
			this.erreur=erreur;
			this.panel_opt=panel_opt;
			this.onglet=onglet;
			objet = null;
			clone = null;
		}
		
		 public function donnerFocus(event:MouseEvent):void
        {
       		objet.getGraphique().setFocus();
        }
        
        protected function focusInHandler(event:FocusEvent):void
        {
        //	var obj:MIObjetGraphique = event.currentTarget as MIObjetGraphique;
        	objet.getGraphique().addEventListener(KeyboardEvent.KEY_UP,controleClavier);
        	if(objet!=null)
        	{
        		afficherCadre();
        	}
        }
        
        public function afficherCadre():void
        {
        	onglet.enleverCadres();
        	onglet.invalidateDisplayList();
        	cadre =new Canvas();
        	cadre.width=objet.getObjet().getLargeur();
        	cadre.height=objet.getObjet().getHauteur();
        	cadre.x=objet.getObjet().getX();
        	cadre.y=objet.getObjet().getY();
        	cadre.styleName="cadre";
        	onglet.addChild(cadre);	
        }
		
		public function perteFocus(event:FocusEvent):void
        {
        	if(objet!=null)
        	{	
        		if(cadre)
        		{
	        		onglet.enleverCadres();
	        	}
	        }
        }
        
        public function apresDeplacement():void
        {
        	if(cadre==null)
        	{
        		cadre = new Canvas();
        	}
        	else
        	{
        		cadre.move(objet.getObjet().getX(),objet.getObjet().getY());
        	}
        }
      
      
		public function controleClavier(event:KeyboardEvent):void
		{
			if(event.keyCode==Keyboard.DELETE)
			{
				supprimerObjet();
			}
			else if(event.controlKey && event.keyCode==Keyboard.C)
			{
				copier();
			}
			else if(event.controlKey && event.keyCode==Keyboard.V)
			{
				coller();
			}
			else if(event.keyCode==Keyboard.UP)
			{
				objet.getObjet().setY(objet.getObjet().getY()-1);
				apresDeplacement();
			}
			else if(event.keyCode==Keyboard.DOWN)
			{
				objet.getObjet().setY(objet.getObjet().getY()+1);
				apresDeplacement();
			}
			else if(event.keyCode==Keyboard.LEFT)
			{
				objet.getObjet().setX(objet.getObjet().getX()-1);
				apresDeplacement();
			}
			else if(event.keyCode==Keyboard.RIGHT)
			{
				objet.getObjet().setX(objet.getObjet().getX()+1);
				apresDeplacement();
			}
		}
		
		public function copier():void
		{
			pos_x = objet.getObjet().getX();
			pos_y = objet.getObjet().getY();
			clone = objet.clone() as MIObjetGraphique; 	
		}
		
		public function coller():void
		{
			if(clone != null)
			{
				var c:MIObjetGraphique = clone.clone();
				pos_x +=10;
				pos_y +=10;
				var id_objet:String = onglet.getIdObjet();
				var id_onglet:Number = onglet.getNbId();
				c.getGraphique().id= id_objet+onglet.getNbId();
				onglet.setNbId(id_onglet+1); 
				c.getObjet().setX(pos_x);
				c.getObjet().setY(pos_y);
				this.setObjet(c);
				c.getGraphique().setFocus();
				onglet.addChild(c.getGraphique());
			}
		}
		
		public function supprimerObjet():void
		{
			if(objet!=null)
			{
				if(panel_opt.getDicoMvt()[objet]!=null)
				{
					delete panel_opt.getDicoMvt()[objet];
					panel_opt.getTabOnglet().getOnglet().genererCodeMouvement(objet);
				}
				onglet.removeChild(objet.getGraphique());
				onglet.enleverCadres();
				objet=null;
				onglet.setFocus();
				panel_opt.setObjet(onglet);
			}
		}
		
        // accesseur : 
        public function setObjet(objet:MIObjetGraphique):void 
        {
        	this.objet=objet;
			objet.getGraphique().addEventListener(MouseEvent.MOUSE_MOVE,onglet.selectionner);
			objet.getGraphique().addEventListener(MouseEvent.CLICK,donnerFocus);
			objet.getGraphique().addEventListener(FocusEvent.FOCUS_IN,focusInHandler);
			objet.getGraphique().addEventListener(FocusEvent.FOCUS_OUT,perteFocus);
        }
        public function getObjet():MIObjetGraphique { return objet; }
	}
}