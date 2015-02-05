package org.zamedev.lib;

using StringTools;

class FileUtils {
	// deprecated, use haxe.io.Path.directory() instead
	public static function dirname(path:String, appendSeparator:Bool=false):String {
		return (~/\//.match(path) ? (~/\/[^\/]+$/.replace(path, "") + (appendSeparator ? "/" : "")) : "");
	}

	// deprecated, use haxe.io.Path.extension() instead
	public static function ext(path:String, leaveDot:Bool=true):String {
		return ~/^.+\./.replace(path, leaveDot ? "." : "");
	}

	// deprecatd, use haxe.io.Path.normalize() instead
	public static function normalize(basePath:String, path:String):String {
		basePath = dirname(basePath);

		while (path.startsWith("../")) {
			basePath = dirname(basePath);
			path = ~/^\.\.\//.replace(path, "");
		}

		return (basePath.length == 0 ? path : basePath + "/" + path);
	}
}
