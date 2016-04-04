package match3.level.cell.states {
	
public interface IState {
	function apply():void;
	function exit():void;
	function get id():int;
}
}