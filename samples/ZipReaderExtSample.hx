package ;

import org.zamedev.lib.ZipReaderExt;

class ZipReaderExtSample {
    public static function main() {
        var zipReaderExt = ZipReaderExt.fromPath("sample.zip");

        trace('Entry count: ${zipReaderExt.entryList.length}');

        for (key in zipReaderExt.entryMap.keys()) {
            trace('Entry name: ${key}');
            trace("Entry content: " + zipReaderExt.entryAsString(key));
        }
    }
}
