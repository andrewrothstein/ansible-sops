#!/usr/bin/env sh
VER=3.3.1
DIR=~/Downloads
MIRROR=https://github.com/mozilla/sops/releases/download/${VER}

dl()
{
    OS=$1
    SUFFIX=$2
    FILE=sops-${VER}.${SUFFIX}
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $OS `sha256sum $LFILE | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl darwin darwin
dl windows exe
dl linux linux
