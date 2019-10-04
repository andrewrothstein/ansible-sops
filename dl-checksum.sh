#!/usr/bin/env sh
VER=${1:-3.4.0}
DIR=~/Downloads
MIRROR=https://github.com/mozilla/sops/releases/download/${VER}

dl()
{
    local os=$1
    local suffix=$2
    local file=sops-${VER}.${suffix}
    local url=$MIRROR/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $os `sha256sum $lfile | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl darwin darwin
dl windows exe
dl linux linux
