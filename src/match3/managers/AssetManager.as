package match3.managers {
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import match3.util.LvlHelper;
	
	public class AssetManager {
		[Embed(source = "../../../bin/data/background.jpg")]private var _bg_:Class;
		//---atlas would be better--------------------------------------------------
		[Embed(source = "../../../bin/data/chip_1.png")]private var _chip1_:Class;
		[Embed(source = "../../../bin/data/chip_2.png")]private var _chip2_:Class;
		[Embed(source = "../../../bin/data/chip_3.png")]private var _chip3_:Class;
		[Embed(source = "../../../bin/data/chip_4.png")]private var _chip4_:Class;
		[Embed(source = "../../../bin/data/chip_5.png")]private var _chip5_:Class;
		[Embed(source = "../../../bin/data/emitter.png")]private var _emitter_:Class;
		[Embed(source = "../../../bin/data/cell.png")]private var _cell_:Class;
		[Embed(source = "../../../bin/data/sand.png")]private var _sand_:Class;
		[Embed(source = "../../../bin/data/box.png")]private var _box_:Class;
		//---------------------------------------------------------------------------
		private static var _instance:AssetManager;
		private var _map:Object = { };
		
		public function AssetManager() {
			if (_instance) throw Error("AssetManager: Singleton");
			var ids:Array = ["bg", "chip1", "chip2", "chip3", "chip4", "chip5", "cell", "emitter", "sand", "box"];
			var classes:Array = [_bg_, _chip1_, _chip2_, _chip3_, _chip4_, _chip5_, _cell_, _emitter_, _sand_, _box_];
			var i:int = ids.length;
			while (i--)
				_map[ids[i]] = (new classes[i] as Bitmap).bitmapData;
			_instance = this;
		}
		
		public static function get():AssetManager {
			if (!_instance) {
				new AssetManager;
			}
			return _instance;
		}
		
		public function load(path:String, id:String, callback:Function = null):void {
			if (_map[id]) throw Error("Already loaded");
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(IOErrorEvent.IO_ERROR, onDataError);
			loader.addEventListener(Event.COMPLETE, function(e:Event):void {
				var xml:XML = new XML(e.target.data);
				_map[id] = {name:xml.level.@name, array:LvlHelper.xmlToArray(xml.level[0])}; //TODO loader
				if (callback != null) callback(_map[id]);
			});
			var req:URLRequest = new URLRequest(path+"?id="+id);
			loader.load(req);
		}
		
		public function getData(id:String):* {
			return _map[id];
		}
		
		private function onDataError(e:IOErrorEvent):void {
			trace("AssetManager: Init fail");
		}
	}
}