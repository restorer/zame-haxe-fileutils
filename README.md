# File utils for Haxe

  - ZipReader
  - ZipReaderExt

[About](http://blog.zame-dev.org/5-more-things-i-dont-like-in-haxe-and-how-to-fix-them/)

## Installation

```
haxelib git zame-fileutils https://github.com/restorer/zame-haxe-fileutils.git
```


### ZipReader

`haxe.zip.Reader` is fantastic and very useful class, but it can’t open some .zip files, and throws "Unsupported flags" exception.
Fortunately, it can be fixed by commenting few lines in it – that is `ZipReader` class.

```haxe
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
```

### ZipReaderExt

Allows to work with zip files in an easy way.

```haxe
var zipReaderExt = ZipReaderExt.fromPath("sample.zip");

trace('Entry count: ${zipReaderExt.entryList.length}');

for (key in zipReaderExt.entryMap.keys()) {
    trace('Entry name: ${key}');
    trace("Entry content: " + zipReaderExt.entryAsString(key));
}
```

## Product support

This library is finished. Later I have plant to merge several smaller libraries into bigger one.

| Feature | Support status |
|---|---|
| New features | No |
| Non-critical bugfixes | No |
| Critical bugfixes | Yes |
| Pull requests | Accepted (after review) |
| Issues | Monitored, but if you want to change something - submit a pull request |
| Estimated end-of-life | Up to 2017 (new library will be created later) |
