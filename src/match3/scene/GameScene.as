package match3.scene 
{
	import core.BroContainer;
	import core.BroSprite;
	import match3.level.LevelBuilder;
	import match3.managers.AssetManager;

public class GameScene extends BroContainer
{
	public function GameScene() 
	{
		var level:LevelBuilder = new LevelBuilder();
		//AssetManager.get().getData();
		
		var bg:BroSprite = new BroSprite(0, 0, AssetManager.get().getData("bg"));
		addChild(bg);
	}
	
}
}