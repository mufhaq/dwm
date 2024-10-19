file_current=$(basename "$0")
file_all=$(find * -type f -name "*.sh" ! -name "*$file_current")
dir_local_bin="/home/$USER/.local/bin"
dir_current=$(pwd)

for file in $file_all; do
  if [ ! -x "$file" ]; then
    chmod +x "./$file"
  fi
  if [ ! -f "$dir_local_bin/$file" ]; then
    echo "linking $dir_current/$file -> $dir_local_bin/$file"
    ln -s "$dir_current/$file" "$dir_local_bin/$file"
  else
    echo "link $dir_local_bin/$file exist"
  fi
done
