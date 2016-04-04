package match3.managers {
	import match3.level.cell.states.IState;
	
	public class StateManager {
		private var _state:IState;
		private var _states:Object;
		private var _cache:Object;
		private var _target:Object;
		
		public function StateManager(target:Object) {
			_states = { };
			_cache = { };
			_target = target;
		}
		
		public function registry(id:String, stateClass:Class):void {
			if (_states[id]) return;
			_states[id] = stateClass;
		}
		
		public function change(id:String):void {
			if (_state) _state.exit();
			_state = getState(id);
			_state.apply();
		}
		
		private function getState(id:String):IState {
			if (!_cache[id]) {
				_cache[id] = new _states[id](_target);
			}
			return _cache[id];
		}
		
		public function get current():IState { return _state; }
	
	}
}