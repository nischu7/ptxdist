#!/bin/bash
#
# collect_sources.sh
# 
# b.buerger@pengutronix.de
# Fri Jul 16 19:23:52 CEST 2004

MAGIC=`whoami`-`eval date +%s`-tmp
STATE_DIR="state";
RULE_DIR="rules";
PKG_LIST="$STATE_DIR/packetlist"
SRC_TMP=/tmp/ptxdist_src-$MAGIC
SRC_TAR=$1/ptxdist_additional_sources.tar
PATCH_TAR=$1/ptxdist_additional_patches.tar
ZIP="bzip2"

echo "preparing ... " 
mkdir -p $SRC_TMP/src && echo "OK"
rm $SRC_TMP/src/*

rm $SRC_TAR
rm $PATCH_TAR $PATCH_TAR.gz $PATCH_TAR.bz2

echo "copying package-archives to $SRC_TMP"
while read package ; do {
cp -a $package $SRC_TMP/src/	
}
done < $PKG_LIST

echo "copying patch directories to $SRC_TMP"
cp -a patches feature-patches $SRC_TMP/

echo "making tar archives from $SRC_TMP"
tar -C $SRC_TMP -cvf $SRC_TAR src
tar -C $SRC_TMP -cvf $PATCH_TAR patches feature-patches

#echo "compressing patch archive"
#$ZIP $PATCH_TAR

echo "removing temp dir..."
rm -rf $SRC_TMP && echo "OK"
