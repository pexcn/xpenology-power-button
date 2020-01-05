#!/bin/sh

rm -f *.spk

cd package
tar -zcf ../package.tgz *
cd ..
rm -r package
tar --exclude=".*" --exclude="repack.sh" -cf power-button.spk *

mkdir package
tar -zxf package.tgz -C package
rm package.tgz
