#!/bin/bash

haxe -lib zame-fileutils -x ZipReaderSample.hx
[ -e ZipReaderSample.hx.n ] && rm ZipReaderSample.hx.n

echo

haxe -lib zame-fileutils -x ZipReaderExtSample.hx
[ -e ZipReaderExtSample.hx.n ] && rm ZipReaderExtSample.hx.n
