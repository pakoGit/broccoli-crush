package core {
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	public class BroSprite extends BroGO{
		private var _frame:BitmapData;
		private var _bdata:BitmapData;
		private var _point:Point;
		private var _zeroPoint:Point;
		
		public var speed:Number;
		
		public function BroSprite(x:Number , y:Number, graph:BitmapData) {
			_zeroPoint = new Point(0, 0);
			this.x = x;
			this.y = y;
			speed = 0.0;
			_point = new Point(x, y);
			loadGraph(graph);
		}
		
		public function loadGraph(graph:BitmapData):void {
			_bdata = graph;
			width = _bdata.width;
			height = _bdata.height;
			if(!_frame) _frame = new BitmapData(width, height, true);
		}
		
		public override function update():void {
			_frame.fillRect(_frame.rect, 0);
			_frame.copyPixels(_bdata, _bdata.rect, _zeroPoint);
			_point.x = x;
			_point.y = y;
		}
		
		public override function draw():void {
			BroGlobal.camera.buffer.copyPixels(_frame, _frame.rect, _point, null, null, true);
		}
	
	}
}