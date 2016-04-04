package match3.entity {
	import core.BroSprite;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import match3.managers.AssetManager;
	
	public class Chip extends BroSprite {
		private var _type:int;
		private var _dest:Point;
		
		public function Chip(x:Number, y:Number, type:int) {
			var bd:BitmapData = AssetManager.get().getData("chip" + type);
			if(!bd) bd = AssetManager.get().getData("chip1");
			super(x, y, bd);
			speed = 6.0;
			_type = type;
			_dest = new Point(x, y);
		}
		
		public override function update():void {
			if (y + speed < _dest.y) {
				y += speed;
			}else {
				y = _dest.y;
			}
			super.update();
		}
		
		public function move(x:Number, y:Number):void {
			_dest.x = x;
			_dest.y = y;
		}
		
		public function get type():int { return _type; }
	}
}