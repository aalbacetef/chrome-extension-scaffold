#!/usr/bin/env fish 

set script_src (realpath (status current-filename))
set root_dir (dirname (dirname $script_src))
set dist_dir $root_dir/dist
set app_build_dir $root_dir/build/app 
set data_dir $root_dir/data/extension
set asset_dir $dist_dir/assets

function log_msg -a str
  printf "(package app) %s\n" $str
end 

if ! test -d $dist_dir 
  log_msg "dist dir '$dist_dir' doesn't exist"
  return 1
end 

if ! test -d $asset_dir 
  log_msg "asset dir '$asset_dir' doesn't exist"
  return 1
end 


# build manifest 
set build_manifest $app_build_dir/.vite/manifest.json
set extension_manifest $dist_dir/manifest.json 

if ! test -f $build_manifest 
  log_msg "build manifest '$build_manifest' doesn't exist"
  return 1
end

# copy index.html 
cp $app_build_dir/index.html $dist_dir/index.html 


# fetch asset names
set js_name (jq -r '."index.html".file' $build_manifest)
set css_name (jq -r '."index.html".css[0]' $build_manifest)

# copy assets 
cp $app_build_dir/$js_name $asset_dir/
cp $app_build_dir/$css_name $asset_dir/ 

# copy icons and images
cp $data_dir/icons/* $dist_dir/icons/

cp $data_dir/images/* $dist_dir/images/
