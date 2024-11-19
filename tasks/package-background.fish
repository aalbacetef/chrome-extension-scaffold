#!/usr/bin/env fish 

set -l script_src (realpath (status current-filename))
set -l root_dir (dirname (dirname $script_src))
set -l bg_build_dir $root_dir/build/background 
set -l dist_dir $root_dir/dist


#
# copy background script to dist/scripts/
#
set -l script_name (jq -r '."main.ts".file' $bg_build_dir/.vite/manifest.json)
cp $bg_build_dir/$script_name $dist_dir/scripts/background.js
