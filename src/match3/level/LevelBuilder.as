package match3.level {
	import match3.managers.AssetManager;
	
	public class LevelBuilder {
		private var _level:Level;
		
		public function LevelBuilder() {
			AssetManager.get().load("data/level.xml", "level", function(resp:*):void {
				build(resp);
			});
		}
		
		public function build(levelInfo:Object):void {
			_level = new Level(levelInfo.name, levelInfo.array);
		}
		
		public function get current():Level { return _level; }
	
	}
}