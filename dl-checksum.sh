#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/mozilla/sops/releases/download

dl()
{
    local ver=$1
    local os=$2
    local suffix=$3
    local file=sops-${ver}.${suffix}
    local url=$MIRROR/$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $os `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin darwin
    dl $ver windows exe
    dl $ver linux linux
}

dl_ver ${1:-v3.6.1}
