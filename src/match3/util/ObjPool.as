package match3.util {
	
	public class ObjPool {
		private static var _instance:ObjPool;
		
		private var _pool:Object;
		private var _map:Object;
		
		public function ObjPool(s:Single) {
			_map = {};
			_pool = { };
			_instance = this;
		}
		
		public static function get instance():ObjPool {
			if (!_instance) {
				new ObjPool(new Single);
			}
			return _instance;
		}
		
		public function registry(id:String, type:Class):Boolean {
			if (_map[id]) return false;
			_map[id] = type;
			return true;
		}
		
		public function getObj(id:String):* {
			var a:Array = _pool[id];
			if (a && a.length > 0) {
				return a.pop();
			} else {
				return createObj(id);
			}
		}
		
		public function delObj(id:String, obj:*):void {
			if (_pool.hasOwnProperty(id)) {
				_pool[id].push(obj);
			}
		}
		
		public function clear():void {
		
		}
		
		private function createObj(id:String):* {
			if (!_map[id]) return null;
			if (!_pool.hasOwnProperty(id)) _pool[id] = [];
			return new _map[id]();
		}
	
	}
}

class Single {
	public function Single() { };
}