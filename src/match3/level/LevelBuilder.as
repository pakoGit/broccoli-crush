package match3.level {
	import core.BroGlobal;
	import core.BroSprite;
	import match3.managers.AssetManager;
	
	public class LevelBuilder {
		
		public function LevelBuilder() {
			//build(levelArray);
			AssetManager.get().load("data/level.xml", "level", function(resp:*):void { build(resp);} );
		}
		
		public function build(levelArray:Array):void {
			var map:Object = {1:"cell", 2:"sand", 3:"box" };
			
			for (var i:int = 0; i < levelArray.length; i++)
				for (var j:int = 0; j < levelArray[i].length; j++) {
					var id:int = levelArray[i][j]; //tile id
					if (id == 0) continue;
					var cell:BroSprite = new BroSprite(128+i * 64, 128 + j * 64, AssetManager.get().getData(map[id]));
					BroGlobal.scene.addChild(cell);
				}
		}
		
	}
}