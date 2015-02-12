package ;

import sys.io.File;

class ZipReaderSample {
    public static function main() {
        try {
            trace((new haxe.zip.Reader(File.read("sample.zip", true))).read().length);
        } catch (e:Dynamic) {
            trace("haxe.zip.Reader failed: " + Std.string(e));
        }

        try {
            trace((new org.zamedev.lib.ZipReader(File.read("sample.zip", true))).read().length);
        } catch (e:Dynamic) {
            trace("org.zamedev.lib.ZipReader failed: " + Std.string(e));
        }
    }
}
