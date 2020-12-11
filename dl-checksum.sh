#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/genuinetools/img/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}-${arch}"
    local shafile="img-${platform}.sha256"
    local url=$MIRROR/$ver/$shafile
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(curl -sSL $url | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver linux amd64
}

dl_ver ${1:-v0.5.11}
