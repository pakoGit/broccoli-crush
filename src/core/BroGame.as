package core {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class BroGame extends Sprite {
		internal var _scene:BroContainer;
		
		public function BroGame(w:int, h:int, scene:Class) {
			BroGlobal.game = this;
			BroGlobal.init(w, h);
			_scene = new scene();
			addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		private function onFrame(e:Event):void {
			update();
			draw();
		}
		
		private function update():void {
			BroGlobal.camera.update();
			_scene.update();
			//draw
		}
		
		private function draw():void {
			BroGlobal.camera.lock();
			_scene.draw();
			BroGlobal.camera.unlock();
		}
	
	}
}