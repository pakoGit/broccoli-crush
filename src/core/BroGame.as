package core {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class BroGame extends Sprite {
		internal var _scene:BroContainer;
		
		public function BroGame(w:int, h:int, scene:Class) {
			BroGlobal.game = this;
			BroGlobal.init(w, h);
			_scene = new scene();
			addEventListener(Event.ENTER_FRAME, onFrame);
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
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
		
		private function onMouseDown(e:MouseEvent):void {
			BroGlobal.mouse.onMouseDown();
		}
		
		private function onMouseUp(e:MouseEvent):void {
			BroGlobal.mouse.onMouseUp();
		}
		
		private function onMouseMove(e:MouseEvent):void {
			BroGlobal.mouse.update(mouseX, mouseY);
		}
	
	}
}