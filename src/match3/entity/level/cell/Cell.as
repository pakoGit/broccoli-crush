package match3.entity.level.cell {
	import core.BroContainer;
	import core.BroSprite;
	import match3.enum.CellNames;
	import match3.enum.StateNames;
	import match3.entity.level.cell.states.IState;
	import match3.entity.level.cell.states.NormalCellState;
	import match3.entity.level.cell.states.SandCellState;
	import match3.managers.AssetManager;
	import match3.managers.StateManager;
	
	public class Cell extends BroContainer {
		private var _states:StateManager;
		private var _bg:BroSprite;
		
		public function Cell(x:int, y:int) {
			_bg = new BroSprite(x, y, AssetManager.get().getData("cell"));
			addChild(_bg);
			
			_states = new StateManager(this);
			_states.registry(StateNames.NORMAL, NormalCellState);
			_states.registry(StateNames.SAND, SandCellState);
			_states.change(StateNames.NORMAL);
			//_states.change(StateNames.SAND);
		}
		
		public function isFree():Boolean { return state.current.id != CellNames.SAND;}
		public function get state():StateManager { return _states; }
		public function set x(value:Number):void { _bg.x = value; }
		public function get x():Number { return _bg.x; }
		public function set y(value:Number):void { _bg.y = value; }
		public function get y():Number { return _bg.y; }
	}
}