package match3 {
	import core.BroGame;
	import match3.managers.AssetManager;
	import match3.scene.GameScene;
	
	public class App extends BroGame {
		
		public function App(w:int = 800, h:int = 600) {
			super(w, h, GameScene);
		}
	
	}
}