#!/usr/bin/env fish 

set script_src (realpath (status current-filename))
set root_dir (dirname (dirname $script_src))
set content_build_dir $root_dir/build/content 
set dist_dir $root_dir/dist


set build_manifest $content_build_dir/.vite/manifest.json

set script_name (jq -r '."main.ts".file' $build_manifest)
cp $content_build_dir/$script_name $dist_dir/scripts/content.js

set style_name (jq -r '."main.ts".css[0]' $build_manifest)
cp $content_build_dir/$style_name $dist_dir/scripts/styles.css
