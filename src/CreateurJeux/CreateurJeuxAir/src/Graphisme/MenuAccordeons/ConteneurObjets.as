package Graphisme.MenuAccordeons
{
	import Erreurs.Erreur;
	
	import Graphique.MGraphiqueAbstrait;
	import Graphique.MGraphiqueRectangle;
	import Graphique.MGraphiqueRond;
	import Graphique.MGraphiqueScene;
	import Graphique.MGraphiqueTriangle;
	import Graphique.MIObjetGraphique;
	import Graphique.Textures.MBordure;
	import Graphique.Textures.MCouleur;
	import Graphique.Textures.MImage;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.*;
	
	import mx.containers.Accordion;
	import mx.controls.Image;
	import mx.core.DragSource;
	import mx.managers.DragManager;

	public class ConteneurObjets extends Accordion
	{
		private var image:MGraphiqueRectangle;
		private var erreur:Erreur;
		private var mon_objet:MGraphiqueAbstrait;
		private var monObjetR:MGraphiqueRectangle;
		private var monObjetRd:MGraphiqueRond;
		private var monObjetS:MGraphiqueScene;
		private var monObjetT:MGraphiqueTriangle;
		
		// chargement d'un fichier xml :
		private var chargementXML:URLLoader;
		private var fichier:URLRequest;
		
		
		
		public function ConteneurObjets(erreur:Erreur)
		{
			super();
			this.erreur=erreur;
		
			this.height=200;
			this.width=135;
			
			chargementXML = new URLLoader();
			fichier = new URLRequest("XML/liste_images.xml");	
			
			chargementXML.addEventListener(Event.COMPLETE,chargementComplet);
			chargementXML.load(fichier);	
		}


		// cette fonction permet de charger le fichier xml contenant les chemins vers les images
		public function chargementComplet(event:Event):void 
		{   
			var mon_fichier_xml:XML = new XML(event.target.data); 	// on récupère notre xml
			var place_x:int=0;
			var place_y:int=0;
			for each (var noeud:XML in mon_fichier_xml.elements())
			{
				place_x=5;
				place_y=5;
				var mon_conteneur:MGraphiqueScene = new MGraphiqueScene();
				mon_conteneur.height=200;
				mon_conteneur.width=140;
				mon_conteneur.texture = new MCouleur(0xFFFFFF);
				var exp_reg:RegExp = new RegExp(/MGraphique/);
				if(exp_reg.test(noeud.name()))
				{
					var resultat:Array = ((String)(noeud.name())).split(/MGraphique/);
					mon_conteneur.label=resultat[1].toString();
					var liste_attribut_obj_vide:Array = [];
					if(noeud.name()=="MGraphiqueScene")
					{
						
						for each (var fils:XML in noeud.children())
						{
							var img_scene:MGraphiqueRectangle = new MGraphiqueRectangle(place_x,place_y,30,30);				
							img_scene.id=fils.@id;
							img_scene.texture = new MImage(fils.@source);
							mon_conteneur.addChild(img_scene);
		
							place_x+=20;
							if(place_x>=60)
							{
								place_x=5;
								place_y+=20;
							}		
							img_scene.addEventListener(MouseEvent.MOUSE_MOVE,drag);
						}
						this.addChild(mon_conteneur);	
					}
					else
					{
						liste_attribut_obj_vide= [place_x,place_y,30,30];
						place_x+=20;
						var obj_vide = creerInstance("Graphique."+noeud.name(), liste_attribut_obj_vide);
						obj_vide.id=resultat[1]+"_vide";
						obj_vide.setTexture(new MCouleur(0xFFFFFF));
						obj_vide.setBordure(new MBordure(1,0x000000));
						obj_vide.addEventListener(MouseEvent.MOUSE_MOVE,drag);
						mon_conteneur.addChild(obj_vide);
						for each (var fils:XML in noeud.children())
						{				
							var liste_attribut:Array = [place_x,place_y,Number(fils.@largeur)/2,Number(fils.@hauteur)/2];
							var mon_obj = creerInstance("Graphique."+noeud.name(),liste_attribut);
	
							mon_obj.id=fils.@id;
							mon_obj.texture = new MImage(fils.@source);
							mon_conteneur.addChild(mon_obj);
		
							place_x+=20;
							if(place_x>=60)
							{
								place_x=5;
								place_y+=20;
							}		
							mon_obj.addEventListener(MouseEvent.MOUSE_MOVE,drag);
						}
						this.addChild(mon_conteneur);
					}
				}
				else
				{
					mon_conteneur.label=noeud.name();
					for each (var fils:XML in noeud.children())
					{				
						var obj:MGraphiqueRectangle = new MGraphiqueRectangle(place_x,place_y,Number(fils.@largeur),Number(fils.@hauteur));	

						obj.id=fils.@id;
						obj.texture = new MImage(fils.@source);
						mon_conteneur.addChild(obj);
	
						place_x+=20;
						if(place_x==60)
						{
							place_x=0;
							place_y+=20;
						}		
						obj.addEventListener(MouseEvent.MOUSE_MOVE,drag);
					}
					this.addChild(mon_conteneur);
				}
						 
			}
	   }
	   
	   
	   public function drag(event:MouseEvent):void
	   {
	   		var dragInitiator:MIObjetGraphique=MIObjetGraphique(event.currentTarget);
            var ds:DragSource = new DragSource();

            ds.addData(dragInitiator, "img");

			var imageProxy:Image = new Image();
			var image_rect:MImage = event.currentTarget.getTexture() as MImage;
			if(image_rect!=null)
			{
		  	 	 imageProxy.source =  image_rect.getUrlImage();
		 	}
		    imageProxy.height=dragInitiator.getObjet().getHauteur();
		    imageProxy.width=dragInitiator.getObjet().getLargeur();         
            DragManager.doDrag(dragInitiator.getGraphique(), ds, event, imageProxy);
	   }
	   
	   // permet de creer une instance d'un objet en lui passant un nom de classe en parametre et une liste d'attribut
	   public function creerInstance(nom_classe:String, args:Array):MIObjetGraphique
        {
        	var ma_classe:Class = getDefinitionByName(nom_classe) as Class;
        	var instance:MIObjetGraphique=null;
        	instance = new ma_classe(args[0],args[1],args[2],args[3]);
        	return instance;
        }  
	   
	}
}