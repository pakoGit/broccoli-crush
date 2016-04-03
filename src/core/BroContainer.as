package core 
{

public class BroContainer extends BroBasic
{
	private var children:Array;
	
	public function BroContainer() 
	{
		children = [];
	}
	
	public function addChild(child:BroBasic):void {
		children.push(child);
	}
	
	public function removeChild(child:BroBasic):void {
		var i:int = children.indexOf(child);
		if((i < 0) || (i >= children.length))
			return;

		children.splice(i, 1);
	}
	
	public override function update():void {
		for (var i:int = 0; i < children.length; i++)
			children[i].update();
	}
	
	public override function draw():void {
		for (var i:int = 0; i < children.length; i++)
			children[i].draw();
	}
	
}
}