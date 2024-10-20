home_dir="/home/$USER"
log_dir="$home_dir/.log"
ss_dir="$home_dir/Pictures/screenshot"
opts=""
if [ ! -d "$log_dir" ]; then
  mkdir -p "$log_dir"
fi
if [ ! -d "$ss_dir" ]; then
  mkdir -p "$ss_dir"
fi
if [ "$1" = "-s" ]; then
  opts+="-s"
fi
out=$(scrot "$ss_dir/screenshot-%s__%d-%m-%Y_%H:%M:%S__\$wx\$h.png" $opts -e "echo \$n")
notify-send 'Screenshot' "$out"
echo "$out" >> ~/.log/scrot-log
