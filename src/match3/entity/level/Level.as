package match3.entity.level {
	import core.BroContainer;
	import core.BroGlobal;
	import flash.display.BitmapData;
	import match3.entity.Chip;
	import match3.entity.Emitter;
	import match3.enum.CellNames;
	import match3.enum.StateNames;
	import match3.global.GVar;
	import match3.entity.level.cell.Cell;
	import match3.managers.AssetManager;
	import match3.util.ObjPool;
	
	public class Level {
		public var name:String;
		public var x:Number;
		public var y:Number;
		
		private var _tiles:Array;
		private var _chips:Array;
		private var _emitters:Array;
		private var _pool:ObjPool;
		
		private var _colums:int;
		private var _rows:int;
		
		//private var _cont:BroContainer;
		private var _cellCont:BroContainer;
		private var _chipCont:BroContainer;
		
		public function Level(name:String, arr:Array) {
			_pool = ObjPool.instance;
			_pool.registry("chip", Chip);
			
			_cellCont = new BroContainer;
			BroGlobal.scene.addChild(_cellCont);
			_chipCont = new BroContainer;
			BroGlobal.scene.addChild(_chipCont);
			
			_tiles = [];
			_chips = [];
			_emitters = [];
			this.name = name;
			build(arr);
		}
		
		public function build(arr:Array):void {
			_colums = arr.length;
			_rows = arr[0].length;
			x = (BroGlobal.camera.width >> 1) - (_colums * GVar.TILE_W >> 1);
			y = (BroGlobal.camera.height >> 1) - (_rows * GVar.TILE_H >> 1);

			for (var i:int = 0; i < _colums; i++) {
				_tiles[i] = [];
				_chips[i] = [];
				for (var j:int = 0; j < arr[i].length; j++) {
					var tid:int = arr[i][j];
					_tiles[i][j] = tid < 0?0:tid;
					_chips[i][j] = 0;
					if (tid <= 0) continue;
					var cell:Cell = new Cell(x + i * GVar.TILE_W, y + j * GVar.TILE_H);
					_cellCont.addChild(cell);
					if (tid == CellNames.SAND) cell.state.change(StateNames.SAND);
					else if (tid == CellNames.EMITTER) {
						var emitter:Emitter = new Emitter(cell.x, cell.y, onEmiiterReady);
						_cellCont.addChild(emitter);
						_emitters.push(emitter);
					}
				}
			}
		}
		
		private function onEmiiterReady(x:Number, y:Number):void {
			var i:int = int((x - this.x) / GVar.TILE_W);
			var j:int = int((y - this.y) / GVar.TILE_H);
			addChip(i, j);
		}
		
		public function addChip(i:int, j:int):void {
			if (_chips[i][j] != 0) return;
			var chip:Chip = _pool.getObj("chip");
			chip.x = x + i * GVar.TILE_W;
			chip.y = y + j * GVar.TILE_H;
			chip.type = int(Math.random() * 5) + 1;
			//var chip:Chip = new Chip(x + i * GVar.TILE_W, y + j * GVar.TILE_H, Math.random() * 5 + 1);
			_chipCont.addChild(chip);
			_chips[i][j] = chip;
		}
		
		public function isCellFree(i:int, j:int):Boolean {
			var tileID:int = _tiles[i][j];
			return  ((tileID!= CellNames.BOX && tileID > 0) && _chips[i][j] == 0)
		}
		
		public function get tiles():Array { return _tiles; }
		public function get chips():Array { return _chips; }
		public function get emitters():Array { return _emitters; }
		public function get colums():int { return _colums; }
		public function get rows():int { return _rows; }
	}
}