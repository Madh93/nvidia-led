#! /bin/bash

animation() {
  test_range 0 100 $1 || show_help
  test_value 1 100 $2 || show_help
  interval=$(echo "$(($2*2)) 100" | awk '{printf "%.2f", $1/$2}')

  while true; do
    set_brightness $max
    sleep 0.1
    set_brightness $min
    sleep 0.1
    set_brightness $max
    sleep 0.1
    set_brightness $min
    sleep $interval
  done
}

show_info() {
  echo "dual-flashing <intensity> <interval>          Double flashing effect"
}

show_help() {
  echo "Usage: nvidia-led dual-flashing <intensity> <interval>"
  echo -e "\nValues:"
  echo "  intensity     Type: Range [0-100]. E.g., 20-80, 10-50, 0-100"
  echo "  interval      Type: Integer [1-100]. E.g., 20, 100, 70"
  exit 0
}

case "$1" in 
  help) show_help ;;
  info) show_info ;;
  *)  animation $1 $2 ;;
esac