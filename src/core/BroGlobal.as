package core {
	import flash.display.BitmapData;
	
	public class BroGlobal {
		
		public static var game:BroGame;
		public static var camera:BroCamera;
		
		public static function init(w:Number, h:Number):void {
			camera = new BroCamera(w, h);
			game.addChild(camera.sprite);
		}
		
		public static function addGraph(graph:BitmapData):void {
		
		}
		
		static public function get scene():BroContainer{
			return game._scene;
		}
	}
}