package match3.entity.level {
	import core.BroContainer;
	import core.BroGlobal;
	import match3.managers.AssetManager;
	
	public class LevelBuilder {
		private var _level:Level;
		
		public function LevelBuilder() {
			AssetManager.get().load("data/level.xml", "level", function(resp:*):void {				
				buildCell(resp);
				fillChips();
			});
		}
		
		public function buildCell(levelInfo:Object):void {
			_level = new Level(levelInfo.name, levelInfo.array);
		}
		
		private function fillChips():void {
			var a:Array = _level.tiles;
			for (var i:int = 0; i < _level.colums; i++){
				for (var j:int = 0; j < _level.rows; j++) {
					if(!_level.isCellFree(i,j)) continue;
					_level.addChip(i, j);
				}
			}
		}
		
		public function get current():Level { return _level; }
	
	}
}