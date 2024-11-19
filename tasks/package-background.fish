#!/usr/bin/env fish 

set script_src (realpath (status current-filename))
set root_dir (dirname (dirname $script_src))
set bg_build_dir $root_dir/build/background 
set dist_dir $root_dir/dist


set script_name (jq -r '."main.ts".file' $bg_build_dir/.vite/manifest.json)
cp $bg_build_dir/$script_name $dist_dir/scripts/background.js
