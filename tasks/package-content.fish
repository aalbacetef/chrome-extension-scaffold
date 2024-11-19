#!/usr/bin/env fish 

set -l script_src (realpath (status current-filename))
set -l root_dir (dirname (dirname $script_src))
set -l content_build_dir $root_dir/build/content 
set -l dist_dir $root_dir/dist


set -l build_manifest $content_build_dir/.vite/manifest.json

#
# copy content script to dist/scripts/
#
set -l script_name (jq -r '."main.ts".file' $build_manifest)
cp $content_build_dir/$script_name $dist_dir/scripts/content.js

#
# copy content styles to dist/scripts/
#
set -l style_name (jq -r '."main.ts".css[0]' $build_manifest)
cp $content_build_dir/$style_name $dist_dir/scripts/styles.css
