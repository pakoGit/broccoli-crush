package core 
{
	import flash.geom.Point;

public class BroGO extends BroBasic
{
	public var x:Number;
	public var y:Number;
	public var width:Number;
	public var height:Number;
	
	public function BroGO() 
	{
		x = 0;
		y = 0;
	}
	
	public function overlap(point:Point):Boolean {
		return (point.x > x  && point.x < x + width && point.y > y && point.y < y + height);
	}
	
}
}