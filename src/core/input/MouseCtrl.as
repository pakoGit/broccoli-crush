package core.input {
	import flash.geom.Point;
	
	public class MouseCtrl {
		private var _pressed:Boolean;
		private var _pos:Point;
		
		public function MouseCtrl() {
			_pos = new Point;
			reset();
		}
		
		public function reset():void {
			_pressed = false;
			_pos.x = 0;
			_pos.y = 0;
		}
		
		public function onMouseDown():void {
			_pressed = true;
		}
		
		public function onMouseUp():void {
			_pressed = false;
		}
		
		public function update(x:Number, y:Number):void {
			_pos.x = x;
			_pos.y = y;
		}
		
		public function isPressed():Boolean { return _pressed; }
		public function get position():Point { return _pos; }
	
	}
}