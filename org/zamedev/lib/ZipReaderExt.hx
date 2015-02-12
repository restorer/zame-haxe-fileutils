package org.zamedev.lib;

import haxe.io.Bytes;
import haxe.io.Input;
import haxe.zip.Entry;
import sys.io.File;

class ZipReaderExt {
	private var _entryList:List<Entry>;
	private var _entryMap:Map<String, Entry>;

	public var entryList(get, never):List<Entry>;
	public var entryMap(get, never):Map<String, Entry>;

	private function new(input:Input) {
		_entryList = (new ZipReader(input)).read();
		_entryMap = new Map<String, haxe.zip.Entry>();

		for (entry in _entryList) {
			_entryMap[entry.fileName] = entry;
		}
	}

	public static function fromPath(path:String) {
		return new ZipReaderExt(File.read(path, true));
	}

	public static function fromInput(input:Input) {
		return new ZipReaderExt(input);
	}

	public function entryAsBinary(entryName:String):Null<Bytes> {
		return haxe.zip.Reader.unzip(_entryMap[entryName]);
	}

	public function entryAsString(entryName:String):String {
		return Std.string(haxe.zip.Reader.unzip(_entryMap[entryName]));
	}

	@:noCompletion
	private function get_entryList():List<Entry> {
		return _entryList;
	}

	@:noCompletion
	private function get_entryMap():Map<String, haxe.zip.Entry> {
		return _entryMap;
	}
}
