package Onglets
{
	import PanelOptions.PanelOption;
	import flash.events.MouseEvent;
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.core.DragSource;
	import mx.events.DragEvent;
	import mx.managers.DragManager;

	public class Onglet extends Canvas
	{		
		[Bindable] [Embed("Images/quitter.png")] private var fermer:Class;
		private var panel_opt:PanelOption;
		private var image_globale:Image;
		private var id_img:int=0; 			// permet de donner un id a chaque objet glissé sur le canevas
		private var xInit:Number;		// position de la souris qd on clique sur le canvas
		private var yInit:Number;
		
		public function Onglet(panel_opt:PanelOption)
		{
			super();
			this.label="onglet";
			this.icon=fermer;
			this.panel_opt=panel_opt;
			
			image_globale=new Image();
			
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
			   var img:Image = new Image();
			   img.x=event.localX - 20;
			   img.y=event.localY - 20;
			   img.source=items[0].source;
			   
			   this.addChild(img);
			   
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

            ds.addData(dragInitiator, "img");

			var imageProxy:Image = new Image();
		    imageProxy.source = event.currentTarget.source;
		    imageProxy.height=48;
		    imageProxy.width=48;           
		   
	//	    xPos.addEventListener(Event.CHANGE,deplacerImageX);
	//	    yPos.addEventListener(Event.CHANGE,deplacerImageY);
	//	    tailleImg.addEventListener(Event.CHANGE,changerTaille);
	//	    image_globale.addEventListener(MouseEvent.MOUSE_DOWN,afficherSource);
            DragManager.doDrag(dragInitiator, ds, event, imageProxy);
        }
        
         private function enregistrerPosition(event:MouseEvent):void
         {
         	 xInit=event.localX;
        	 yInit=event.localY;
         }
	}
}