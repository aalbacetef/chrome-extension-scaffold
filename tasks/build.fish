#!/usr/bin/env fish 

set -l script_src (realpath (status current-filename))
set -l root_dir (dirname (dirname $script_src))
set -l build_dir $root_dir/build 
set -l data_dir $root_dir/data
set -l dist_dir $root_dir/dist 

function log_msg -a str 
  printf "(build) %s\n" $str 
end 

if test -d $dist_dir 
  # @TODO: add environment variable to skip this step
  log_msg "found previous dist dir, clearing..."
  rm -r $dist_dir 
end 

mkdir $dist_dir 

log_msg "creating destination directories:"
set sub_dirs assets icons images scripts 

for sub in $sub_dirs
  mkdir $dist_dir/$sub 
  log_msg "  - $sub"
end 

log_msg "copying extension manifest.json"
cp $data_dir/extension/manifest.json $dist_dir/ 

log_msg "running build scripts"
set scripts package-app.fish package-background.fish package-content.fish 

for s in $scripts
  $root_dir/tasks/$s 
  set st $status 
  log_msg " - $s => exit code: $st"

  if ! test $st -eq 0 
    log_msg "exiting..."
    return 1
  end 

end 


log_msg "done"
