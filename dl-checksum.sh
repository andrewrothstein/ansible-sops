#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/getsops/sops/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}.${arch}"
    local file="sops-${ver}.${platform}"
    local url=$MIRROR/$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin arm64
    dl $ver darwin amd64
    dl $ver linux amd64
    dl $ver linux arm64
}

dl_ver ${1:-v3.9.3}
