package core {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class BroCamera extends BroGO {
		private const bgColor:uint = 0xff000000;
		public var buffer:BitmapData;
		public var sprite:Sprite;
		
		public function BroCamera(w:Number, h:Number) {
			width = w;
			height = h;
			sprite = new Sprite;
			buffer = new BitmapData(w, h, true, bgColor);
			var bitmap:Bitmap = new Bitmap(buffer);
			sprite.addChild(bitmap);
		}
		
		public override function update():void {
			
		}
		
		public function lock():void {
			buffer.lock();
			buffer.fillRect(buffer.rect, bgColor);
		}
		
		public function unlock():void {
			buffer.unlock();
		}
	
	}
}