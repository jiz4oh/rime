#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

BASE=$(pwd)
RIME_DIR=~/Library/Rime

mkdir -pv bak
for file in *.yaml *.gram *.txt rime.lua; do
  [ -e "$RIME_DIR/$file" ] && mv -v "$RIME_DIR/$file" bak/"$file"
  ln -sfv "$BASE/$file" "$RIME_DIR/$file"
done

for dir in cn_dicts en_dicts opencc; do
  [ -e "$RIME_DIR/$dir" ] && mv -v "$RIME_DIR/$dir" bak/
  
  ln -svf "$BASE/$dir" "$RIME_DIR"
done
