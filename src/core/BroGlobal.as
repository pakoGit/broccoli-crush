package core {
	import core.input.MouseCtrl;
	import flash.display.BitmapData;
	
	public class BroGlobal {
		
		public static var game:BroGame;
		public static var camera:BroCamera;
		public static var mouse:MouseCtrl;
		
		public static function init(w:Number, h:Number):void {
			camera = new BroCamera(w, h);
			game.addChild(camera.sprite);
			mouse = new MouseCtrl;
		}
		
		public static function addGraph(graph:BitmapData):void {
		
		}
		
		static public function get scene():BroContainer{
			return game._scene;
		}
	}
}