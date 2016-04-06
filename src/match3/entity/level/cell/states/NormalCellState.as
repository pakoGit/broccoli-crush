package match3.entity.level.cell.states {
	import match3.enum.CellNames;
	import match3.entity.level.cell.Cell;
	
	public class NormalCellState implements IState {
		protected var _target:Cell;
		protected var _id:int;
		
		public function NormalCellState(target:Cell) {
			_target = target;
			_id = CellNames.FREE;
		}
		
		public function apply():void {
		
		}
		
		public function exit():void {
		
		}
		
		public function get id():int { return _id; }
	
	}
}