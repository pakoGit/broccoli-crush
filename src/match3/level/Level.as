package match3.level {
	import core.BroGlobal;
	import core.BroSprite;
	import flash.display.BitmapData;
	import match3.global.GVar;
	import match3.managers.AssetManager;
	
	public class Level {
		public var name:String;
		
		private var _tiles:Array;
		private var _up:Array;
		
		public function Level(name:String, arr:Array) {
			_tiles = [];
			_up = [];
			this.name = name;
			build(arr);
		}
		
		public function build(arr:Array):void {
			var map:Object = {1: "cell", 2: "sand", 3: "box"};
			var offsetX:int = (BroGlobal.camera.width >> 1) - (arr.length * GVar.TILE_W >> 1);
			var offsetY:int = (BroGlobal.camera.height >> 1) - (arr[0].length * GVar.TILE_H >> 1);
			var bgTile:BitmapData = AssetManager.get().getData(map[1]);
			for (var i:int = 0; i < arr.length; i++)
				for (var j:int = 0; j < arr[i].length; j++) {
					if (arr[i][j] == 0) continue;
					var cell:BroSprite = new BroSprite(offsetX + i * GVar.TILE_W, offsetY + j * GVar.TILE_H, bgTile);
					BroGlobal.scene.addChild(cell);
				}
		}
	}
}