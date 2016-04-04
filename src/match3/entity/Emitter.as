package match3.entity {
	import core.BroGlobal;
	import core.BroSprite;
	import flash.display.BitmapData;
	import match3.global.GVar;
	import match3.managers.AssetManager;
	
	public class Emitter extends BroSprite {
		private var onEmitterSpwn:Function;
		private var _spawnTime:int;
		
		public function Emitter(x:Number, y:Number, onEmitterSpwn:Function) {
			this.onEmitterSpwn = onEmitterSpwn;
			_spawnTime = GVar.EMITTER_DELAY;
			var bd:BitmapData = AssetManager.get().getData("emitter");
			super(x + (GVar.TILE_W >> 1) - (bd.width >> 1), y - bd.height, bd);
			sy = this.y;
		}
			
		private var wave:Number = 0.0;
		private var sy:Number;
		public override function update():void {
			y = sy - Math.abs(Math.sin(wave+=0.1))*10;
			super.update();
			if (--_spawnTime <= 0) {
				_spawnTime = GVar.EMITTER_DELAY;
				onEmitterSpwn(x, sy+height);
			}
		}
	
	}
}