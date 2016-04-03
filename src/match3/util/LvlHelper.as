package match3.util {
	
	public class LvlHelper {
		
		public static function xmlToArray(xml:XML):Array {
			var a:Array = [];
			var i:int;
			var j:int;
			//parse
			for (i = 0; i < xml.row.length(); i++) {
				a[i] = String(xml.row[i]).split(",");
			}
			//rotate
			var m:int = a.length;
			var n:int = a[0].length;
			var ret:Array = [];
			for (i = 0; i < n; i++) {
				ret[i] = [];
				for(j=m-1; j>=0; j--){
					ret[i][j] = a[j][i];
				}
			}

			return ret;
		}
	
	}
}