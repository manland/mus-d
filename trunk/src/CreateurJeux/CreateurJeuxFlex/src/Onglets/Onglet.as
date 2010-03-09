package Onglets
{
	import Objets.Objet;
	import Objets.ObjetControles.ObjetControle;
	import Objets.ObjetDynamiques.ObjetDynamique;
	import Objets.ObjetStatiques.ObjetStatique;
	import Objets.Scenes.MScene;
	
	import PanelOptions.PanelOption;
	
	import flash.events.MouseEvent;
	import flash.utils.*;
	
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.core.DragSource;
	import mx.events.DragEvent;
	import mx.managers.DragManager;

	public class Onglet extends Canvas
	{		
		private var panel_opt:PanelOption;
		private var image_globale:Image;
		private var id_img:int=0; 			// permet de donner un id a chaque objet glissé sur le canevas
		private var xInit:Number;		// position de la souris qd on clique sur le canvas
		private var yInit:Number;
		private var ma_scene:MScene;
		private var monObjetS:Objets.ObjetStatiques.ObjetStatique;
		private var monObjetD:Objets.ObjetDynamiques.ObjetDynamique;
		private var monObjetC:Objets.ObjetControles.ObjetControle;
		private var liste_attributs:Array;
		
		public function Onglet(panel_opt:PanelOption)
		{
			super();
			this.label="onglet";
			this.panel_opt=panel_opt;
			liste_attributs=[];
			
			
			ma_scene= new MScene("imageS",this.width,this.height,this.x,this.y);
			image_globale=new Image();
			image_globale.styleName="imageGlobale";
			
			// ajout des actions : 
			this.addEventListener(DragEvent.DRAG_ENTER,dragEnterHandler);				
		//	this.addEventListener(MouseEvent.MOUSE_DOWN,afficherCoordonnees);
			this.addEventListener(MouseEvent.MOUSE_DOWN,enregistrerPosition);
			this.addEventListener(DragEvent.DRAG_DROP,dragDropHandler);
		}
		
		private function dragEnterHandler(event:DragEvent):void
        {
		    DragManager.acceptDragDrop(Onglet(event.currentTarget));
        }
		
		private function dragDropHandler(event:DragEvent):void
        {
           if(event.dragSource.hasFormat("items"))
		   {
			   var items:Array = event.dragSource.dataForFormat("items") as Array;
			   var type_obj:String=items[0].type;
			   
			   var img:Image = new Image();
			   img.x=event.localX - 20;
			   img.y=event.localY - 20;
			   img.height=items[0].hauteur;
			   img.width=items[0].largeur;
			   img.source=items[0].source;
			   
			   // on crée un nouvel objet en fonction de son type :
			   liste_attributs=[img.source,img.width,img.height,img.x,img.y];
			   panel_opt.sysout.text+="avant "+type_obj+"\n";
			   if(type_obj=="ObjetControle")
			   {	liste_attributs.push("type_controle");	}
			   else if (type_obj=="ObjetDynamique") 			  
			   {	liste_attributs.push("mvmt");	}
			   
			  panel_opt.sysout.text+="taillle liste "+liste_attributs.length+"\n";
			   
			   var obj =creerInstance("Objets."+type_obj+"s."+type_obj,liste_attributs);
			   
			    for(var i:int; i< liste_attributs.length; i++)
			   {
			   		panel_opt.sysout.text+=liste_attributs[i].toString()+"\n";
			   }			   
			   
			   this.addChild(img);
			   ma_scene.ajouterObjet(obj);
			   panel_opt.sysout.text+=ma_scene.enregistrer();
			   img.id=id_img.toString();
			   id_img=id_img + 1;			   
			   img.addEventListener(MouseEvent.MOUSE_MOVE,selectionner);
		   }
		   else
		   {
			   	event.dragInitiator.x=event.localX - xInit;
			    event.dragInitiator.y=event.localY - yInit;			   	
		   }            
        }
        
        private function selectionner(event:MouseEvent):void
		{
			var dragInitiator:Image=Image(event.currentTarget);
			image_globale=dragInitiator;
            var ds:DragSource = new DragSource();

			dragInitiator.styleName="imageGlobale";
            ds.addData(dragInitiator, "img");

			var imageProxy:Image = new Image();
		    imageProxy.source = event.currentTarget.source;
		    imageProxy.height=48;
		    imageProxy.width=48;           
		   
	//	    xPos.addEventListener(Event.CHANGE,deplacerImageX);
	//	    yPos.addEventListener(Event.CHANGE,deplacerImageY);
	//	    tailleImg.addEventListener(Event.CHANGE,changerTaille);
	//	    image_globale.addEventListener(MouseEvent.MOUSE_DOWN,afficherSource);
			image_globale.addEventListener(MouseEvent.CLICK,afficherPanelObjet);
            DragManager.doDrag(dragInitiator, ds, event, imageProxy);
        }
        
         private function enregistrerPosition(event:MouseEvent):void
         {
         	 xInit=event.localX;
        	 yInit=event.localY;
         }
         
        private function afficherPanelObjet(event:MouseEvent):void
        {
//        	var fic_xml:XML;
//        	fic_xml=describeType(event.currentTarget);
//        	panel_opt.sysout.text+="fic_xml : "+fic_xml.toXMLString();
//        	panel_opt.sysout.text+=event.currentTarget.;
        }
        
        public function creerInstance(nom_classe:String, args:Array):Objet
        {
        	var ma_classe:Class = getDefinitionByName(nom_classe) as Class;
        	var instance:Objet=null;
        	if(args.length==6)
        	{
        		instance = new ma_classe(args[0],args[1],args[2],args[3],args[4],args[5]);
        	}
        	else
        	{
        		instance = new ma_classe(args[0],args[1],args[2],args[3],args[4]);
        	}
        	//instance.initArgs.apply(null, args);
        	return instance;

        }        
        
        public function getScene():MScene
        {
        	return ma_scene;
        }
	}
}