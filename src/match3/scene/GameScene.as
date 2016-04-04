package match3.scene {
	import core.BroContainer;
	import core.BroSprite;
	import match3.entity.Chip;
	import match3.enum.CellNames;
	import match3.global.GVar;
	import match3.level.LevelBuilder;
	import match3.managers.AssetManager;
	
	public class GameScene extends BroContainer {
		private var _level:LevelBuilder;
		
		public function GameScene() {
			_level = new LevelBuilder();
			//AssetManager.get().getData();
			
			var bg:BroSprite = new BroSprite(0, 0, AssetManager.get().getData("bg"));
			addChild(bg);
		}
		
		public override function update():void {
			super.update();
			if (!_level.current) return;
			var a:Array = _level.current.chips;
			for (var i:int = 0; i < a.length; i++)
				for (var j:int = 0; j < a[i].length; j++) {
					if (a[i][j] == 0) continue;
					var chip:Chip = a[i][j];
					if (j+1<_level.current.rows && _level.current.isCellFree(i, j+1)) {
						_level.current.chips[i][j] = 0;
						_level.current.chips[i][j + 1] = chip;
						chip.move(_level.current.x + i*GVar.TILE_W, _level.current.y + (j+1)*GVar.TILE_H);
					}
				}
		}
	
	}
}