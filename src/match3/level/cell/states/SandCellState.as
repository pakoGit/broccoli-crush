package match3.level.cell.states {
	import core.BroGlobal;
	import core.BroSprite;
	import match3.enum.CellNames;
	import match3.level.cell.Cell;
	import match3.managers.AssetManager;
	
	public class SandCellState extends NormalCellState {
		private var sprite:BroSprite;
		
		public function SandCellState(target:Cell) {
			super(target);
			_id = CellNames.SAND;
			sprite = new BroSprite(target.x, target.y, AssetManager.get().getData("sand"));
		}
		
		public override function apply():void {
			sprite.x = _target.x;
			sprite.y = _target.y;
			_target.addChild(sprite);
		}
		
		public override function exit():void {
			_target.removeChild(sprite);
		}
	}
}